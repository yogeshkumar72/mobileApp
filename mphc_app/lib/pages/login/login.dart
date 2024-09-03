import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mphc_app/components/ct_button.dart';
import 'package:mphc_app/components/input.dart';
import 'package:mphc_app/pages/login/register.dart';
import 'package:mphc_app/utils/sys_var.dart';
// import 'package:mphc_app/components/ct_alert.dart';

class Login extends StatelessWidget {
  final TextEditingController  _mobileController = TextEditingController();
  Login({super.key});

// AlertBox popup;

beforeSend(){
  if(_mobileController.text.length == 10){
    debugPrint("===================================");
    debugPrint(_mobileController.text);
    if(int.parse(_mobileController.text[0])>6) {
     return true;
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: PreferredSize(
          preferredSize:
              Size(double.infinity, MediaQuery.of(context).size.height * 0.3),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              border: Border(),
              gradient: appBarGradientColor,
            ),
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                     const SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      'assets/mphc_logo.png',
                      height: 100,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "HIGH COURT OF MADHYA PRADESH",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          //  Theme.of(context).colorScheme.surface,
                          fontSize: 25,
                          fontWeight: FontWeight.w300),
                    ),
                  ]),
            ),
          )),


      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
           
            const SizedBox(height: 50),
          
            Text("Register your mobile number!",
            style: TextStyle( color:Theme.of(context).colorScheme.primary,
            fontSize: 16,
              ),
            ),

            const SizedBox(height: 10),
          //Mobile verification

           CustomInput(
            hintText: "Mobile No.",
            inputTextValue: _mobileController,
            textType: TextInputType.phone,
            prefixIcon:const Icon(Icons.call),
            maxLength: 10,
            validateText:"Invalid Mobile no.",
            textFormat: [FilteringTextInputFormatter.digitsOnly],
            ),

            const SizedBox(height: 25),
            //Send OTP

            CtButton(
              text:"Send OTP",
              onTap: (){
                if(_mobileController.text.length == 10){
                   debugPrint("===================================");
                   debugPrint(_mobileController.text);
                   if(int.parse(_mobileController.text[0])>5) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Register(mobileNo: _mobileController.text)));
                   }else{
                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Invalid Mobile no.")));
                   }
                }
              }
            ),
            const SizedBox(height: 25),
          ],
        ),
      )
    );
  }
}

