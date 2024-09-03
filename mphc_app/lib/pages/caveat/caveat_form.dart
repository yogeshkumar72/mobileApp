import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;
import 'package:mphc_app/pages/caveat/caveat_case.dart';
import 'dart:convert';
import 'package:mphc_app/pages/caveat/caveat_form_number.dart';



int lenYr = (DateTime.now().year)-2023;

class CaveatForm extends StatefulWidget {
  const CaveatForm({super.key});

  @override
  State<CaveatForm> createState() => _CaveatFormState();
}

class _CaveatFormState extends State<CaveatForm> {
  // String ? establishInput;
  // String ? caseTypeInput;
  // String ? yearInput;
  // String ? caseNumber;



  int currentYear = DateTime.now().year;
  List years = (List.generate(37+lenYr, (currentYear) => currentYear +1987).reversed.toList());


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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomInset: false,
      
      appBar: AppBar(
        title:const Text('Caveat'),
        centerTitle: true,
        backgroundColor: Colors.white,
        // toolbarHeight: 200,
      ),
      
        body: Container(
        height: double.infinity,
        padding:const EdgeInsets.all(40),
        decoration:const BoxDecoration(
        color:Colors.white,
        image: DecorationImage(
          image:AssetImage('images/mphc02.jpg'),fit:BoxFit.contain,
          alignment: Alignment.bottomCenter,
          opacity: 1,
          colorFilter: ColorFilter.mode(Color.fromARGB(255, 2, 21, 71), BlendMode.screen),
          ),
         ),
        // color:const Color.fromARGB(255, 225, 224, 224),
        child:SingleChildScrollView(
          child:Column(
            children:[

              Row(mainAxisAlignment: MainAxisAlignment.end,
                children:[
                  TextButton(onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => const CaveatFormNumber()));
                    }, child:Container(
                      
                      padding: const EdgeInsets.symmetric(vertical:10, horizontal: 20),
                      decoration: BoxDecoration(color:const Color.fromARGB(255, 62, 68, 107) ,borderRadius: BorderRadius.circular(25)),
                      child: const Row(
                      children: [
                        Icon(Icons.search,size: 16,weight: 800,color:Color.fromARGB(221, 255, 255, 255)),
                        Text('   By Caveat Number',style:TextStyle(color:Color.fromARGB(221, 255, 255, 255),fontSize: 16,fontWeight: FontWeight.bold)),
                      ],
                                        ),
                    )),
                ]
              ),
              const SizedBox(height: 20,),


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
            //---------------------------------------------------Case Number-------------------------------------------------------------
            const SizedBox(
                    height: 20,
                  ),

            const Row(
                  children: [
                    Text('   Case Number',style: TextStyle(color:const Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                  ],
                ),
              TextField(
                    keyboardType:TextInputType.number,
                    maxLength: 6,
                    decoration:InputDecoration( 
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      prefixIcon:const Icon(Icons.numbers_outlined,color:const Color.fromARGB(255, 62, 68, 107), ),
                      hintText: 'Case Number ',
                    ),
                    
                    onChanged: (value){
                      setState(() {
                        caseNumber = value;
                      });
                    },
                  ),


            //  const  SizedBox(
            //         height: 20,
            //       ),
              const Row(
                  children: [
                    Text('  Case Year',style: TextStyle(color: Color.fromARGB(255, 62, 68, 107), fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
                  ],
                ),

          
                
              //---------------------------------------------------- Case Year----------------------------------------------------------------------
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



            
                  // const SizedBox(
                  //   height: 10,
                  // ),
                  // TextField(
                  //   maxLength: 4,
                  //   keyboardType:TextInputType.number,
                  //   decoration: InputDecoration(
                  //     border:OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  //     prefixIcon:const Icon(Icons.calendar_month),
                  //     hintText: 'Enter Enroll Year',
                      
                  //   ),
                  //   onChanged: (value){
                  //     setState(() {
                  //       // var enrollYear = value;
                  //     });
                  //   },
                  // ),
                  
                  
                  const SizedBox(
                    height: 20,
                  ),
                  
                  
                   TextButton(onPressed: (){


                    if(establishInput!=null && yearInput!=null && caseNumber!=null && caseTypeInput!=null){

                    debugPrint(establishInput.toString());
                    debugPrint(yearInput.toString());
                    debugPrint(caseNumber.toString());
                    debugPrint(caseTypeInput.toString());

                    Navigator.push(context,MaterialPageRoute(builder: (context)=>const CaveatCaseNumber()));

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
                  ),
      
            ]
          )
        )
      ),
    );
  }
}