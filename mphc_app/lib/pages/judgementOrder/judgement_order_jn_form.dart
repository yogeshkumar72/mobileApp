import 'package:flutter/material.dart';
import './judgement_order_jn.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:dropdown_search/dropdown_search.dart';

class JudgementOrderFormJN extends StatefulWidget {
  const JudgementOrderFormJN({super.key});

  @override
  State<JudgementOrderFormJN> createState() => _JudgementOrderFormJNState();
}

class _JudgementOrderFormJNState extends State<JudgementOrderFormJN> {


  String? stringResponse;
  Map? mapResult;
  List? dropItems;

  List<String>? dropListUser;
  List<String>? dropListCode;




  
Future judgeApi() async{
    http.Response response;
    try{
      // /http://ns2.mphc.in/dgjdjdfj/judges.php?bench=1
    response = await http.post(Uri.parse('http://ns2.mphc.in/new_mobile_app_api/judges.php'),body:{
      'bench':'1',
    });
    if (response.statusCode==200){
    setState(() {
        stringResponse = response.body;
        mapResult = json.decode(response.body);
        dropItems = mapResult?['results'];
        dropListUser = dropItems!.map((map) =>(map['judgename']).toString()).toList();
        dropListCode = dropItems!.map((map) =>(map['judgecode']).toString()).toList();
        debugPrint(dropListUser.toString());
        debugPrint(dropItems.toString());
      });
    }
    }catch(e){
      debugPrint('$e');
    }
  }


  String ? formattedDate1;
  String ? formattedDate2;
  
Future <void> _selectDate1() async{
  DateTime ? picked1 = await showDatePicker(
      useRootNavigator: true,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1976),
      lastDate: DateTime(2100), 
  );
  if(picked1 !=null){
    setState(() {
      
     formattedDate1 = DateFormat('dd-MM-yyyy').format(picked1);
      // dateController?.text = formattedDate.toString();
     
      // pickedDate = picked.toString();
      pickedDateInitial = formattedDate1.toString();
    });
  }
}

Future <void> _selectDate2() async{
  DateTime ? picked2 = await showDatePicker(
      useRootNavigator: true,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1976),
      lastDate: DateTime(2100), 
  );
  if(picked2 !=null){
    setState(() {
      
     formattedDate2 = DateFormat('dd-MM-yyyy').format(picked2);
      // dateController?.text = formattedDate.toString();
     
      // pickedDate = picked.toString();
      pickedDateEnd = formattedDate2.toString();
    });
  }
}



@override
  void initState() {
    judgeApi();
    clearAPIVariables();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      // backgroundi: Image.asset('bg_abstract.jpg'),
      
      appBar: AppBar(
        title:const Text('Judgment/ Order'),
      ),
      body:   DecoratedBox(
        decoration: const BoxDecoration(
          image: DecorationImage(opacity: 0.08,image: AssetImage('images/bg_abstract.jpg'),fit:BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                    
                //----------------------------------------Establishment Input ------------------------------------------Field Case Status Form
                Container(
                  width: 210,
                  margin: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                  child: DropdownButton<String>(
                    value: establishInput,
                    hint: const Text('Select Establishment'),
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
                ),
            
                 Container(
                   margin: const EdgeInsets.fromLTRB(40, 10,0, 0),child: const Text('Free Text',style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold))),
                   Container(
                   margin: const EdgeInsets.fromLTRB(40,10,40,20),
                      child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      // style:const TextStyle(backgroundColor: Colors.amber),
                      onChanged: (value){
                        setState(() {
                          freeText = value;
                        });
                     
                      },
                     ),
                   ),
            
             //---------------------Judges-----------------
              Container(margin: const EdgeInsets.fromLTRB(40, 10,0, 0),child: const Text('Select Judges',style:TextStyle(fontSize: 15,fontWeight: FontWeight.bold))),
              Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(40, 10, 40, 0),
              child:DropdownSearch<String>(
                  popupProps:const  PopupProps.menu(
                    showSearchBox: true,
                    searchDelay: Duration.zero,
                      showSelectedItems: true,
                    ),
                  items:  dropListUser == null? []:dropListUser!,
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        border:OutlineInputBorder(),
                          labelText: "Hon'ble Judges",
                          hintText: "select Hon'ble Judges",
                      ),
                  ),
                  onChanged: (value){
                    int index = dropListUser!.indexWhere((element)=>element == value!);
                    String val = dropListCode![index];
                    setState((){
                    judgeInput1 = val;
                    });
                    debugPrint(val);
                  },
                )
              ),
          
              //---------------------Judges-----------------
              //  Container(margin: const EdgeInsets.fromLTRB(20, 10,0, 0),child: const Text('Select Judges',style:TextStyle(fontWeight: FontWeight.bold))),
               
              Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(40, 10, 40, 0),
              child:DropdownSearch<String>(
                  popupProps:const  PopupProps.menu(
                    showSearchBox: true,
                    searchDelay: Duration.zero,
                      showSelectedItems: true,
                    ),
                  items:  dropListUser == null? []:dropListUser!,
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        border:OutlineInputBorder(),
                          labelText: "Hon'ble Judges",
                          hintText: "select Hon'ble Judges",
                      ),
                  ),
                  onChanged: (value){
                    int index = dropListUser!.indexWhere((element)=>element == value!);
                    String val = dropListCode![index];
                    setState((){
                    judgeInput2 = val;
                    });
                    debugPrint(val);
                  },
                )
              ),
          
          
          //---------------------Judges-----------------
              //  Container(margin: const EdgeInsets.fromLTRB(20, 10,0, 0),child: const Text('Select Judges',style:TextStyle(fontWeight: FontWeight.bold))),
               
              Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(40, 10, 40, 0),
              child:DropdownSearch<String>(
                  popupProps:const  PopupProps.menu(
                    showSearchBox: true,
                    searchDelay: Duration.zero,
                      showSelectedItems: true,
                    ),
                  items:  dropListUser == null? []:dropListUser!,
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                      //  isCollapsed: false,
                        border:OutlineInputBorder(),
                          labelText: "Hon'ble Judges",
                          hintText: "select Hon'ble Judges",
                      ),
                  ),
                  onChanged: (value){
                    int index = dropListUser!.indexWhere((element) => element == value!);
                    String val = dropListCode![index];
                    setState((){
                    judgeInput3 = val;
                    });
                    debugPrint(val);
                  },
                )
              ),
          
          
          //---------------------Judges-----------------
              //  Container(margin: const EdgeInsets.fromLTRB(20, 10,0, 0),child: const Text('Select Judges',style:TextStyle(fontWeight: FontWeight.bold))),
               
              Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(40, 10, 40, 0),
              child:DropdownSearch<String>(
                  popupProps:const  PopupProps.menu(
                    showSearchBox: true,
                    searchDelay: Duration.zero,
                      showSelectedItems: true,
                    ),
                  items:  dropListUser == null? []:dropListUser!,
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        border:OutlineInputBorder(),
                          labelText: "Hon'ble Judges",
                          hintText: "select Hon'ble Judges",
                      ),
                  ),
                  onChanged: (value){
                    int index = dropListUser!.indexWhere((element)=>element == value!);
                    String val = dropListCode![index];
                    setState((){
                    judgeInput4 = val;
                    });
                    debugPrint(val);
                  },
                )
              ),
          
          
          //---------------------Judges-----------------
              //  Container(margin: const EdgeInsets.fromLTRB(20, 10,0, 0),child: const Text('Select Judges',style:TextStyle(fontWeight: FontWeight.bold))),
               
              Container(
              width: double.infinity,
              margin: const EdgeInsets.fromLTRB(40, 10, 40, 0),
              child:DropdownSearch<String>(
                  popupProps:const  PopupProps.menu(
                    showSearchBox: true,
                    searchDelay: Duration.zero,
                      showSelectedItems: true,
                    ),
                  items:  dropListUser == null? []:dropListUser!,
                  dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        border:OutlineInputBorder(),
                          labelText: "Hon'ble Judges",
                          hintText: "select Hon'ble Judges",
                      ),
                  ),
                  onChanged: (value){
                    int index = dropListUser!.indexWhere((element)=>element == value!);
                    String val = dropListCode![index];
                    setState((){
                    judgeInput5 = val;
                    });
                    debugPrint(val);
                  },
                )
              ),

              // ----------------Party Name---------------------------
                    Container(margin: const EdgeInsets.fromLTRB(40, 20,0, 0),child: const Text('Party Name',style:TextStyle(fontWeight: FontWeight.bold))),
              
                    Container(
                      margin:const  EdgeInsets.fromLTRB(40, 10, 40, 0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                            width: 100,
                            // margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                            child: DropdownButton<String>(
                              
                              // decoration:const InputDecoration(
                              //       border:OutlineInputBorder(),
                              // ),
                              value:partyType,
                              hint: const Text('Select'),
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    partyType = newValue;
                                    // debugPrint(establishInput);
                                  });
                                }
                              },
                              items: const [
                                DropdownMenuItem<String>(
                                  value: 'pet',
                                  child: Text('Petitioner'),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'res',
                                  child: Text('Respondent'),
                                ),
                                
                              ],
                            ),
                                                  ),
                          ),
                        
                      
                      Expanded(
                        flex:1,
                        child: Container(
                          // margin: EdgeInsets.all(5),
                              child: TextFormField(
                              
                                onChanged: (value){
                            setState(() {
                              party = value;
                            });},
                            

                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),

                            ),
                          ),
                        ),
                      
                       
                      
                        ],
                      ),
                    ),

                  // ----------------Counsel Name---------------------------
                    Container(margin: const EdgeInsets.fromLTRB(40, 20,0, 0),child: const Text('Counsel Name',style:TextStyle(fontWeight: FontWeight.bold))),
              
                    Container(
                      margin:const  EdgeInsets.fromLTRB(40, 10, 40, 0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                            width: 100,
                            // margin: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                            child: DropdownButton<String>(
                              
                              // decoration:const InputDecoration(
                              //       border:OutlineInputBorder(),
                              // ),
                              value: counselType,
                              hint: const Text('Select'),
                              onChanged: (String? newValue) {
                                if (newValue != null) {
                                  setState(() {
                                    // establishInput = newValue;
                                    counselType = newValue;
                                    // debugPrint(establishInput);
                                  });
                                }
                              },
                              items: const [
                                DropdownMenuItem<String>(
                                  value: 'pet',
                                  child: Text('Petitioner'),
                                ),
                                DropdownMenuItem<String>(
                                  value: 'res',
                                  child: Text('Respondent'),
                                ),
                                
                              ],
                            ),
                                                  ),
                          ),
                        
                      
                      Expanded(
                        flex:1,
                        child: Container(
                          // margin: EdgeInsets.all(5),
                          child: TextFormField(
                            onChanged: (value){
                              setState(() {
                              counsel = value;
                            });},

                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),

                            ),
                          ),
                        ),
                      
                      
                      
                        ],
                      ),
                    ),
                    // -----------------------------Judgements between dates-----------------------
               Container(margin: const EdgeInsets.fromLTRB(40, 20,0, 0),child: const Text('Judgements between dates',style:TextStyle(fontWeight: FontWeight.bold))),
              
                     Row(
                       children: [
                         Expanded(
                           child: Container(
                            width: double.infinity,
                            margin: const EdgeInsets.fromLTRB(40, 20, 0, 20),
                            child: TextField( 
                              onTap: (){
                                _selectDate1();
                              },
                              // controller:dateController,
                              decoration: InputDecoration(
                                // labelText: 'Start from',
                                hintText: pickedDateInitial!=null?pickedDateInitial.toString().split(" ")[0]:'Start',
                                filled:true,
                                prefixIcon:const Icon(Icons.calendar_today),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide:BorderSide(
                                    color:Colors.blue,
                                  ),
                                ),
                              ),
                              readOnly: true,
                            )
                                      
                          ),
                         ),
                         const Text(' To '),
                         Expanded(
                           child: Container(
                            width: double.infinity,
                            margin: const EdgeInsets.fromLTRB(0, 20, 40, 20),
                            child: TextField( 
                              onTap: (){
                                _selectDate2();
                              },
                              // controller:dateController,
                              decoration: InputDecoration(
                                // labelText: formattedDate2,
                                hintText: pickedDateEnd!=null?pickedDateEnd.toString().split(" ")[0]:'End',
                                filled:true,
                                prefixIcon:const Icon(Icons.calendar_today),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide:BorderSide(
                                    color:Colors.blue,
                                  ),
                                ),
                              ),
                              readOnly: true,
                            )
                                      
                           ),
                         ),
                         
                       ],
                     ),


                    Center(child: Container( margin:const EdgeInsets.symmetric(vertical: 20, horizontal: 10),padding:const EdgeInsets.symmetric(horizontal:20 , vertical: 0) ,decoration: BoxDecoration(color:const Color.fromARGB(255, 211, 211, 211), borderRadius: BorderRadius.circular(10)),child: TextButton(
                      onPressed: (){
                        debugPrint(pickedDateInitial);
                        debugPrint(pickedDateEnd);
                        debugPrint(judgeInput1);
                        debugPrint(judgeInput2);
                        debugPrint(judgeInput3);
                        debugPrint(judgeInput4);
                        debugPrint(judgeInput5);
                        debugPrint(freeText);
                        debugPrint(establishInput);
                        debugPrint(party);
                        debugPrint(partyType);
                        debugPrint(counsel);
                        debugPrint(counselType);


                        if(judgeInput1!=null){
                        Navigator.push(context,MaterialPageRoute(builder: (context)=> const JudgementOrderJN()));
                        }
                        else{
                          judgeInputError(context);
                        }
                      },
                      child: const Text('Show' , style:TextStyle(fontSize: 15)),
                           ),
                        ),
                    ),


                 ] ),
          
          
          
          
            
            
            
            
            
                              
            ),
          ),
       
      ),

    );
  }
}

void judgeInputError(BuildContext context){
  showDialog(context: context, builder: (BuildContext context){
    return const AlertDialog(
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
      title:Text(' Error! '),
      content:Text('Please select Judge Field !'),
    );
  });
}