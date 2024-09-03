import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

int lenYr = (DateTime.now().year)-2023;
class FeeStatusForm extends StatefulWidget {
  const FeeStatusForm({super.key});

  @override
  State<FeeStatusForm> createState() => _FeeStatusFormState();
}

class _FeeStatusFormState extends State<FeeStatusForm> {
  
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

// ---------------------form Variables Fee STatus------------------
String ? onFeeId;
String ? feeYear;

String ? crnNo;

String ? establish;
String ? caseType;
String ? caseNo;
String ? caseYear;

String ? petName;

String ? provisionalNo;

// -------------------------Color Variables---------------------------
Color btn =    const Color.fromARGB(255, 15, 59, 152);
Color formBg = const Color.fromARGB(140, 103, 184, 255);


@override
  void initState() {
    caseTypeApi();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:const Text('Online Court Fee'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 2, 52, 144),
        // backgroundColor: Color.fromARGB(14,75,142),
        foregroundColor: Colors.white,
      ),
      body: Container(
        padding:const EdgeInsets.symmetric(horizontal:30,vertical:0),
        child:SingleChildScrollView(
          child:Column(
            children:[
              const SizedBox(height: 20,),
              Container(
              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 15),
              decoration:const BoxDecoration(
                image: DecorationImage(image: AssetImage('images/pattern1.svg'),fit:BoxFit.cover, )
            
              ),
              child: const Row( children: [Text('Online Court Fee Submission',style:TextStyle(color:Color.fromARGB(255, 3, 33, 57),fontWeight: FontWeight.bold,fontSize:18))],)),
              // ==========================================Online Fee Id=====================================
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding:const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    // color:const Color.fromARGB(94, 79, 122, 177),
                    color:formBg,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:Column(children:[
                  // ----------------------------Online Fee ID-------------------
                const SizedBox(height: 20,),
                const Row(    children: [  Text('   Online Fee Id',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),],),
                Container(
                width: double.infinity,
                  child:TextFormField(
                  keyboardType: TextInputType.number,
                  // maxLength: 60,
                  onChanged: (value){
                    setState(() {
                      onFeeId = value.trim();
                    });
                   },
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    fillColor: Color.fromARGB(205, 255, 255, 255),
                    filled: true,
                    hintText:'Enter Online fee ID',
                    prefixIcon:Icon(Icons.person),
                    border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                   )
                ),
                // ----------------------------Online Fee Year-------------------
                const SizedBox(height: 20,),
                const Row(    children: [  Text('   Year',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),],),
                Container(
                width: double.infinity,
                  child:TextFormField(
                  keyboardType: TextInputType.number,
                  // maxLength: 60,
                  onChanged: (value){
                    setState(() {
                      feeYear = value.trim();
                    });
                   },
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    fillColor: Color.fromARGB(205, 255, 255, 255),
                    filled: true,
                    hintText:'Enter Year',
                    prefixIcon:Icon(Icons.person),
                    border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                   )
                ),
                //-----------------------------Search fee Status---------------------------------------------
                const SizedBox(height: 30,),
                // const Row( children: [  Text('   Interlocutory Application Fee',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),],),
                Container(
                  decoration: BoxDecoration(
                    color:btn,
                    border: Border.all(width:0.5),
                    borderRadius: BorderRadius.circular(20)
                  ),
                width: double.infinity,
                  child:TextButton(onPressed: (){
                    debugPrint('$onFeeId $feeYear');
                  }, child: const Text('Search Fee Status',style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color:Color.fromARGB(255, 255, 255, 255))))
                ),
                ]),
                ),
              ),
              // ====================================CRN Number======================================
              const SizedBox(height: 30,),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding:const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color:formBg,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:Column(children:[
                // ---------------------------CRN Number-------------------
                const SizedBox(height: 20,),
                const Row(    children: [  Text('   CRN Number',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),],),
                Container(
                width: double.infinity,
                  child:TextFormField(
                  keyboardType: TextInputType.number,
                  // maxLength: 60,
                  onChanged: (value){
                    setState(() {
                      crnNo = value.trim();
                    });
                   },
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    fillColor: Color.fromARGB(205, 255, 255, 255),
                    filled: true,
                    hintText:'Enter CRN No.',
                    prefixIcon:Icon(Icons.person),
                    border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                   )
                ),
              
                //-----------------------------Search Fee Text--------------------------------------------
                const SizedBox(height: 30,),
                // const Row( children: [  Text('   Interlocutory Application Fee',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),],),
                Container(
                  decoration: BoxDecoration(
                    color:btn,
                    border: Border.all(width:0.5),
                    borderRadius: BorderRadius.circular(20)
                  ),
                width: double.infinity,
                  child:TextButton(onPressed: (){
                    debugPrint('$crnNo');
                  }, child: const Text('Search Fee Status',style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color:Color.fromARGB(255, 255, 255, 255))))
                ),
                ]),
                ),
              ),
              // =============================By Case Details========================================
              SizedBox(height: 30,),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding:const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color:formBg,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:Column(children:[

                     //---------------------------------Establishment-------------------------------
                  const Row(
                  children: [
                    Text('  Select Establishment',style: TextStyle(color: Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                  ],
                  ),
                  Container(
                  padding:const EdgeInsets.symmetric(vertical:0,horizontal: 10),
                  decoration: BoxDecoration(
                    color:Colors.white,
                    border:Border.all(width: 1,color:Colors.black54),borderRadius: BorderRadius.circular(18)),
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
                const  SizedBox(height: 20,),
                const Row(children: [Text('   Case Type',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,), ],
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
                        fillColor: Colors.white,
                        filled: true,
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
                // ---------------------------Case Number-------------------
                const SizedBox(height: 20,),
                const Row(    children: [  Text('   Case Number',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),],),
                Container(
                width: double.infinity,
                  child:TextFormField(
                  keyboardType: TextInputType.number,
                  // maxLength: 60,
                  onChanged: (value){
                    setState(() {
                      caseNo = value.trim();
                    });
                   },
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    fillColor: Color.fromARGB(205, 255, 255, 255),
                    filled: true,
                    hintText:'Enter Case No.',
                    prefixIcon:Icon(Icons.person),
                    border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                   )
                ),
                //----------------Year--------------------
                
                const SizedBox(height: 20,),
                const Row(    children: [  Text('   Case Year',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),],),
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
                        caseYear = value.toString();
                      },
                    )
                     ),

                //-----------------------------Search Fee Text--------------------------------------------
                const SizedBox(height: 30,),
                // const Row( children: [  Text('   Interlocutory Application Fee',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),],),
                Container(
                  decoration: BoxDecoration(
                    color:btn,
                    border: Border.all(width:0.5),
                    borderRadius: BorderRadius.circular(20)
                  ),
                width: double.infinity,
                  child:TextButton(onPressed: (){
                    debugPrint('$establish $caseType $caseNo $caseYear');
                  }, child: const Text('Search Fee Status',style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color:Color.fromARGB(255, 255, 255, 255))))
                ),
                ]),
                ),
              ),
              // ====================================Petitioner =============================================
               const SizedBox(height: 30,),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding:const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color:formBg,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:Column(children:[
                // ---------------------------Petitioner Name-------------------
                const SizedBox(height: 20,),
                const Row(    children: [  Text('   Petitioner Name',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),],),
                Container(
                width: double.infinity,
                  child:TextFormField(
                  keyboardType: TextInputType.name,
                  // maxLength: 60,
                  onChanged: (value){
                    setState(() {
                      petName = value.trim();
                    });
                   },
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    fillColor: Color.fromARGB(205, 255, 255, 255),
                    filled: true,
                    hintText:'Enter Petitioner Name.',
                    prefixIcon:Icon(Icons.person),
                    border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                   )
                ),
              
                //-----------------------------Search Fee Text--------------------------------------------
                const SizedBox(height: 30,),
                // const Row( children: [  Text('   Interlocutory Application Fee',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),],),
                Container(
                  decoration: BoxDecoration(
                    color:btn,
                    border: Border.all(width:0.5),
                    borderRadius: BorderRadius.circular(20)
                  ),
                width: double.infinity,
                  child:TextButton(onPressed: (){
                    debugPrint('$petName');
                  }, child: const Text('Search Fee Status',style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color:Color.fromARGB(255, 255, 255, 255))))
                ),
                ]),
                ),
              ),
              // =========================================Provisional No==============================
              const SizedBox(height: 30,),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  padding:const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color:formBg,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:Column(children:[
                // ---------------------------Provisional No-------------------
                const SizedBox(height: 20,),
                const Row(    children: [  Text('   Provisional No',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),],),
                Container(
                width: double.infinity,
                  child:TextFormField(
                  keyboardType: TextInputType.number,
                  // maxLength: 60,
                  onChanged: (value){
                    setState(() {
                      provisionalNo = value.trim();
                    });
                   },
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.all(0),
                    fillColor: Color.fromARGB(205, 255, 255, 255),
                    filled: true,
                    hintText:'Enter Provisional No.',
                    prefixIcon:Icon(Icons.person),
                    border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                   )
                ),
              
                //-----------------------------Search Fee Text--------------------------------------------
                const SizedBox(height: 30,),
                // const Row( children: [  Text('   Interlocutory Application Fee',style: TextStyle(color:Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),],),
                Container(
                  decoration: BoxDecoration(
                    color:btn,
                    border: Border.all(width:0.5),
                    borderRadius: BorderRadius.circular(20)
                  ),
                width: double.infinity,
                  child:TextButton(onPressed: (){
                    debugPrint('$provisionalNo');
                  }, child: const Text('Search Fee Status',style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color:Color.fromARGB(255, 255, 255, 255))))
                ),
                ]),
                ),
              ),

              
            ]
          )
        )
      ),
      
    );
  }
}