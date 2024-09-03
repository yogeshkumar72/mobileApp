import 'package:flutter/material.dart';
import 'package:mphc_app/pages/virtualCourt/vcOther/vc_link.dart';
import 'package:mphc_app/pages/virtualCourt/vcOther/vc_other_form.dart';
import 'vc_other_api.dart';
// import 'package:url_launcher/url_launcher_string.dart';
import 'package:dropdown_search/dropdown_search.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

class VCCourtData extends StatefulWidget {
  // final otpno;
  const VCCourtData({
    // required this.otpno,
    super.key});
  @override
  State<VCCourtData> createState() => _VCCourtDataState();
}
class _VCCourtDataState extends State<VCCourtData> {

  String ? judgeName;
  String ? establishInput;
  VCAPI api = VCAPI();

  @override
  void initState() {
    // vcjudge();
    // api.getVcLink();
    super.initState();
  }
  @override
  void dispose() {
    api.clearVCData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      
      // () => Navigator.push(context, MaterialPageRoute(builder: (context)=>VCUserForm())),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title:const Text('Vitual Court Link '),
          leading: IconButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>const VCUserForm())),icon: const Icon(Icons.arrow_back),),
        ),
        body:
        
        
        Container(
           padding:const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
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
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children:[
               const SizedBox(height: 0,),
      
      
                const Row(
                    children: [
                      Text('  Select Establishment',style: TextStyle(color: Color.fromARGB(255, 62, 68, 107),fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                    ],
                  ),
                   Container(
                    padding:const EdgeInsets.symmetric(vertical:4,horizontal: 10),
                    decoration: BoxDecoration(border:Border.all(width: 1,color:const Color.fromARGB(255, 62, 68, 107), ),borderRadius: BorderRadius.circular(18)),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                        const Icon(Icons.location_city,color:Color.fromARGB(255, 62, 68, 107), ),
                         DropdownButton<String>(
                              underline: Container(),
                              value: establish,
                              hint:  const Text('Select Bench'),
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    // vcjudgeData?.clear();
                                    // dropListCode?.clear();
                                    // dropListUser?.clear();
                                      establish = newValue;
                                      debugPrint(establish);
                                    // dropListUser =null;
                                    // dropListCode =null;
                                    // Navigator.pushReplacement(
                                    // context,
                                    // MaterialPageRoute(
                                    // builder: (BuildContext context) => super.widget));
                                    api.vcjudge();
      
                                  });
                                }
                              },
                              items: const [
                                DropdownMenuItem<String>(
                                  value: '01',
                                  child: Text('Principle Seat Jabalpur'),
                                ),
                                DropdownMenuItem<String>(
                                  value: '02',
                                  child: Text('Bench Indore'),
                                ),
                                DropdownMenuItem<String>(
                                  value: '03',
                                  child: Text('Bench Gwalior'),
                                ),
                              ],
                            ),
                       ], 
                     ),
                   ),
                    const SizedBox(
                      height: 20,
                    ),
                      const Row(
                      children: [
                        Text(' Select Judge ',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                      ],
                    ),
      
                    FutureBuilder(future: api.vcjudge(),
                     builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return const Center(child: CircularProgressIndicator());
                              } else if (api.vcjudgeData == null) {
                                return const Center(child: Text('No Record Found'));
                              } else {
                                return
                     
                     Container(
                     width: double.infinity,
                      //  padding:const EdgeInsets.symmetric(vertical:4,horizontal: 0),
                      // decoration: BoxDecoration(border:Border.all(width: 1,color:Colors.black54),borderRadius: BorderRadius.circular(18)),
                    child:DropdownSearch<String>(
                      // selectedItem: api.dropListUser![int.parse(jcourtInput!)-1],
                      selectedItem: judgeName,
                    popupProps:const  PopupProps.menu(
                      showSearchBox: true,
                      searchDelay: Duration.zero,
                        showSelectedItems: true,
                      ),
                    items:  api.dropListUser == null? []:api.dropListUser!,
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                            hintText: "select Judge ",
                            
                            prefixIcon:Icon(Icons.content_paste_go_rounded,color: Color.fromARGB(255, 62, 68, 107), )
                        ),
                    ),
                    onChanged: (value){
                      int index = api.dropListUser!.indexWhere((element)=>element == value!);
                      String val = api.dropListCode![index];
                      String jn = api.dropListUser![index];
                      setState((){
                      jcourtInput = val;
                      judgeName = jn;
                      debugPrint('$jcourtInput $val');
                
                      });
                      debugPrint(val);
                    },
                  )
                );}}
                ),
                const SizedBox(
                  height: 20,
                ),
                 const Row(
                      children: [
                        Text('  Cause List Number',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                      ],
                    ),
            
                // ------------------------------------------causelistnumber-------------------------------------------------------------------      
                Container(
                width: double.infinity,
                
                child:TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 5,
                  
                  onChanged: (value){
                    setState(() {
                      causelistInput= value.trim();
                    });
                   },
                  decoration: const InputDecoration(
                    fillColor: Color.fromARGB(205, 255, 255, 255),
                    filled: true,
                    hintText:'Enter Cause List  Number',
                    prefixIcon:Icon(Icons.numbers),
                    border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                   ),
                ),
      
                 TextButton(onPressed: (){
                      if(causelistInput!=null && causelistInput!.trim().isNotEmpty && jcourtInput!=null  && establish!=null){
                        // debugPrint('$causelistInput $jcourtInput $establish');
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const VCLINKConnect()));
                      }
                      else{
                        notValid(context);
                        
                      }
                    },child:Container(padding:const EdgeInsets.symmetric(horizontal: 40 ,vertical: 15),decoration:BoxDecoration(color:const Color.fromARGB(255, 68, 74, 108),borderRadius: BorderRadius.circular(10)),child: const Text('Connect',style: TextStyle(color:Colors.white),))),
            ]
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
      content:Text('fields are incorrect , \nPlease Check!',style:TextStyle(fontSize: 16)),
    );
  });
}