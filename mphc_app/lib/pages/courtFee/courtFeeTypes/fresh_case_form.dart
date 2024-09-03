import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class FreshCaseForm extends StatefulWidget {
  const FreshCaseForm({super.key});

  @override
  State<FreshCaseForm> createState() => _FreshCaseFormState();
}

class _FreshCaseFormState extends State<FreshCaseForm> {

  //------------------------case Type API Storage-----------------------------
  String? stringResponse;
  Map? mapResult;
  List? dropItems;

  List<String>? dropListUser;
  List<String>? dropListCode;
  //-------------------------Case Type APi Method-----------------------------------------------
  Future caseTypeApi() async{
    http.Response response;
    try{
    response = await http.get(Uri.parse('http://ns2.mphc.in/new_mobile_app_api/case_type.php'));
    if (response.statusCode==200){
      setState(() {
        stringResponse = response.body;
        mapResult = json.decode(response.body);
        dropItems = mapResult?['results'];
        dropListUser = dropItems!.map((map) =>(map['skey']).toString()).toList();
        dropListCode = dropItems!.map((map) =>(map['casecode']).toString()).toList();
        // debugPrint(dropListUser.toString());
        // debugPrint(dropItems.toString());
      });
    }
    }catch(e){
      debugPrint('$e');
    }
  }


  //--------------Fresh Case Form Variables--------------
  String ? establish;
  String ? caseType;
  String ? userName;
  String ? email;
  String ? address;
  String ? pin;
  String ? state;
  String ? district;
  String ? mobile;
  // ----------------------------------
  String ? courtFee;
  String ? applicationFee;
  String ? powerFee;
  String ? processFee;
  String ? ccFee;


  @override
  void initState() {
    caseTypeApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

      appBar: AppBar(
         backgroundColor: const Color.fromARGB(255, 16, 55, 124),
        foregroundColor: Colors.white,
        title:const Text('Online Court Fee',style:TextStyle()),
        centerTitle: true,
      ),
      body:Container(
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 0),
        decoration:const BoxDecoration(
        color:Colors.white,
        image: DecorationImage(
        image:AssetImage('images/mphc02.jpg'),fit:BoxFit.contain,
        alignment: Alignment.bottomCenter,
        opacity: 1,        
         colorFilter: ColorFilter.mode(Color.fromARGB(255, 45, 82, 130), BlendMode.screen),
          ),
         ),
        child:SingleChildScrollView(
          child:Column(
            children:[
              Container(
                padding: const EdgeInsets.all(20),
                width: double.infinity,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(image: AssetImage('images/mphc02.jpg'),opacity:1,colorFilter: ColorFilter.mode(Color.fromARGB(255, 141, 166, 206), BlendMode.screen),fit: BoxFit.cover),               
                ),
                child:const Text('Fresh Case',textAlign: TextAlign.center,style:TextStyle(fontSize: 25,color:Color.fromARGB(255, 22, 18, 108),fontWeight: FontWeight.bold)),
              ),
              //---------------------------------Establishment-------------------------------
             SizedBox(height: 20,),
              const Row(
                  children: [
                    Text('  Select Establishment',style: TextStyle(color: Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                  ],
              ),
              Container(
                  padding:const EdgeInsets.symmetric(vertical:0,horizontal: 10),
                  decoration: BoxDecoration(border:Border.all(width: 1,color:Colors.black54),borderRadius: BorderRadius.circular(18)),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                      const Icon(Icons.location_city,color:Color.fromARGB(255, 62, 68, 107), ),
                       DropdownButton<String>(
                            underline: Container(),
                            value: establish,
                            hint: const Text('Select Bench'),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                setState(() {
                                    establish = newValue;
                                  debugPrint(establish);
                                });
                              }
                            },
                            items: const [
                              DropdownMenuItem<String>(
                                value: '1',
                                child: Text('Principle Seat Jabalpur   '),
                              ),
                              DropdownMenuItem<String>(
                                value: '2',
                                child: Text('Bench Indore'),
                              ),
                              DropdownMenuItem<String>(
                                value: '3',
                                child: Text('Bench Gwalior'),
                              ),
                            ],
                          ),
                     ],
                   ),
                ),
                //-----------------------------Case Type----------------------------
                const  SizedBox(
                      height: 20,
                ),
                const Row(
                    children: [
                      Text('   Case Type',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                    ],
                ),
                Container(
                  width: double.infinity,
                  child:DropdownSearch<String>(
                  popupProps:const  PopupProps.menu(
                    showSearchBox: true,
                    searchDelay: Duration.zero,
                      showSelectedItems: true,
                   ),
                  items:  dropListUser == null? []:dropListUser!,
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0),
                        border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                          // labelText: "Case Type",
                          hintText: "select Case Type",
                          prefixIcon:Icon(Icons.content_paste_go_rounded,color:Color.fromARGB(255, 62, 68, 107), )
                      ),
                  ),
                  onChanged: (value){
                    int index = dropListUser!.indexWhere((element)=>element == value!);
                    String val = dropListCode![index];
                    setState((){
                    caseType = val;
                    });
                    debugPrint(val);
                  },
                )
              ),
              //----------------------------------Petitioiner Individual / Dept.------------------------
              //----------------------------------Name------------------------------------------------
              const SizedBox(height: 20,),
              const Row(    children: [  Text('   Name',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),],),
              Container(
              width: double.infinity,
                child:TextFormField(
                keyboardType: TextInputType.number,
                // maxLength: 60,
                onChanged: (value){
                  setState(() {
                    userName = value.trim();
                  });
                 },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  fillColor: Color.fromARGB(205, 255, 255, 255),
                  filled: true,
                  hintText:'Enter Name',
                  prefixIcon:Icon(Icons.person),
                  border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                 )
              ),
              //-------------------------Email---------------------------------------------
              const SizedBox(height: 20,),
              const Row(    children: [  Text('   Email',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),],),
              Container(
              width: double.infinity,
                child:TextFormField(
                keyboardType: TextInputType.number,
                // maxLength: 5,
                onChanged: (value){
                  setState(() {
                    email = value.trim();
                  });
                 },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  fillColor: Color.fromARGB(205, 255, 255, 255),
                  filled: true,
                  hintText:'Email',
                  prefixIcon:Icon(Icons.mail),
                  border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                 )
              ),
              //-------------------------Address---------------------------------------------
              const SizedBox(height: 20,),
              const Row(    children: [  Text('   Address',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),],),
              Container(
              width: double.infinity,
                child:TextFormField(
                keyboardType: TextInputType.number,
                // maxLength: 5,
                onChanged: (value){
                  setState(() {
                    address = value.trim();
                  });
                 },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  fillColor: Color.fromARGB(205, 255, 255, 255),
                  filled: true,
                  hintText:'Address',
                  prefixIcon:Icon(Icons.location_on),
                  border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                 )
              ),
               //-------------------------Pin---------------------------------------------
              const SizedBox(height: 20,),
              const Row(    children: [  Text('   Pin',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),],),
              Container(
              width: double.infinity,
                child:TextFormField(
                keyboardType: TextInputType.number,
                // maxLength: 5,
                onChanged: (value){
                  setState(() {
                    pin = value.trim();
                  });
                 },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  fillColor: Color.fromARGB(205, 255, 255, 255),
                  filled: true,
                  hintText:'Pin',
                  prefixIcon:Icon(Icons.location_on_outlined),
                  border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                 )
              ),
               //-------------------------State-------------------------------------------
              const SizedBox(height: 20,),
              const Row(    children: [  Text('   state',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),],),
              Container(
              width: double.infinity,
                child:TextFormField(
                keyboardType: TextInputType.number,
                // maxLength: 5,
                onChanged: (value){
                  setState(() {
                    state = value.trim();
                  });
                 },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  fillColor: Color.fromARGB(205, 255, 255, 255),
                  filled: true,
                  hintText:'state',
                  prefixIcon:Icon(Icons.location_on),
                  border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                 )
              ),
               //-------------------------District---------------------------------------------
              const SizedBox(height: 20,),
              const Row(    children: [  Text('   District',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),],),
              Container(
              width: double.infinity,
                child:TextFormField(
                keyboardType: TextInputType.number,
                // maxLength: 5,
                onChanged: (value){
                  setState(() {
                    district = value.trim();
                  });
                 },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  fillColor: Color.fromARGB(205, 255, 255, 255),
                  filled: true,
                  hintText:'District',
                  prefixIcon:Icon(Icons.location_on),
                  border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                 )
              ),
               //-------------------------Phone/Mobile--------------------------------------------
              const SizedBox(height: 20,),
              const Row(    children: [  Text('   Phone/Mobile',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),],),
              Container(
              width: double.infinity,
                child:TextFormField(
                keyboardType: TextInputType.number,
                // maxLength: 5,
                onChanged: (value){
                  setState(() {
                    mobile = value.trim();
                  });
                 },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  fillColor: Color.fromARGB(205, 255, 255, 255),
                  filled: true,
                  hintText:'Phone/Mobile',
                  prefixIcon:Icon(Icons.phone),
                  border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                 )
              ),
              //Fees Details------------------------------------
              //-------------------------Court Fees on Petition/Main Case---------------------------------------------
              const SizedBox(height: 20,),
              const Row( children: [  Text('   Court Fees on Petition/Main Case',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),],),
              Container(
              width: double.infinity,
                child:TextFormField(
                keyboardType: TextInputType.number,
                // maxLength: 5,
                onChanged: (value){
                  setState(() {
                    courtFee = value.trim();
                  });
                 },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  fillColor: Color.fromARGB(205, 255, 255, 255),
                  filled: true,
                  hintText:'Court Fees on Petition/Main Case',
                  prefixIcon:Icon(Icons.payments_rounded),
                  border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                 )
              ),
              //-------------------------Interlocutory Application Fee---------------------------------------------
              const SizedBox(height: 20,),
              const Row( children: [  Text('   Interlocutory Application Fee',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),],),
              Container(
              width: double.infinity,
                child:TextFormField(
                keyboardType: TextInputType.number,
                // maxLength: 5,
                onChanged: (value){
                  setState(() {
                    applicationFee = value.trim();
                  });
                 },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  fillColor: Color.fromARGB(205, 255, 255, 255),
                  filled: true,
                  hintText:'Interlocutory Application Fee',
                  prefixIcon:Icon(Icons.payments),
                  border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                 )
              ),
              //-------------------------Power Fee---------------------------------------------
              const SizedBox(height: 20,),
              const Row( children: [  Text('   Power Fee',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),],),
              Container(
              width: double.infinity,
                child:TextFormField(
                keyboardType: TextInputType.number,
                // maxLength: 5,
                onChanged: (value){
                  setState(() {
                    powerFee = value.trim();
                  });
                 },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  fillColor: Color.fromARGB(205, 255, 255, 255),
                  filled: true,
                  hintText:'Power Fee',
                  prefixIcon:Icon(Icons.payments),
                  border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                 )
              ),
              //--------------------------------Process Fee--------------------------------------
              const SizedBox(height: 20,),
              const Row( children: [  Text('   Process Fee',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),],),
              Container(
              width: double.infinity,
                child:TextFormField(
                keyboardType: TextInputType.number,
                // maxLength: 5,
                onChanged: (value){
                  setState(() {
                    processFee = value.trim();
                  });
                 },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  fillColor: Color.fromARGB(205, 255, 255, 255),
                  filled: true,
                  hintText:'Process Fee',
                  prefixIcon:Icon(Icons.payments_rounded),
                  border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                 )
              ),
              //-------------------------Certified Copy Fee---------------------------------------------
              const SizedBox(height: 20,),
              const Row( children: [  Text('   Certified Copy Fee',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),],),
              Container(
              width: double.infinity,
                child:TextFormField(
                keyboardType: TextInputType.number,
                // maxLength: 5,
                onChanged: (value){
                  setState(() {
                    ccFee = value.trim();
                  });
                 },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  fillColor: Color.fromARGB(205, 255, 255, 255),
                  filled: true,
                  hintText:'Certified Copy Fee',
                  prefixIcon:Icon(Icons.payments),
                  border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                 )
              ),
              //-----------------------------Submit---------------------------------------------
              const SizedBox(height: 30,),
              // const Row( children: [  Text('   Interlocutory Application Fee',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),],),
              Container(
                decoration: BoxDecoration(
                  color:const Color.fromARGB(255, 65, 125, 255),
                  border: Border.all(width:0.5),
                  borderRadius: BorderRadius.circular(20)
                ),
              width: double.infinity,
                child:TextButton(onPressed: (){}, child: const Text('Submit',style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color:Color.fromARGB(255, 255, 255, 255))))
              ),
              const SizedBox(height: 40,),


            ]
          ),
          ),
         ),
        );
  }
}