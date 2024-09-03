import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mphc_app/pages/defectsDefaults/defects_defaults.dart';

// import 'package:mphc/pages/caseStatus/caseDetails/defaults.dart';

  // //-----Form Storage Variables 
  // String ? establishInput;
  // String ? caseTypeInput;
  // String ? yearInput;
  // String ? caseNumberInput;

  int lenYr = (DateTime.now().year)-2023;


class DefectsDefaultsForm extends StatefulWidget {
   
  const DefectsDefaultsForm({super.key});

  @override
  State<DefectsDefaultsForm> createState() => _CaseStatusFormState();
}

class _CaseStatusFormState extends State<DefectsDefaultsForm> {



  //--------------------year drop down-------------------

  List years = (List.generate(37 +lenYr,(currentYear) => currentYear + 1987).reversed.toList());

  //------case Type API Storage
  String? stringResponse;
  Map? mapResult;
  List? dropItems;

  List<String>? dropListUser;
  List<String>? dropListCode;
  //---------------------------------Case Type APi Method-----------------------------------------------
  Future apicall() async{
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

  @override
  void initState() {
    apicall();
    // debugPrint(currentYear.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      appBar:AppBar(
          title: const Text('Defects and Defaults'),
          centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(40),
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            
            children: [
              //------------------------------------------------------Establishment Input ------------------------------------------Field Case Status Form
              const Row(
                children: [
                  Text('  Select Establishment',style: TextStyle(color:const Color.fromARGB(255, 62, 68, 107),fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                ],
              ),             
              Container(
                  padding:const EdgeInsets.symmetric(vertical:4,horizontal: 10),
                  decoration: BoxDecoration(border:Border.all(width: 1,color:const Color.fromARGB(255, 62, 68, 107), ),borderRadius: BorderRadius.circular(18)),
                   child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                      const Icon(Icons.location_city,color:const Color.fromARGB(255, 62, 68, 107), ),
                       DropdownButton<String>(
                            underline: Container(),
                            value: establishInput,
                            hint: const Text('Select Bench'),
                            onChanged: (String? newValue) {
                              if (newValue != null) {
                                setState(() {
                                    establishInput = newValue;
                                  debugPrint(establishInput);
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
              //----------------------------------------------------------------Case Type -------------------------------------
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
            //  padding:const EdgeInsets.symmetric(vertical:4,horizontal: 0),
                  // decoration: BoxDecoration(border:Border.all(width: 1,color:Colors.black54),borderRadius: BorderRadius.circular(18)),
                child:DropdownSearch<String>(
                popupProps:const  PopupProps.menu(
                  showSearchBox: true,
                  searchDelay: Duration.zero,
                    showSelectedItems: true,
                  ),
                items:  dropListUser == null? []:dropListUser!,
                dropdownDecoratorProps: const DropDownDecoratorProps(
                    dropdownSearchDecoration: InputDecoration(
                      border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                        // labelText: "Case Type",
                        hintText: "select Case Type",
                        prefixIcon:Icon(Icons.content_paste_go_rounded,color:const Color.fromARGB(255, 62, 68, 107), )
                    ),
                ),
                onChanged: (value){
                  int index = dropListUser!.indexWhere((element)=>element == value!);
                  String val = dropListCode![index];
                  setState((){
                  caseTypeInput = val;
                  });
                  debugPrint(val);
                },
              )
            ),
              // ---------------------------------------------CaseNumber-------------------------------------------------------------------      
              const SizedBox(
                    height: 20,
                  ),

            const Row(
                  children: [
                    Text('   Case Number',style: TextStyle(color:const Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                  ],
                ),
              Container(
              width: double.infinity,
              // margin: const EdgeInsets.fromLTRB(40, 20, 40, 20),
              child:TextFormField(
                keyboardType: TextInputType.number,
                maxLength: 5,
                onChanged: (value){
                  setState(() {
                    caseNumberInput = value.trim();
                  });
                 },
               decoration:InputDecoration( 
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      prefixIcon:const Icon(Icons.numbers_outlined,color:const Color.fromARGB(255, 62, 68, 107), ),
                      hintText: 'Case Number ',
                    ),
                 )
              ),
              //---------------------------------------------------- Case Year----------------------------------------------------------------------
               const Row(
                  children: [
                    Text('  Case Year',style: TextStyle(color: Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                  ],
                ),            
             Container(
            width: double.infinity,
            // height: 200,
            // margin: const EdgeInsets.fromLTRB(40, 0, 40, 40),
            // decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),

            child:DropdownSearch<String>(
            
              popupProps:const  PopupProps.menu(
                searchDelay: Duration.zero,
                
                showSearchBox: true,
                showSelectedItems: true,
                searchFieldProps: TextFieldProps(
                
                  keyboardType: TextInputType.number,
                  maxLength: 4,

                  // padding:EdgeInsets.all(40),
                
                 ),
              ),
              items: years.map((value)=>value.toString()).toList(),
              dropdownDecoratorProps: const DropDownDecoratorProps(
                  dropdownSearchDecoration: InputDecoration(

                    border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                      // labelText: "Year",
                      hintText: "select Case Year",
                      prefixIcon: Icon(Icons.calendar_today,color:const Color.fromARGB(255, 62, 68, 107), ),
                  ),
              ),
              onChanged: (value){
                yearInput = value.toString();
              },
            )
          ),
          SizedBox(
            height: 20,
          ),
            //-----------------------------Submit Form Data----------------------------------
            Center(
              child:
              InkWell(
                onTap:(){
                  if (establishInput==null){
                    errorEstablishment(context);
                  }
                  else if(yearInput==null){
                    errorYear(context);
                  }
                  else if(caseTypeInput==null){
                    errorCaseType(context);
                  }
                  else if(caseNumberInput == null || caseNumberInput!.isEmpty || caseNumberInput! == '0' ||caseNumberInput!.contains('-') || caseNumberInput!.contains(',') || caseNumberInput!.contains('.')|| caseNumberInput!.contains('+') ){
                    errorDialogN(context);
                  }
                  else{
                       Navigator.push(context,
                     MaterialPageRoute(
                      builder: (context)=>DDefaults(),            ));
                  }
            
                },
                
                child: Container(
                    width:double.infinity,
                    padding:const EdgeInsets.symmetric(vertical:15),
                    decoration: BoxDecoration(
                      color:const Color.fromARGB(255, 62, 68, 107), 
                      borderRadius: BorderRadius.circular(15),
                  
                      ),
                      child: const Text('Show',textAlign: TextAlign.center,style:TextStyle(fontSize: 16,color:Colors.white)
                      ),
                    ),
              ),),
            ],
          ),
        ),
      ),
    );
  }
}

void errorEstablishment(BuildContext context){
  showDialog(context: context, builder: (BuildContext context){
    return const AlertDialog(
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
      title:Text(' Establishment '),
      content:Text('Establishment Not Selected!'),
    );
  });
}

void errorYear(BuildContext context){
  showDialog(context: context, builder: (BuildContext context){
    return const AlertDialog(
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
      title:Text(' Case Year '),
      content:Text('Case Year Not Selected !'),
    );
  });
}

void errorDialogN(BuildContext context){
  showDialog(context: context, builder: (BuildContext context){
    return const AlertDialog(
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
      title:Text(' Case Number '),
      content:Text('Invalid Case Number  \nPlease Check!'),
    );
  });
}

void errorCaseType(BuildContext context){
  showDialog(context: context, builder: (BuildContext context){
    return const AlertDialog(
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
      title:Text(' Case Type '),
      content:Text('Please Select Case Type !'),
    );
  });
}

