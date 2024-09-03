import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mphc_app/pages/displayBoard/display_board_form.dart';


String ? benchInput;
class DisplayBoard extends StatefulWidget {
 
  const DisplayBoard({
    // required this.bench,
    super.key});

  @override
  State<DisplayBoard> createState() => _DisplayBoardState();
}

class _DisplayBoardState extends State<DisplayBoard> {
  bool collapse = false;

String ? caseResponse;
Map ?    caseResult;
List ?   caseData;
bool ?   available;

   Future benchAPI() async{
    //  if(details == true){
    http.Response casedetails;
    try{
        casedetails = await http.post(Uri.parse('http://ns2.mphc.in/api/display_board.php'),
        body:{
        // 'bench':'01',
        // 'case_type':'11',
        // 'case_no':'222',
        // 'case_year':'2016',
        'bench':benchInput,
        // 'case_type':caseTypeInput,
        // 'case_no':caseNumberInput,
        // 'case_year':yearInput,
      }
      );
      
      if(casedetails.statusCode==200){
          caseResponse = casedetails.body;
          caseResult  = json.decode(casedetails.body);
          available = caseResult?['success'];
          debugPrint('-------------------Display Board Called-------------------------');
          caseData = caseResult?['results'];
          // debugPrint(caseData.toString());
      }
      }
    catch(e){
      debugPrint('$e');
      }
    //  }
    //  details = false;

    }


  @override
  void initState() {
    benchAPI();
    super.initState();
  }

@override
void dispose() {
    benchInput = null;
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2, // Number of tabs
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>DisplayBoardForm()));
            }, icon: const Icon(Icons.arrow_back)),
            title: const Text('Case Details'),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Display Board'),
                Tab(text: 'Detailed Display Board'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              // Content for Tab 1
              SingleChildScrollView(
                child: Container(
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[
                
                           FutureBuilder(
                          future:benchAPI(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Center(child: CircularProgressIndicator());
                            } else if (caseData == null) {
                              return const Center(child: Text('No Record Found'));
                            } else {
                              return Container(
                              
                  decoration: const BoxDecoration(
                
                  ),
                
                
                  child:SingleChildScrollView(
                 scrollDirection: Axis.vertical,
                
                 child: Container(
                  margin: const EdgeInsets.all(10),
                   child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                   
                       const SizedBox(height: 20,),
                
                    SingleChildScrollView(
                      child: Table(
                        columnWidths:const {
                              0:FlexColumnWidth(1),
                              1:FlexColumnWidth(2),
                              2:FlexColumnWidth(1),
                              3:FlexColumnWidth(2),
                              4:FlexColumnWidth(4),
                        },
                      border: TableBorder.all(width: 0.3),
                      children: [
                          TableRow(
                          children: [
                      
                            TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), height:60,child:const Text('C.No'          , style:TextStyle(fontWeight: FontWeight.w500,fontSize:16)))),
                            TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), height:60,child:const Text('Court'         , style:TextStyle(fontWeight: FontWeight.w500,fontSize:16) ))),
                            TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), height:60,child:const Text('Sr.No'         , style:TextStyle(fontWeight: FontWeight.w500,fontSize:16) ))),
                            TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), height:60,child:const Text('Case.No        ', style:TextStyle(fontWeight: FontWeight.w500,fontSize:16) ))),
                            TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), width:200,height:60,child: const Text('Court\nMessage', style:TextStyle(fontWeight: FontWeight.w500,fontSize:16)))),
                         ]
                        ),
                        for(var documents in caseData!)
                          TableRow(
                            
                          children: [
                            TableCell(child:Container(padding:const EdgeInsets.all(10),child:Text(documents!['Court_No'].toString(),   style:const TextStyle(fontWeight: FontWeight.w400,fontSize:16)))),
                            TableCell(child:Container(
                              padding:const EdgeInsets.all(10),
                              child: RichText(
                                 text: TextSpan(
                                   style: DefaultTextStyle.of(context).style,
                                   children: <TextSpan>[
                                     TextSpan(text: documents!['Judge_Code'].toString()),
                                     TextSpan(text:'-'),
                                     TextSpan(text: documents!['Single_Double_Bench'].toString()),
                                            ]),
                                        ),
                                     ),
                                 ),
                            // TableCell(child:Container(child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children:[ Text(documents!['Judge_Code'].toString()), const Text('-'),Text(documents!['Single_Double_Bench'].toString())]))),
                            TableCell(child:Container(padding:const EdgeInsets.all(10),child:Text(documents!['Sr_No'].toString(), style:const TextStyle(fontWeight: FontWeight.w400,fontSize:16)))),
                            TableCell(child:Container(padding:const EdgeInsets.all(10),child:Text(documents!['Case_Number'].toString(), style:const TextStyle(fontWeight: FontWeight.w400,fontSize:16)))),
                            TableCell(child:Container(width:200,padding:const EdgeInsets.all(10),child:Text(documents!['Court_Message'].toString(), style:const TextStyle(fontWeight: FontWeight.w400,fontSize:16)),)),
                          
                          ]
                        ),
                                        
                        
                      ],
                                        ),
                    ),
                
                
                                 ],
                               ),
                 ),
                               ),
                              
                  
                  );
                            }
                          }),
                
                      
                    ]
                  )
                ),
              ),
              // Content for Tab 2

              FutureBuilder(
          future:benchAPI(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (caseData == null) {
              return const Center(child: Text('No Record Found'));
            } else {
              return
              ListView.builder(
                itemCount: caseData!.length,
                itemBuilder: (context, index){


                  


                  return Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color:const Color.fromARGB(255, 232, 236, 246),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child:
                    
                    
                    
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FmText(isbold:true, leftWidth:2,title: 'Court :', response: caseData![index]['Judge_Code'].toString()),
                        FmText(isbold:true, leftWidth:2,title: 'Sr No.', response: caseData![index]['Sr_No'].toString()),
                        FmText(isbold:true, leftWidth:2,title: 'Case Number', response: caseData![index]['Case_Number'].toString()),
                         TextButton(                         
                          onPressed: (){
                            
                            showDialog(context: context, builder: (BuildContext context){
                                  return AlertDialog(
                                    shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                                    title:const Text('Case Details '),
                                    content:SingleChildScrollView(
                                      child: Container(
                                        height: 400,
                                        child: Column(
                                          children: [
                                              FmText(isbold:true, leftWidth:2,title: 'Petitioner :', response: caseData![index]['Petitioner_Name'].toString()),
                                              FmText(isbold:true, leftWidth:2,title: 'Respondent', response: caseData![index]['Respondent_Name'].toString()),
                                              FmText(isbold:true, leftWidth:2,title: 'Court Message', response: caseData![index]['Court_Message'].toString()),
                  
                                        
                                            
                                          ],
                                        ),

                                        
                                      ),
                                    ),
                                  );
                                // });

                                });

                            }, child: const Text('Show More')
                         ),


                        //  Visibility(
                        //   visible: this.collapse,

                          
                        //   child:
                        //   Column(
                        //     children:[
                        //        FmText(isbold:true, leftWidth:2,title: 'Petitioner :', response: caseData![index]['Petitioner_Name'].toString()),
                        //        FmText(isbold:true, leftWidth:2,title: 'Respondent', response: caseData![index]['Respondent_Name'].toString()),
                        //        FmText(isbold:true, leftWidth:2,title: 'Court Message', response: caseData![index]['Court_Message'].toString()),
                        // //     ]

                        //   ),
                          
                        //    ),
                      ],
                    )
                  );
                },
               );
              }
          }
              ),
              // Content for Tab 3
            ],
          ),
        ),
      ),
    );
  }
}

















  class FmText extends StatefulWidget {
  final String title;
  final String response;
  final bool ? isbold;
  final int ? leftWidth;
  final bool ? responsebold;
  
  const FmText({
    required this.title,
    required this.response,
    this.isbold,
    this.leftWidth,
    this.responsebold,
    super.key});

  @override
  State<FmText> createState() => _FmTextState();
}

class _FmTextState extends State<FmText> {
int ?titleWidth;
bool ? rb;
@override
void initState() {
 titleWidth  =  widget.leftWidth ?? 3;
 rb = widget.responsebold ?? false;
 super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Container(
      // color:Color.fromARGB(8, 255, 219, 103),
      padding:const EdgeInsets.symmetric(vertical: 5),
      // decoration: BoxDecoration(border:bo) ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex:titleWidth!, child: Container(margin: const EdgeInsets.fromLTRB(0, 3, 2, 0), color:const Color.fromARGB(0, 255, 221, 52),child:Text('${widget.title}',style:TextStyle(fontWeight: widget.isbold ==true?FontWeight.bold:FontWeight.normal,fontSize: 15)))),
          Expanded(flex:5,child: Container(margin: const EdgeInsets.fromLTRB(5, 3, 2, 0), color:const Color.fromARGB(0, 178, 178, 178) ,child:Text('${widget.response}',style:TextStyle(fontSize: 15,fontWeight: rb ==true?FontWeight.bold:FontWeight.normal)))),
          
        ],
      ),
    );
  }
}