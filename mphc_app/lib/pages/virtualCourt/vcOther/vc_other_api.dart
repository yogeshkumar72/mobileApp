import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



//------------------Global Storage of VC Form-----------------------
String ? option;
String ? enrollNo;
String ? enrollYear;
String ? userName;
String ? mobileNo;
String ? otp;

String? jcourtInput;
String? causelistInput;
String? establish;


class VCAPI{
//------------clear VC Storage-------------------------------------
void clearVCData(){
 option=null;
 enrollNo=null;
 enrollYear=null;
 userName=null;
 mobileNo=null;
 otp=null;
}
//--------------------Click once on API-----------------------------
bool ? guestRequestOtp =true;
bool ? srAdvRequestOtp = true;
bool ? aGOfficeRequestOtp =true;

void resendOTP(){
guestRequestOtp = true;
srAdvRequestOtp = true;
aGOfficeRequestOtp =true;
}

//-------------------OTP Sent to The Guest User---------------------
  String ? guestResponse;
  Map ?    guestResult;
  String ?  guestData;
  bool ?   guestAvailable;

    // Future  async{

    // }

  Future sendGuestOTP() async{
  // if(guestRequestOtp == true){
   http.Response guest;
     try{
         guest = await http.post(Uri.parse('https://mphc.gov.in/api/new_mobile_app_api/Get_VC_User.php'),
         body:{
           'opt':option.toString(),
           'eno':userName.toString(),
           'eyr':mobileNo.toString(),
         }
        );
        if(guest.statusCode==200){
           guestResponse = guest.body;
           guestResult  = json.decode(guest.body);
           guestAvailable = guestResult?['success'];
           debugPrint('--------------- OTP Sent to the Guest User ------------------------');
           guestData = guestResult?['results'];
           debugPrint(guestData.toString());
           debugPrint(mobileNo.toString());
         }
       }
     catch(e){
         debugPrint('$e');
         }
      //  }
      //  guestRequestOtp = false;
     }
     
//-------------------OTP Sent to The Sr. Advocate---------------------
  String ? srAdvResponse;
  Map ?    srAdvResult;
  String ? srAdvData;
  bool ?   srAdvAvailable;
  List ?   mobile;
  // String ? mobileNo;

  Future sendSrAdvOTP() async{
  // if(guestRequestOtp == true){
   http.Response adv;
     try{
         adv = await http.post(Uri.parse('https://mphc.gov.in/api/new_mobile_app_api/Get_VC_User.php'),
         body:{
           'opt':option.toString(),
           'eno':enrollNo.toString(),
           'eyr':enrollYear.toString(),
         }
        );
        if(adv.statusCode==200){
           srAdvResponse = adv.body;
           srAdvResult  = json.decode(adv.body);
           srAdvAvailable = srAdvResult?['success'];
           debugPrint('--------------- OTP Sent to the Senior Advocate  ------------------------');
           srAdvData = srAdvResult?['results'];
           debugPrint(srAdvData.toString());
           mobile = srAdvData!.split('^');
           mobileNo = mobile![1].toString();
           debugPrint(mobileNo.toString());
         }
       }
     catch(e){
         debugPrint('$e');
         }
      //  }
      //  guestRequestOtp = false;
     }

     ///////////////////////////////////////////////////////////////////////
    //  --------------------------Verify OTP api ---------------------------------
     String ? verifyResponse;
     Map ?    verifyResult;
     String ? verifyData;
     bool ?   verifyAvailable;
     String ? res;
   
     Future verifyOTP() async{
      http.Response vrf;
        try{
            vrf = await http.post(Uri.parse('https://mphc.gov.in/api/new_mobile_app_api/Verify_VC_User.php'),
            body:{
              'mobile':mobileNo.toString(),
              'otp_verify':otp.toString(),
            }
           );
           if(vrf.statusCode==200){
              verifyResponse = vrf.body;
              verifyResult  = json.decode(vrf.body);
              verifyAvailable = verifyResult?['success'];
              debugPrint('--------------- OTP Varify API Called ------------------------');
              verifyData = verifyResult?['results'];
              debugPrint(verifyData.toString());
              debugPrint(mobileNo.toString());
              if(verifyData=='OTP Verified Successfully'){
                debugPrint('Pass');
                res = 'pass';
              }
              else{
                res='fail';
              }
            }
          }
        catch(e){
            debugPrint('$e');
            }
        }

        //  --------------------------Show VC Link API---------------------------------        
        String ? meetingResponse;
        Map ?    meetingResult;
        List ?   meetingData;
        bool ?   meetingAvailable;
        Future getVcLink() async{
        http.Response link;
        try{
        link= await http.post(Uri.parse('https://mphc.gov.in/api/get_meeting_url.php'),
        body:{
          'opt':option.toString(),
          'name':userName.toString(),
          'branch':establish.toString(),
          'jcourt':jcourtInput.toString(),
          'cl':causelistInput.toString(),
        }
        );
        debugPrint('$option $userName $establish $jcourtInput $causelistInput');
        if(link.statusCode==200){
          meetingResponse = link.body;
          meetingResult  = json.decode(link.body);
          // connnectedAvailable = earlierCourtResult?['success'];
          debugPrint('-------------------VC Link API Called-------------------------');
          // debugPrint('\n\n\n\n\n\n\n\n\n\n -------------VC link API Called----------------- \n\n\n\n\n\n\n\n\n\n\n');
          meetingData = meetingResult?['results'];
          
          debugPrint(meetingData.toString());
      }
      }
    catch(e){
      debugPrint('$e');
      }
    }
    // ----------------------------VC Judge List----------------------------------------
      

//  -------------------------VC  form judge  ---------------------------------
     String ? vcjudgeResponse;
     Map ?    vcjudgeResult;
     List ?   vcjudgeData;
     bool ?   vcjudgeAvailable;

       List<String>? dropListUser;
       List<String>? dropListCode;
   
      Future vcjudge() async{
      http.Response jcrt;
        try{
            jcrt = await http.post(Uri.parse('https://mphc.gov.in/api/new_mobile_app_api/get_courts.php'),
            body:{
              'branch':establish?.toString()??'1',
              }
           );
           if(jcrt.statusCode==200){
              vcjudgeResponse = jcrt.body;
              vcjudgeResult  = json.decode(jcrt.body);
              vcjudgeAvailable = vcjudgeResult?['success'];
              debugPrint('--------------- OTP Varify API Called ------------------------');
              vcjudgeData = vcjudgeResult?['results'];
              debugPrint(vcjudgeData.toString());
               dropListUser = vcjudgeData!.map((map) =>(map['jname']).toString()).toList();
               dropListCode = vcjudgeData!.map((map) =>(map['court']).toString()).toList(); 
               debugPrint(dropListUser.toString());
               debugPrint(dropListCode.toString());
            }
          }
        catch(e){
            debugPrint('$e');
            }
        }


}