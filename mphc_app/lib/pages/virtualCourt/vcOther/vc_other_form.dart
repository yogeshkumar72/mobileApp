// import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mphc_app/pages/home/home.dart';
// import 'package:mphc_app/pages/home.dart';
import 'package:mphc_app/pages/virtualCourt/vcOther/virtual_court.dart';
import 'package:mphc_app/pages/virtualCourt/vcLawyer/vc_lawyer_form.dart';
import 'vc_other_api.dart';

class VCUserForm extends StatefulWidget {
  const VCUserForm({super.key});

  @override
  State<VCUserForm> createState() => _VCUserFormState();
}

class _VCUserFormState extends State<VCUserForm> {

VCAPI api = VCAPI();

//-----------------------Virtaul Court Form Storage moved in api_vc----------------------------
  // String ? option;
  // String ? enrollNo;
  // String ? enrollYear;
  // String ? userName;
  // String ? mobileNo;

//------------------------Toggle between User Type------------------------------
  bool   ? seniorAdv = false;
  bool   ? guest = false;
  bool   ? advocateGeneralOfficer = false; 

  TextEditingController ? mobileController;
  TextEditingController ? userNameController;
 
 @override
  void initState() {
    

    api.clearVCData();
    guest = false;
    seniorAdv =false;
    advocateGeneralOfficer = false;
    super.initState();
    
  }
  @override
  void dispose() {
    api=VCAPI();
    super.dispose();
  }

  //  ------------------------------Build Context Virtual Court-------------------------------------------------------------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title:const Text('Virtual Court'),
           leading: IconButton(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context)=>const Home()));}, icon: const Icon(Icons.arrow_back)),
          flexibleSpace: Container(
                decoration: const BoxDecoration(gradient:LinearGradient(colors: [
                  Color.fromARGB(174, 172, 192, 220),
                  Color.fromARGB(221, 255, 255, 255),
                ])),
              ),
        ),
        body:Container(
          height: double.infinity,
          decoration:const BoxDecoration(
          color:Colors.white,
          image: DecorationImage(
          image:AssetImage('images/mphc02.jpg'),fit:BoxFit.contain,
          alignment: Alignment.bottomCenter,
          opacity: 1,        
           colorFilter: ColorFilter.mode(Color.fromARGB(255, 2, 21, 71), BlendMode.screen),
            ),
          ),
          padding:const EdgeInsets.fromLTRB(40, 5, 40, 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // -------------------------------------Lawer and Other User Toggle------------------------------------------------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:[
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const VCLawyerForm()));
                    },child:Container(decoration:BoxDecoration(color:const Color.fromARGB(255, 68, 74, 108),borderRadius: BorderRadius.circular(10)), padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),child: const Text('Lawyer',style: TextStyle(color:Colors.white),))),
                    TextButton(onPressed: (){
                    },child:Container(decoration:BoxDecoration(color:const Color.fromARGB(255, 68, 74, 108),borderRadius: BorderRadius.circular(10)), padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),child: const Text('Other Users',style: TextStyle(color:Colors.white),))),
                    ]
                ),
                const SizedBox(height: 20),
                //----------------------------------------------Select User Type-------------------------------------
                const Text('VC User Type',textAlign: TextAlign.start,style:TextStyle(fontWeight: FontWeight.bold)),
                 InkWell(
                 onTap: () {
                 showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor:const Color.fromARGB(255, 255, 255, 255),
                      shape:const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                        // shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(50))),
                        title: const Text('Select User Type',style:TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                        content: Container(
                        margin:const  EdgeInsets.fromLTRB(0, 40, 0, 0),
                        height: 150,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:[
                            InkWell(
                              onTap: (){
                              setState(() {
                                api.clearVCData();
                                seniorAdv = true;
                                guest =false;
                                advocateGeneralOfficer = false;
                              });
                              Navigator.of(context).pop();
                             },
                            child:Container(padding:const EdgeInsets.all(10),child: const Text('Senior Advocate',style: TextStyle(fontSize:18),)),
                            ),
                            InkWell(
                              onTap: (){
                              setState(() {
                                 api.clearVCData();
                                 seniorAdv = false;
                                 guest =false;
                                 advocateGeneralOfficer= true;
                              });
                              Navigator.of(context).pop();
                             },
                            child:Container(padding:const EdgeInsets.all(10),child: const Text('Advocate General officer',style:TextStyle(fontSize: 17))),
                            ),
                            InkWell(
                              onTap: (){
                              setState(() {
                                api.clearVCData();
                                seniorAdv = false;
                                advocateGeneralOfficer =false;
                                guest =true;
                              });
                              Navigator.of(context).pop();
                             },
                             child:Container(padding:const EdgeInsets.all(10),child: const Text('Guest',style:TextStyle(fontSize: 18))),
                            ),
                        ]
                       ),
                      ),
                    );
                  },
                 );
               },
               child: Container(
                width:double.infinity,
                  padding:const EdgeInsets.symmetric(horizontal:50,vertical:14),
                  decoration: BoxDecoration(
                    color:const Color.fromARGB(255, 68, 74, 108),
                    borderRadius: BorderRadius.circular(14),
                  ),
                child: const Center(child: Text('Select User Type',style:TextStyle(color:Color.fromARGB(242, 255, 255, 255),fontWeight: FontWeight.bold)),),
                ),
               ),
               const SizedBox(height: 20),
               // ----------------------------------------------Guest--------------------------        
               Visibility(
                visible: guest!,
                child: SingleChildScrollView(
                child: Column(
                children:[
                  // const Row(
                  //   children: [
                  //     Text('  Select Establishment',style: TextStyle(color: Color.fromARGB(255, 62, 68, 107),fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                  //   ],
                  // ),
                  //  Container(
                  //   padding:const EdgeInsets.symmetric(vertical:4,horizontal: 10),
                  //   decoration: BoxDecoration(border:Border.all(width: 1,color:const Color.fromARGB(255, 62, 68, 107), ),borderRadius: BorderRadius.circular(18)),
                  //    child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //      children: [
                  //       const Icon(Icons.location_city,color:Color.fromARGB(255, 62, 68, 107), ),
                  //        DropdownButton<String>(
                  //             underline: Container(),
                  //             value: establish,
                  //             hint:  const Text('Select Bench'),
                  //             onChanged: (String? newValue) {
                  //               if (newValue != null) {
                  //                 setState(() {
                  //                   // vcjudgeData?.clear();
                  //                   // dropListCode?.clear();
                  //                   // dropListUser?.clear();
                  //                     establish = newValue;
                  //                     debugPrint(establish);
                  //                   // dropListUser =null;
                  //                   // dropListCode =null;
                  //                   // Navigator.pushReplacement(
                  //                   // context,
                  //                   // MaterialPageRoute(
                  //                   // builder: (BuildContext context) => super.widget));
                  //                   api.vcjudge();     
                  //                 });
                  //               }
                  //             },
                  //             items: const [
                  //               DropdownMenuItem<String>(
                  //                 value: '01',
                  //                 child: Text('Principle Seat Jabalpur'),
                  //               ),
                  //               DropdownMenuItem<String>(
                  //                 value: '02',
                  //                 child: Text('Bench Indore'),
                  //               ),
                  //               DropdownMenuItem<String>(
                  //                 value: '03',
                  //                 child: Text('Bench Gwalior'),
                  //               ),
                  //             ],
                  //           ),
                  //      ],
                  //    ),
                  //  ),
                    const SizedBox(
                      height: 20,
                    ),
                  TextField(
                    decoration:InputDecoration(
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      prefixIcon:const Icon(Icons.person),
                      hintText: 'Name',
                    ),
                    onChanged: (value){
                      setState(() {
                       userName = value;
                       option = 'Guest';
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    keyboardType:TextInputType.number,
                    maxLength: 10,
                    decoration: InputDecoration(
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      prefixIcon:const Icon(Icons.phone_android),
                      hintText: 'Mobile No.',
                    ),
                    onChanged: (value){
                      setState(() {
                        mobileNo = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  //--------------------------------Button will send OTP to Guest User ---------------
                  TextButton(
                    onPressed: (){
                        ////////////////////////////////////////////////////////////////
                        debugPrint('$mobileNo $userName $option');
                        if(mobileNo!=null && userName!=null && mobileNo!.length==10){
                          api.sendGuestOTP();
                          showDialog(context: context, builder: (BuildContext context){
                            return AlertDialog(
                              shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                              title:const Text(' Verify OTP '),
                              content:Container(
                                height: 300,
                                child:Column(
                                  mainAxisAlignment:MainAxisAlignment.center,
                                  children:[
                                     TextField(
                                         keyboardType:TextInputType.number,
                                         maxLength: 4,
                                         decoration: InputDecoration(
                                           border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                                           prefixIcon:const Icon(Icons.smartphone_outlined),
                                           hintText: 'Enter OTP',
                                         ),
                                         onChanged: (value){
                                           setState(() {
                                             otp = value;
                                           });
                                         },
                                        ),
                                        const SizedBox(height: 20),
                                        //------------------------------Button for Verify OTP----------------------
                                        FutureBuilder(future:api.verifyOTP() ,
                                        builder: (context, snapshot) {
                                        if (snapshot.connectionState == ConnectionState.waiting) {
                                          return const Center(child: CircularProgressIndicator());
                                        } else if (api.res == null) {
                                          return const Center(child: Text('No Record Found'));
                                        } else {
                                          return
                                        TextButton(
                                          onPressed:(){ 
                                            if(otp?.length == 4){
                                              api.verifyOTP();
                                                if(api.res=='pass'){
                                                // Navigator.of(context).pop();
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => const VCCourtData()));
                                                // api.clearVCData();
                                              }
                                            }
                                          },
                                          child:Container(
                                          width:double.infinity,
                                          padding:const EdgeInsets.symmetric(vertical:15),
                                          decoration: BoxDecoration(
                                            color:const Color.fromARGB(255, 62, 68, 107), 
                                            borderRadius: BorderRadius.circular(15),
                                            ),
                                          child: const Text(' Verify ',textAlign: TextAlign.center,style:TextStyle(fontSize: 16,color:Colors.white)),
                                          ),
                                        );}}),
                                  ]
                                ),
                              ),
                            );
                          });
                          
                        }
                        else{
                          notValid(context);
                        }
                  },
                   child: Container(
                    width:double.infinity,
                    padding:const EdgeInsets.symmetric(vertical:15),
                    decoration: BoxDecoration(
                      color:const Color.fromARGB(255, 62, 68, 107), 
                      borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text('Send OTP',textAlign: TextAlign.center,style:TextStyle(color:Colors.white),
                      ),
                    ),
                  ),
                ],
               ),
              ),
             ),
      
              // --------------------------------Advocate- General Officer----------------------          
              Visibility(
                visible: advocateGeneralOfficer!,
                child: SingleChildScrollView(
                child: Column(
                children:[
                  const Text('Advocate General Officers'),
                  TextField(
                    keyboardType:TextInputType.number,
                    maxLength: 10,
                    decoration:InputDecoration(
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      prefixIcon:const Icon(Icons.person_2),
                      hintText: 'Enter Enroll No.',
                    ),
                    onChanged: (value){
                      setState(() {
                        enrollNo = value;
                        option = 'AGOffice';
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    maxLength: 4,
                    keyboardType:TextInputType.number,
                    decoration: InputDecoration(
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      prefixIcon:const Icon(Icons.calendar_month),
                      hintText: 'Enter Enroll Year', 
                    ),
                    onChanged: (value){
                      setState(() {
                        enrollYear = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  //-------------------------------Button will send OTP to the Advocate General Officers------------------------
                  TextButton(onPressed: (){
                     /////////////////////////////////////////////////////////////////
      
                     debugPrint('$enrollNo $enrollYear $option');
                        if(enrollNo!=null && enrollYear!=null){
                          api.sendSrAdvOTP();
                          showDialog(context: context, builder: (BuildContext context){
                            return AlertDialog(
                              shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                              title:const Text(' Verify OTP '),
                              content:Container(
                                height: 300,
                                child:Column(
                                  mainAxisAlignment:MainAxisAlignment.center,
                                  children:[
                                     TextField(
                                         
                                         keyboardType:TextInputType.number,
                                         maxLength: 4,
                                         decoration: InputDecoration(
                                           border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                                           prefixIcon:const Icon(Icons.smartphone_outlined),
                                           hintText: 'Enter OTP',
                                         ),
                                         onChanged: (value){
                                           setState(() {
                                             otp = value;
                                           });
                                         },
                                        ),
                                        const SizedBox(height: 20),
                                        //------------------------------Button for Verify OTP----------------------
                                        TextButton(
                                          onPressed:(){ 
                                            
                                            if(otp?.length == 4){
                                              api.verifyOTP();
                                              if(api.res=='pass'){
                                                Navigator.of(context).pop();
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => const VCCourtData()));
                                                // api.clearVCData();
                                              }
                                            }
                                          },
                                          child:Container(
                                          width:double.infinity,
                                          padding:const EdgeInsets.symmetric(vertical:15),
                                          decoration: BoxDecoration(
                                            color:const Color.fromARGB(255, 62, 68, 107), 
                                            borderRadius: BorderRadius.circular(15),
                                            ),
                                          child: const Text(' Verify ',textAlign: TextAlign.center,style:TextStyle(fontSize: 16,color:Colors.white)),
                                          ),
                                        )
                                  ]
                                ),
                              ),
                            );
                          });
                          
                        }
                        else{
                          notValid(context);
                        }    
                  },
                   child: Container(
                    width:double.infinity,
                    padding:const EdgeInsets.symmetric(vertical:15),
                    decoration: BoxDecoration(
                      color:const Color.fromARGB(255, 62, 68, 107), 
                      borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text('Send OTP',textAlign: TextAlign.center,style:TextStyle(color:Colors.white)
                      ),
                    ),
                  ),
                 ],
                ),
               ),
              ),    
             // ---------------------------------Senior Advocate-----------------------          
             Visibility(
              visible: seniorAdv!,
              child: SingleChildScrollView(
                child: Column(
                children:[
                  TextField(
                    keyboardType:TextInputType.number,
                    maxLength: 10,
                    decoration:InputDecoration(
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      prefixIcon:const Icon(Icons.person_2),
                      hintText: 'Enter Enroll No.',
                      ),
                      onChanged: (value){
                      setState(() {
                        enrollNo = value;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    maxLength: 4,
                    keyboardType:TextInputType.number,
                    decoration: InputDecoration(
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      prefixIcon:const Icon(Icons.calendar_month),
                      hintText: 'Enter Enroll Year',
                     ),
                      onChanged: (value){
                      setState(() {
                        enrollYear = value;
                        option = 'SrAdv';
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  //----------------------------------Button will send OTP to the Senior Advocate----------------------------
                  TextButton(onPressed: (){
                    ///////////////////////////////////////////////////////////////////////
                     debugPrint('$enrollNo $enrollYear $option');
                        if(enrollNo!=null && enrollYear!=null){
                          api.sendSrAdvOTP();
                          showDialog(context: context, builder: (BuildContext context){
                            return AlertDialog(
                              shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                              title:const Text(' Verify OTP '),
                              content:Container(
                                height: 300,
                                child:Column(
                                  mainAxisAlignment:MainAxisAlignment.center,
                                  children:[
                                     TextField(
                                         
                                         keyboardType:TextInputType.number,
                                         maxLength: 4,
                                         decoration: InputDecoration(
                                           border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                                           prefixIcon:const Icon(Icons.smartphone_outlined),
                                           hintText: 'Enter OTP',
                                         ),
                                         onChanged: (value){
                                           setState(() {
                                             otp = value;
                                           });
                                         },
                                        ),
                                        const SizedBox(height: 20),
                                        //------------------------------Button for Verify OTP----------------------
                                        TextButton(
                                          onPressed:(){ 
                                            
                                            if(otp?.length == 4){
                                              api.verifyOTP();
                                              if(api.res=='pass'){
                                                Navigator.of(context).pop();
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => const VCCourtData()));
                                                // api.clearVCData();
                                              }
                                            }
                                          },
                                          child:Container(
                                          width:double.infinity,
                                          padding:const EdgeInsets.symmetric(vertical:15),
                                          decoration: BoxDecoration(
                                            color:const Color.fromARGB(255, 62, 68, 107), 
                                            borderRadius: BorderRadius.circular(15),
                                            ),
                                          child: const Text(' Verify ',textAlign: TextAlign.center,style:TextStyle(fontSize: 16,color:Colors.white)),
                                          ),
                                        )
                                  ]
                                ),
                              ),
                            );
                          });
                          
                        }
                        else{
                          notValid(context);
                        }
                  },
                   child: Container(
                    width:double.infinity,
                    padding:const EdgeInsets.symmetric(vertical:15),
                    decoration: BoxDecoration(
                      color:const Color.fromARGB(255, 62, 68, 107), 
                      borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Text('Send OTP',textAlign: TextAlign.center,style:TextStyle(color:Colors.white)
                      ),
                    ),
                  ),
                 ],
                ),
               ),
              ),  
            ]),
          ),
        )
      ),
    );
  }
  
}

void notValid(BuildContext context){
  showDialog(context: context, builder: (BuildContext context){
    return const AlertDialog(
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
      title:Text('Invalid Field'),
      content:Text('fields are Empty!',style:TextStyle(fontSize: 16)),
    );
  });
}



