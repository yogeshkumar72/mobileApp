import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:mphc_app/pages/home/home.dart';
import 'package:mphc_app/pages/login/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:pinput/pinput.dart';

// int resendCount = 0;

class Register extends StatefulWidget {
  final String mobileNo;
  Register({super.key,
  required this.mobileNo,});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
//------------------send otp-------------------
String ? otpResponse;
Map ?    otpResult;
List ?   otpData;
bool ?   otpAvailable;

//------------------check otp-------------------
String ? otpcResponse;
Map ?    otpcResult;
List ?   otpcData;
bool ?   otpcAvailable;

int validForResend = 0;  //-----------visible for Resend---------------

final TextEditingController validateOtp = TextEditingController();
final FocusNode _pinPutFocusNode = FocusNode();

String ? _status;
bool ? visibleResend = false;


int seconds = 30;
  Timer? timer;

  Future<void> startTimer() async{
    timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (seconds > 0) {
        setState(() {
          debugPrint('$seconds seconds remaining');
          seconds--;
        });
      } else {
        debugPrint('Time is up!');
        setState(() {
          visibleResend = true;
          seconds=30;
        });
        timer.cancel();
      }
    });
  }




 // ------------------------------------MPHC Login------------------------------------------------
    Future getOTP() async{
    http.Response otp;
    try{
        otp= await http.post(Uri.parse('http://ns2.mphc.in/new_mobile_app_api/send_otp.php'),
        body:{
          'mobile_number' : widget.mobileNo.toString(),
          }
        );
        if(otp.statusCode==200){
          otpResponse = otp.body;
          otpResult  = json.decode(otp.body);
          debugPrint('-------------------OTP sent-------------------------');
          otpData = otpResult?['results'];
          debugPrint(otpData.toString());
          // ---------------delay30second-----------
        }
      }
    catch(e){
      debugPrint('$e');
      }
    }


  // -------------------------------Mphc Check OTP---------------------------
    Future checkOTP(otp) async{
        http.Response checkotp;
        try{
            checkotp= await http.post(Uri.parse('http://ns2.mphc.in/new_mobile_app_api/check_otp.php'),
            body:{
              'mobile_number' :widget.mobileNo.toString(),
              'otp' : validateOtp.text.toString(),
            });
            if(checkotp.statusCode==200){
              otpcResponse = checkotp.body;
              otpcResult  = json.decode(checkotp.body);
              debugPrint('-------------------OTP check-------------------------');
              otpcData = otpcResult?['results'];
              // debugPrint(otpcData!.toString());
              // debugPrint(otpcData![0].toString());
              debugPrint(otpcData![0]['STATUS']);
              if(otpcData![0]['STATUS']=='YES'){
                _status = 'YES';
                _setUser();
                return true;
                // make a route
              }
                setState((){
                  // resendCount++;
                  // if(resendCount>=3){
                  //   visibleResend = true;
                  // }

                });
                _setApiCalled();
                return false;     
            }
          }
          catch(e){ debugPrint('$e');}
      }
    


    Future<dynamic> getUser() async {
        SharedPreferences store = await SharedPreferences.getInstance();
        return store.getString('validate');
    }
    
    Future<dynamic> getChkRequestCount() async {
      SharedPreferences store = await SharedPreferences.getInstance();
      try{
       int i = await int.parse(store.getString('_totCheckOTP') ?? '0'); // asynchronous suspension here
        if(i>=3){return true;}
        return false;
      }catch(e){debugPrint('Error: $e');}
    }

    void clearOTP(){
      validateOtp.clear();
      _pinPutFocusNode.requestFocus();
    }

    Future _setUser() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        prefs.setString('validate', _status.toString());
        prefs.setString('mobile', widget.mobileNo.toString());
        debugPrint(prefs.getString('validate'));
      });
      return;
    }

    Future _setApiCalled() async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      setState((){
        validForResend++;
        prefs.setInt('_totCheckOTP', validForResend);
        debugPrint(prefs.getString('_totCheckOTP'));
      });
    }

  @override
  void initState() {
    getOTP();
     startTimer();
    debugPrint("---------------getOTP() from initSatate---------------");
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
  }






  
  //=========================================================================================================

  @override
  Widget build(BuildContext context) {

    return PopScope(
       canPop: false,
        onPopInvoked : (didPop){
         if(getUser()=='YES'){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Home()));
         }
        },
      child: Scaffold(
        // appBar: AppBar(
        //   // title: const Text("Register"),
        //   // centerTitle: true,
        // ),
        body: Center(
          child:Container(
            decoration: const  BoxDecoration(gradient: LinearGradient(begin: Alignment.topLeft,end:Alignment.bottomRight,colors: [
              // Color.fromARGB(255, 255, 123, 62),
              Color.fromARGB(255, 255, 251, 219),
              Color.fromARGB(255, 183, 215, 242),
            ])),
            width: double.infinity,
            height: double.infinity,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                  
                Text("OTP Sent to Your Mobile No. ${widget.mobileNo.toString()}",style:const TextStyle(fontSize: 17),),
                const SizedBox(height: 20),
            
                Form(
                  // key: ,
                  child: Pinput(
                    length: 4,
                    // scrollPadding: EdgeInsets.all(5),
                    focusNode: _pinPutFocusNode,
                    controller: validateOtp,
                    // onCompleted: (pin) => _showSnackBar(pin) ,
                    // onCompleted:(pin)=>checkOTP(pin),

                //     onCompleted: (pin) =>{
                //     debugPrint("==================otpForSubmit :::::: ::::: =====$pin"),
                //      _showSnackBar(pin),
                // },
                    
                    submittedPinTheme: PinTheme(
                          width: 60, // Adjust the width as needed
                          height: 60, // Adjust the height as needed
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                               // border: Border.all(color: Colors.blue.withOpacity(.5)),
                              // color:Color.fromARGB(23, 54, 70, 244),
                               color:const Color.fromARGB(24, 56, 58, 150),
                              border:Border.all(color:Theme.of(context).colorScheme.onSecondaryContainer),
                          ),
                    ),
                    followingPinTheme: PinTheme(
                          width: 60, // Adjust the width as needed
                          height: 60, // Adjust the height as needed
                          decoration: BoxDecoration(
                          color:const Color.fromARGB(24, 56, 58, 150),
                          borderRadius: BorderRadius.circular(5.0),
                          // border:Border.all(color:Theme.of(context).colorScheme.secondary),
                          ),
                    ),
                    focusedPinTheme: PinTheme(
                          width: 60, // Adjust the width as needed
                          height: 60, // Adjust the height as needed      
                          decoration: BoxDecoration(
                           color:const Color.fromARGB(24, 56, 58, 150),
                             borderRadius: BorderRadius.circular(5.0),
                          ),
                    ),
                  ),
                ),
                  
                const SizedBox( height: 20, ),
                  
                // Text(" Request count : resendCount \n Btn-Status: $visibleResend "),
                Text(seconds==0 || seconds==30?"":"You can send next oto in  : $seconds Seconds" ,style:TextStyle(color:Color.fromARGB(255, 0, 39, 137))),
                
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                  
                children:[
                 Flexible(
                   child: TextButton(
                    onPressed: () async {
                    if(visibleResend!){
                      getOTP();
                      startTimer();
                    
                     setState((){
                      visibleResend = false;
                      seconds=30;
                      // resendCount = 0; ----------counter 
                     });
                      // startTimer();
                     }
                     else{
                      return;
                     }
                       
                    debugPrint('-----------GetOTP() method called----------');
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color:visibleResend!?const Color.fromARGB(255, 207, 103, 23): const Color.fromARGB(87, 120, 119, 119),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      width: double.infinity,
                      child: const Text(
                        'Resend OTP',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                 ),
              
              
                  
                Flexible(
                    child: TextButton(
                    onPressed: () async {
                      final otp = validateOtp.text;
                      if (otp.isNotEmpty) {
                        bool isOtpValid = await checkOTP(otp);
                          if (isOtpValid) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
                          } else {
                            debugPrint('Invalid OTP');
                            notValid(context);
                            clearOTP();
                          }
                      } else {
                        notValid(context);
                        clearOTP();
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 4, 37, 106),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      width: double.infinity,
                      child: const Text(
                        'Continue',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    ),
                  ),
              
                  
                ]
              ),
            ),
            
            const SizedBox(
              height: 20,
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            
                const Flexible(child: Text("Did You entered a wrong Number ?",style:TextStyle(fontSize: 15))),
            
                Flexible(child:GestureDetector(
                  onTap: ()=>{
                    Navigator.push(context,MaterialPageRoute(builder: (context)=>Login())),
                  },
                  child: const Padding(
                    padding:EdgeInsets.only(left:10),
                    child: Text("Re-Enter Mobile",textAlign: TextAlign.center, style:TextStyle(decoration:TextDecoration.underline,color:Color.fromARGB(255, 53, 58, 110), fontSize: 15, fontWeight: FontWeight.bold))),
                )),
                
              ],
            ),
                  
                  
                  
    
              ]
            ),
          )
        ),
      ),
    );
  }


  void _showSnackBar(String pin) {
    final snackBar = SnackBar(
      content: Text('Pin Submitted. Value: $pin'),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  
}



void notValid(BuildContext context){
  showDialog(context: context, builder: (BuildContext context){
    return const AlertDialog(
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
      title:Text('Invalid OTP'),
      content:Text('Resend OTP and Try Again !',style:TextStyle(fontSize: 16)),
    );
  });
}