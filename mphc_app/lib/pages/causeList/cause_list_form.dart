import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;
import 'package:mphc_app/pages/causeList/cause_list_form_adv.dart';
import 'dart:convert';
import 'cause_list_judge.dart';
import 'package:intl/intl.dart';






class CauseListForm extends StatefulWidget {
  const CauseListForm({super.key});

  @override
  State<CauseListForm> createState() => _CauseListFormState();
}

class _CauseListFormState extends State<CauseListForm> {

  TextEditingController? dateController;




// DateTime? pickedDate = await showDatePicker(
//                       context: context,
//                        initialDate: DateTime.now(), //get today's date
//                       firstDate:DateTime(2000), //DateTime.now() - not to allow to choose before today.
//                       lastDate: DateTime(2101)
//                   );



 

  // //-----Form Storage Variables 
  // String ? establishInput;
  // String ? selectInput;
  // String ? judgeInput;
  // String ? benchInput;
  // DateTime? pickedDate;
  // String ? clDate =' Tap Here ';


// String ?stringResponse;

  String? stringResponse;
  Map? mapResult;
  List? dropItems;

  List<String>? dropListUser;
  List<String>? dropListCode;


  // String ? caseNumberInput;

  late bool motion;
   String ? formattedDate ;



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
      dateController?.text = formattedDate.toString();
     
      // pickedDate = picked.toString();
      pickedDate = formattedDate.toString();
    });
  }
}






Future judgeApi() async{
    http.Response response;
    try{
      // /http://ns2.mphc.in/dgjdjdfj/judges.php?bench=1
    response = await http.post(Uri.parse('http://ns2.mphc.in/new_mobile_app_api/judges.php'),body:{
      'bench':establishInput,
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

// Future<void> _selectDate() async {
//     pickedDate = await showDatePicker(
//     context: context,
//     initialDate: DateTime.now(), // get today's date
//     firstDate: DateTime(2000), // not to allow to choose before today
//     lastDate: DateTime(2101),
//   );
// }
@override
  void initState() {
    judgeApi();
    super.initState();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Cause List'),
      
      ),
      body: SingleChildScrollView(
        child:Container(
          margin: const EdgeInsets.all(15),
          
          // color:Colors.amber,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    decoration: BoxDecoration(color:const Color.fromARGB(255, 203, 232, 247),borderRadius: BorderRadius.circular(5)),

                    child: TextButton(
                      
                      onPressed: (){
                      
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>const CauseListAdvForm()));
                    }, child:const Text('Advocate\nCause List') ),
                  ),
                ],
              ),

              // ---------------------------------------Establishment----------------------------------------------
             Container(margin: const EdgeInsets.fromLTRB(20, 10,0, 0),child: const Text('Establishment',style:TextStyle(fontWeight: FontWeight.bold))),
             Container(
              width: 210,
              margin: const EdgeInsets.fromLTRB(40, 10, 40, 20),
              child: DropdownButton<String>(
                value: establishInput,
                hint: const Text('Select Establishment'),
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      establishInput = newValue;
                      debugPrint(establishInput);
                      if(newValue=='01'){
                        place='JBP';
                        judgeApi();
                      }
                      else if(newValue=='02'){
                        place='INDB';
                        judgeApi();
                      }
                      else{
                        place='GWL';
                        judgeApi();
                      }
                      
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

            // ------------------------------Select---------------------------
              Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Select',style:TextStyle(fontWeight: FontWeight.bold) ),
                                Row(
                    children: [
                         Row(
                    children: [
                       
                      //  const Text('Select\n'),
                        Radio(value: 'M', groupValue: selectInput, onChanged: (value){setState(() {
                        selectInput = value;
                                });}),
                                const Text('Motion'),
                    ],
                                ),
                     Row(
                    children: [
                       
                      //  const Text('Select\n'),
                        Radio(value: 'F', groupValue: selectInput, onChanged: (value){setState(() {
                        selectInput = value;
                                });}),
                                const Text('Final'),
                    ],
                                ),
                    
                    ],
                                ),
                    
                    Row(
                    children: [
                         Row(
                    children: [
                       
                      //  const Text('Select\n'),
                        Radio(value: 'L', groupValue: selectInput, onChanged: (value){setState(() {
                        selectInput = value;
                                });}),
                                const Text('Lok Adalat'),
                    ],
                                ),
                     Row(
                    children: [
                       
                      //  const Text('Select\n'),
                        Radio(value: 'S', groupValue: selectInput, onChanged: (value){setState(() {
                        selectInput = value;
                        
                                });}),
                                const Text('Medition'),
                    ],
                                ),
                    
                    ],
                                ),
                  ],
                ),
              ),

                 // ------------------------------Bench---------------------------
                 Container(
                  padding: const EdgeInsets.all(20),
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       const Text('Bench',style:TextStyle(fontWeight: FontWeight.bold) ),
                                   Row( 
                                     children: [
                                   Row(
                                     children: [
                       
                                       //  const Text('Select\n'),
                        Radio(value: '1', groupValue: benchInput, onChanged: (value){setState(() {
                        benchInput = value;
                                   });}),
                                   const Text('single Bench'),
                                     ],
                                   ),
                                      Row(
                                     children: [
                       
                                       //  const Text('Select\n'),
                        Radio(value: '2', groupValue: benchInput, onChanged: (value){setState(() {
                        benchInput = value;
                                   });}),
                                   const Text('Division Bench'),
                                     ],
                                   ),
                       
                                     ],
                                   ),
                                   Row(
              children: [
                   Row(
              children: [
                 
                //  const Text('Select\n'),
                  Radio(value: '3', groupValue: benchInput, onChanged: (value){setState(() {
                  benchInput = value;
            });
            }),
            const Text('Full Bench'),
              ],
            ),
            //    Row(
            //   children: [
            //     //  const Text('Select\n'),
            //       Radio(value: 'meditation', groupValue: selectInput, onChanged: (value){setState(() {
            //       selectInput = value;
            // });}),
            // const Text('Medition'),
            //   ],
            // ),

              ],
            ),

            
                     ],
                   ),
                 ),

              
            //---------------------Judges-----------------
             Container(margin: const EdgeInsets.fromLTRB(20, 10,0, 0),child: const Text('Select Judges',style:TextStyle(fontWeight: FontWeight.bold))),
     
            Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(40, 20, 40, 20),
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
                  judgeInput = val;
                  });
                  debugPrint(val);
                },
              )
            ),

             //---------------------Cause List Date-----------------

             Container(margin: const EdgeInsets.fromLTRB(20, 10,0, 0),child: const Text('Select Cause List Dates',style:TextStyle(fontWeight: FontWeight.bold))),
     
            Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(40, 20, 40, 20),
            child: TextField( 
              onTap: (){
                _selectDate();
              },
              controller:dateController,
              decoration: InputDecoration(
                labelText: 'DATE',
                hintText: pickedDate.toString().split(" ")[0],
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
         
          TextButton(
            onPressed: (){
             debugPrint(pickedDate?.toString());
             debugPrint(establishInput);
             debugPrint(selectInput);
             debugPrint(judgeInput);
             debugPrint(benchInput);
            //  debugPrint(pickedDate.toString().split(' ')[0]);
             debugPrint(formattedDate.toString());
             debugPrint(place);
            if(pickedDate!=null && establishInput!=null && selectInput!=null && judgeInput!=null && benchInput!=null){
             Navigator.push(context, MaterialPageRoute(builder: (context) => const CauseListJudge() ));
           
             }
             else{
               invalidInfo(context);
             }
              }, child: Center(child: Container( padding:const EdgeInsets.symmetric(horizontal: 60, vertical: 13), decoration:const BoxDecoration(color:Color.fromRGBO(40, 109, 146, 1),borderRadius: BorderRadius.all(Radius.circular(8)) ) ,child:const Text('Submit',style:TextStyle(color:Colors.white,fontSize: 16))))
          ),


                
            ],
          ),
        )
      ),
    );
  }
}


void invalidInfo(BuildContext context){
  showDialog(context: context, builder: (BuildContext context){
    return const AlertDialog(
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
      title:Text(' Error '),
      content:Text('Required all the fields!'),
    );
  });
}
