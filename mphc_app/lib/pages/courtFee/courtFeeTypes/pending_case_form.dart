import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';

int lenYr = (DateTime.now().year)-2023;

class PendingCaseForm extends StatefulWidget {
  const PendingCaseForm({super.key});

  @override
  State<PendingCaseForm> createState() => _PendingCaseFormState();
}

class _PendingCaseFormState extends State<PendingCaseForm> {

  
  int currentYear = DateTime.now().year;
  List years = (List.generate(37+lenYr, (currentYear) => currentYear +1987).reversed.toList());


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
     String ? formattedDate ;
     DateTime ? dateController;
     String ? pickedDate;
   Future <void> _selectDate() async{
   DateTime ? picked = await showDatePicker(
      useRootNavigator: true,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1976),
      lastDate: DateTime(2100), 
  );
  if(picked !=null){
    setState(() {
      
     formattedDate = DateFormat('dd-MM-yyyy').format(picked);
      // dateController?.text = formattedDate.toString();
     
      // pickedDate = picked.toString();
      pickedDate = formattedDate.toString();
    });
  }
}


  // -------------------------Color Variables---------------------------
  Color btn =    const Color.fromARGB(255, 15, 59, 152);
  Color formBg = const Color.fromARGB(44, 6, 42, 160);

  //--------------Fresh Case Form Variables--------------
  String ? establish;
  String ? impugned;
  String ? caseType;
  String ? userName;
  String ? email;
  String ? address;
  
  String ? caseNumber;
  String ? district;
  String ? mobile;
  // // ----------------------------------
  // String ? courtFee;
  String ? docFee;
  String ? payerName;
  String ? applicationFee;
  String ? powerFee;
  String ? processFee;
  String ? year;
  // String ? ccFee;

  //-------------Visible On Tap----------------------------
  bool impugnedVisible = false;
  // -----------------------------
  String ? impugnedOrder;
  String ? impugnedDate;
  // -----------------------------
  bool advVisible = false;

  String ? enrollNo;
  String ? enrollYear;
  // -------------or--------------
  String ? advMobileNo;

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
        title:const Text('Online Court Fee'),
        centerTitle: true,
        // bottom:PreferredSize(preferredSize: const Size(double.infinity, 100),
        // child: Container(
        // width: double.infinity,
        // padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 25),
        // decoration:const BoxDecoration(
        // color:Colors.white,
        // gradient: LinearGradient(
        //   begin: Alignment.topCenter,
        //   end: Alignment.bottomCenter,
        //   colors: [
        //   Color.fromARGB(198, 20, 45, 209),
        //   Color.fromARGB(205, 115, 24, 218),
        //   ]),
        //  ),
        //   child:const Text('Pending Case',textAlign:TextAlign.center,style:TextStyle(fontSize: 28,fontWeight: FontWeight.bold,color:Colors.white)),
        // ))
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
         colorFilter: ColorFilter.mode(Color.fromARGB(255, 151, 167, 198), BlendMode.screen),
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
                child:const Text('Pending Case',textAlign: TextAlign.center,style:TextStyle(fontSize: 25,color:Color.fromARGB(255, 22, 18, 108),fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 20,),
              const Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Online Court Fee Submission',style:TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
              Container(
                
                padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                decoration: const BoxDecoration(
                  color:Color.fromARGB(45, 6, 31, 160),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  
                ),
                child: const Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Fees Details', style:TextStyle(fontWeight: FontWeight.w600, fontSize: 15,color:Color.fromARGB(255, 12, 30, 187)),textAlign:TextAlign.start,),
                  ],
                ),
              ),
              //----------------Court------------------
              //----------------Establishment----------
              const SizedBox(height: 20,),
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
              //----------------impugned Applicable - RadioButton----
              const SizedBox(height: 20,),
              const Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('   Is Impugned Applicable',style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 67, 67, 67)),),
                ],
              ),
               Row(
                children:[
                Radio(
                  value: 'Y',
                  groupValue:impugned,
                  onChanged: (value){
                   setState(() {
                      impugnedVisible = true;
                      impugned = value;
                    });
                  }),
                  const Text('Yes'),
                  Radio(
                  value: 'N',
                  groupValue:impugned ,
                  onChanged: (value){
                   setState(() {
                      impugnedVisible = false;
                      impugned = value;
                      
                    });
                   }),
                   const Text('No'),
              ]
            ),
            //-----------------------Impugned ToggleMenu-----------------------------
              Visibility(
                visible: impugnedVisible,
                child: Container(
                  padding:const  EdgeInsets.all(10),
                  decoration:BoxDecoration(
                    color:formBg,
                    borderRadius:BorderRadius.all(Radius.circular(10)),
                    
                  ),
                  child: Column(
                    children:[
                    //----------------Inpugned Number-------------
                   const SizedBox(height: 20,),
                   const Row( children: [  Text('   Inpugned Order No',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),],),
                   Container(
                   width: double.infinity,
                  child:TextFormField(
                  keyboardType: TextInputType.number,
                  // maxLength: 4,
                  onChanged: (value){
                    setState(() {
                      impugnedOrder = value.trim();
                    });
                   },
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    fillColor: Color.fromARGB(205, 255, 255, 255),
                    filled: true,
                    hintText:'Enter Impugned Order No.',
                    prefixIcon:Icon(Icons.payments_rounded),
                    border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                   )
                                ),
                  //----------------Inpugned Date-------------
                    const SizedBox(height: 20,),
                    const Row( children: [  Text('   Inpugned Date',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),],),
                    Container(
                    width: double.infinity,
                    child: TextField( 
                  onTap: (){
                    _selectDate();
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(0),
                    // labelText: 'DATE',
                    hintText: pickedDate!=null?pickedDate.toString().split(" ")[0]:'Date',
                    filled:true,
                    fillColor: const Color.fromARGB(205, 255, 255, 255),
                    prefixIcon:const Icon(Icons.calendar_today),
                    enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide:BorderSide(
                        color:Color.fromARGB(250, 72, 72, 72),
                      ),
                    ),
                    focusedBorder:const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide:BorderSide(
                        color:Color.fromARGB(250, 72, 72, 72),
                      ),
                    ),
                  ),
                  readOnly: true,
                                )
                            ),
                  
                    ]
                  ),
                ),),
              //----------------caseType---------------
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
                        filled:true,
                        fillColor: Color.fromARGB(205, 255, 255, 255),
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
              //----------------Case Number-------------
              const SizedBox(height: 20,),
              const Row( children: [  Text('   Case Number',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),],),
              Container(
              width: double.infinity,
                child:TextFormField(
                keyboardType: TextInputType.number,
                maxLength: 4,
                onChanged: (value){
                  setState(() {
                    caseNumber = value.trim();
                  });
                 },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  fillColor: Color.fromARGB(205, 255, 255, 255),
                  filled: true,
                  hintText:'Case Number',
                  prefixIcon:Icon(Icons.payments_rounded),
                  border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                 )
              ),
              //----------------Year--------------------
              Container(
              width: double.infinity,
              child:DropdownSearch<String>(  
              popupProps:const  PopupProps.menu(
                searchDelay: Duration.zero,
                showSearchBox: true,
                showSelectedItems: true,
                searchFieldProps: TextFieldProps(
                  keyboardType: TextInputType.number,
                  maxLength: 4,                
                 ),
              ),
              items: years.map((value)=>value.toString()).toList(),
              dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(
                     fillColor: Color.fromARGB(205, 255, 255, 255),
                  filled: true,
                    contentPadding: EdgeInsets.all(0),
                    border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                      hintText: "select Case Year",
                      prefixIcon: Icon(Icons.calendar_today,color:Color.fromARGB(255, 62, 68, 107), ),
                  ),
              ),
              onChanged: (value){
                year = value.toString();
              },
            )
          ),
              //----------------Interlocutory Application Fee------
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
              //----------------Power Fee------------------------
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
              //----------------Document Fee/ Covring Memo / deficit Court Fee------------
               const SizedBox(height: 20,),
              const Row( children: [  Text('   Document Fee / Covering Memo /\n   Deficit Court Fee',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),],),
              Container(
              width: double.infinity,
                child:TextFormField(
                keyboardType: TextInputType.number,
                onChanged: (value){
                  setState(() {
                    docFee = value.trim();
                  });
                 },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  fillColor: Color.fromARGB(205, 255, 255, 255),
                  filled: true,
                  hintText:'Document Fee /Covering Memo / Deficit Court Fee',
                  prefixIcon:Icon(Icons.payments),
                  border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                 )
              ),
              //----------------Process Fee-------------------------------
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
              //---------------------label-----------------------------------
              const SizedBox(height: 20,),
              Container(
              
                padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 10),
                decoration:BoxDecoration(
                    color:const Color.fromARGB(45, 6, 31, 160),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: const Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Payer Details (Advocate or Party self)', style:TextStyle(fontWeight: FontWeight.w600, fontSize: 15,color:Color.fromARGB(255, 12, 30, 187)),textAlign:TextAlign.start,),
                  ],
                ),
              ),
              //----------------Name of Payer RadioButton-----------------
              const SizedBox(height: 20,),
              const Row(mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('   Name of Payer',style: TextStyle(fontWeight: FontWeight.bold,color: Color.fromARGB(255, 67, 67, 67)),),
                ],
              ),
               Row(
                children:[
                Radio(
                  value: 'advocate',
                  groupValue:payerName,
                  onChanged: (value){
                   setState(() {
                      payerName = value;
                      advVisible = true;
                    });
                }),
                const Text('Advocate'),
                Radio(
                  value: 'party_self',
                  groupValue:payerName,
                  onChanged: (value){
                   setState(() {
                      payerName = value;
                      advVisible = false;
                    });
                }),
                const Text('Party Self'),
              ]
              ),
              // ---------------------------AdvVisible Container--------------
              //-------------------------------ToggleMenu-----------------------------
              Visibility(
                visible: advVisible,
                child: Container(
                  padding:const  EdgeInsets.all(10),
                  decoration:BoxDecoration(
                    color:formBg,
                    borderRadius:BorderRadius.all(Radius.circular(20)),
                    
                  ),
                  child: Column(
                    children:[
                  //----------------EnrollNumber-------------
                  const SizedBox(height: 20,),
                  const Row( children: [  Text('   Enroll No',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),],),
                  Container(
                  width: double.infinity,
                  child:TextFormField(
                  keyboardType: TextInputType.number,
                  // maxLength: 4,
                  onChanged: (value){
                    setState(() {
                      enrollNo = value.trim();
                    });
                   },
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    fillColor: Color.fromARGB(205, 255, 255, 255),
                    filled: true,
                    hintText:'Enter Enroll No.',
                    prefixIcon:Icon(Icons.numbers),
                    border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                   )
                  ),
                  //----------------Enrollment Year-------------
                  const SizedBox(height: 20,),
                  const Row( children: [  Text('   Enroll Year',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),],),
                  Container(
                  width: double.infinity,
                  child:TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 4,
                  onChanged: (value){
                    setState(() {
                      enrollYear = value.trim();
                    });
                   },
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    fillColor: Color.fromARGB(205, 255, 255, 255),
                    filled: true,
                    hintText:'Enter Enroll Year.',
                    prefixIcon:Icon(Icons.calendar_month),
                    border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                   )
                  ),
                  // -------------------------Or---------------------------
                    // const SizedBox(height: 20,),
                  const Row(mainAxisAlignment: MainAxisAlignment.center, children: [  Text('or',style: TextStyle(fontSize:17,color:Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),],),
                  //----------------Phone/Mobile-------------------------
              // const SizedBox(height: 20,),
              const Row(    children: [  Text('   Advocate Mobie No',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),],),
              Container(
              width: double.infinity,
                child:TextFormField(
                keyboardType: TextInputType.number,
                // maxLength: 5,
                onChanged: (value){
                  setState(() {
                    advMobileNo = value.trim();
                  });
                 },
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  fillColor: Color.fromARGB(205, 255, 255, 255),
                  filled: true,
                  hintText:'Enter Mobile No.',
                  prefixIcon:Icon(Icons.phone),
                  border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                 )
              ),
                    ]
                  ),
                ),),
              

              //----------------Name---------------------------------
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
              //----------------Email--------------------------------
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
              //----------------Address------------------------------
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
              //----------------City---------------------------------
              const SizedBox(height: 20,),
              const Row(    children: [  Text('   City',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),],),
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
                  hintText:'City',
                  prefixIcon:Icon(Icons.location_on),
                  border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                 )
              ),
              //----------------Phone/Mobile-------------------------
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
              //-----------------------------Submit---------------------------------------------
              const SizedBox(height: 30,),
              // const Row( children: [  Text('   Interlocutory Application Fee',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),],),
              Container(
                decoration: BoxDecoration(
                  color:btn,
                  border: Border.all(width:0.5),
                  borderRadius: BorderRadius.circular(20)
                ),
              width: double.infinity,
                child:TextButton(onPressed: (){}, child: const Text('Submit',style:TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color:Color.fromARGB(255, 255, 255, 255))))
              ),
              const SizedBox(height: 40,),
            ]
          )
        )
      ),
      
    );
  }
}