import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



//-----Form Storage Variables 
  String ? establishInput;
  String ? selectInput;
  String ? judgeInput;
  String ? benchInput;
  String ? pickedDate;
  String ? place;


class CauseListJudge extends StatefulWidget {
  const CauseListJudge({super.key});

  @override
  State<CauseListJudge> createState() => _CauseListJudgeState();
}

class _CauseListJudgeState extends State<CauseListJudge> {


//-------------------Cause List Judge-----------------------------
String ? cLJudgeResponse;
Map ?    cLJudgeResult;
List ?   cLJudgeData;
bool ?   cLJudgeAvailable;



   Future getCauseListJudge() async{
  //  if(pa == true){
    http.Response paperbook;
    try{
      // http://ns2.mphc.in/yeeryeryerye/causelist.php

        paperbook = await http.post(Uri.parse('http://ns2.mphc.in/new_mobile_app_api/causelist.php'),
        body:{
       
        //  dtd:05-11-2020
         // bench:01
         // jcd:90
         // place:JBP
        // sbdb:2
        // dw:1
         // mfb:M
        // 'dtd':pickedDate.toString().split(' ')[0],
        'dtd':pickedDate,
        'bench':establishInput,
        'jcd':judgeInput,
        'place':place,
        'sbdb':benchInput,
        'dw':'1',
        'mfb':selectInput,
        
        
        

        // 'dtd:'pickedDate.toString().split(' ')[0],
      }
      );
      if(paperbook.statusCode==200){
        // setState(() {
          cLJudgeResponse = paperbook.body;
          cLJudgeResult  = json.decode(paperbook.body);
          cLJudgeAvailable = cLJudgeResult?['success'];
          // debugPrint('${caseResult?[0][0]} ');
          debugPrint('-------------------Paper Book api called-------------------------');
          // debugPrint(documentsResult?['results'].toString());
          cLJudgeData = cLJudgeResult?['results'];
          debugPrint(cLJudgeData.toString());

        // });
      }
      }
    catch(e){
      debugPrint('$e');
      }
    // }
    // paperBookCalled = false;
  }

@override
  void initState() {
    // getCauseListJudge();
    super.initState();
  }


 
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text('Cause List - Judges'),
      
      ),
      body: FutureBuilder(
          future: getCauseListJudge(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (cLJudgeData == null) {
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
                              2:FlexColumnWidth(2),
                              3:FlexColumnWidth(2),
                              // 4:FlexColumnWidth(4),
                        },
                      border: TableBorder.all(width: 0.3),
                      children: [
                          TableRow(
                          children: [
                      
                            TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), height:60,child:const Text('C.L. No.'          , style:TextStyle(fontWeight: FontWeight.w500,fontSize:16)))),
                            TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), height:60,child:const Text('Case Number'         , style:TextStyle(fontWeight: FontWeight.w500,fontSize:16) ))),
                            TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), height:60,child:const Text('CauseList Date'         , style:TextStyle(fontWeight: FontWeight.w500,fontSize:16) ))),
                            TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), height:60,child:const Text('Other Details        ', style:TextStyle(fontWeight: FontWeight.w500,fontSize:16) ))),
                            // TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), width:200,height:60,child: const Text('Court\nMessage', style:TextStyle(fontWeight: FontWeight.w500,fontSize:16)))),
                         ]
                        ),
                        for(var documents in cLJudgeData!)
                          TableRow(
                            
                          children: [
                            TableCell(child:Container(padding:const EdgeInsets.all(10),child:Text(documents!['brd_slno'].toString(),   style:const TextStyle(fontWeight: FontWeight.w400,fontSize:16)))),
                            // TableCell(child:Container(child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children:[ Text(documents!['case_number'].toString()), const Text('-'),Text(documents!['Single_Double_Bench'].toString())]))),
                            TableCell(child:Container(padding:const EdgeInsets.all(10),child:Text(documents!['case_number'].toString(), style:const TextStyle(fontWeight: FontWeight.w400,fontSize:16)))),
                            TableCell(child:Container(padding:const EdgeInsets.all(10),child:Text(documents!['next_dt'].toString(), style:const TextStyle(fontWeight: FontWeight.w400,fontSize:16)))),
                            TableCell(child:Container(padding:const EdgeInsets.all(4),child:
                            
                          TextButton(onPressed:(){

                                showDialog(context: context, builder: (BuildContext context){
                                  return AlertDialog(
                                            shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                                            title:const Text('Cause List'),
                                            content:SingleChildScrollView(
                                            child: Container(
                                            // height: 600,
                                            child: Column(
                                              children: [
                                                // 
                                                FmText(title: 'Petitioner',  response:documents!['Petitioner_name'].toString()),
                                                FmText(title: 'Respondent',  response:documents!['Respondent_name'].toString()),
                                                FmText(title: 'Respondent',  response:documents!['Respondent_name'].toString()),
                                                FmText(title: 'Advocates for Pet.',  response:documents!['Petitioner_adv'].toString()),
                                                FmText(title: 'Advocates for Res.',  response:documents!['Respondent_adv'].toString()),
                                                FmText(title: 'Next Tentative Date.',response:documents!['next_dt'].toString()),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                // });
                
                                });


                          } , child:const Text('More Details')),
                            )),
                          
                          ]
                        ),
                                        
                        
                      ],
                                        ),
                    ),
                
                
                
                
                
                
                    // DataTable(
                      
                    //   headingRowColor:const MaterialStatePropertyAll(Color.fromARGB(255, 238, 240, 244)),
                    //   columnSpacing: 10,
                    //   border:TableBorder.all(width: 0.1),
                      
                    //   columns: const[
                    //     DataColumn(label: Expanded(flex:1,child:Text('C.No'))),
                    //     DataColumn(label: Expanded(flex:1,child:Text('Court'))),
                    //     DataColumn(label: Expanded(flex:1,child:Text('Sr.No'))),
                    //     DataColumn(label: Expanded(flex:1,child:Text('Case.No'))),
                    //     DataColumn(label: Expanded(child: Text('Court\nMessage'))),
                    //     // DataColumn(label: Expanded(child: Text('More \nDetails'))),
                    //   ],
                    //   rows: [
                    //     // for (var document in snapshot.data!)
                    //     for(var documents in caseData!)
                    //       DataRow(
                    //         cells: [
                    //           DataCell(Container( height:100,child:Text(documents!['Court_No'].toString()))),
                    //           DataCell(Container( height:100,child:Row(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children:[ Text(documents!['Judge_Code'].toString()), Text('-'),Text(documents!['Single_Double_Bench'].toString())]))),
                    //           DataCell(Container( height:100,child:Text(documents!['Sr_No'].toString()))),
                    //           DataCell(Container( height:100,child:Text(documents!['Case_Number'].toString()))),
                    //           DataCell(Container( width: 100, height:100,child:SingleChildScrollView(scrollDirection:Axis.vertical,child: Text(documents!['Court_Message'].toString(),softWrap: true,)))),
                           
                    //         //   DataCell(SingleChildScrollView(scrollDirection:Axis.vertical,child:GestureDetector( onTap:(){
                    //         //     // setState(() {
                    //         //        showDialog(context: context, builder: (BuildContext context){
                    //         //       return AlertDialog(
                    //         //         shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                    //         //         title:const Text('Connected Details '),
                    //         //         content:SingleChildScrollView(
                    //         //           child: Container(
                    //         //             height: 400,
                    //         //             child: Column(
                    //         //               children: [
                    //         //                 FmText(title: 'Respondant', response:documents!['respondant'].toString()),
                    //         //                 FmText(title: 'List', response:documents!['list'].toString()),
                    //         //                 FmText(title: 'Status', response:documents!['status'].toString()),
                                         
     
                    //         //               ],
                    //         //             ),
                    //         //           ),
                    //         //         ),
                    //         //       );
                    //         //     // });
                
                    //         //     });
                             
                    //         // },child: Container( height:30,child:const Text('More Details'))))),
                            
                              
                    //           // DataCell(SingleChildScrollView(scrollDirection:Axis.vertical,child:Container( height:30,child:Text(documents!['Action'].toString())   ))),
                              
                    //           // DataCell(SingleChildScrollView(scrollDirection:Axis.vertical,child:Container( height:30,child:Text(documents!['Other'].toString())   ))),
                              
                    //         ],
                    //       ),
                    //   ],
                    // ),
                                 ],
                               ),
                 ),
                               ),
                              
                  
                  );

              //  return SingleChildScrollView(
              //   scrollDirection: Axis.vertical,

              //    child: Column(
              //         children: [

              //        const SizedBox(height: 20,),
              //     DataTable(
                    
              //       headingRowColor:const MaterialStatePropertyAll(Color.fromARGB(255, 238, 240, 244)),
              //       columnSpacing: 10,
              //       border:TableBorder.all(width: 0.1),
                    
              //       columns: const[
              //         DataColumn(label: Expanded(flex:1,child:Text('C.L. No.'))),
              //         DataColumn(label: Expanded(flex:1,child:Text('Case Number'))),
              //         DataColumn(label: Expanded(flex:1,child:Text('CauseList Date'))),
              //         DataColumn(label: Expanded(flex:1,child:Text('Other Details'))),
              //       ],
              //       rows: [
              //         // for (var document in snapshot.data!)
              //         for(var documents in cLJudgeData!)
              //           DataRow(
              //             cells: [
              //               DataCell(SingleChildScrollView(scrollDirection:Axis.vertical,child: Container( height:30,child:Text((documents!['brd_slno'].split(',')[0]).toString())   ))),
              //               DataCell(SingleChildScrollView(scrollDirection:Axis.vertical,child: Container( height:30,child:Text(documents!['case_number'].toString()) ))),
              //               DataCell(SingleChildScrollView(scrollDirection:Axis.vertical,child: Container( height:30,child:Text(documents!['next_dt'].toString())      ))),
              //               DataCell(TextButton(onPressed: (){
                                  
                                    
              //                              showDialog(context: context, builder: (BuildContext context){
              //                               return AlertDialog(
              //                               shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
              //                               title:const Text('Cause List'),
              //                               content:SingleChildScrollView(
              //                               child: Container(
              //                               // height: 600,
              //                               child: Column(
              //                                 children: [
                                                
              //                                   FmText(title: 'Petitioner',  response:cLJudgeData![index]['Petitioner_name'].toString()),
              //                                   FmText(title: 'Respondent',  response:cLJudgeData![index]['Respondent_name'].toString()),
              //                                   FmText(title: 'Respondent',  response:cLJudgeData![index]['Respondent_name'].toString()),
              //                                   FmText(title: 'Advocates for Pet.',  response:cLJudgeData![index]['Petitioner_adv'].toString()),
              //                                   FmText(title: 'Advocates for Res.',  response:cLJudgeData![index]['Respondent_adv'].toString()),
              //                                   FmText(title: 'Next Tentative Date.',  response:cLJudgeData![index]['next_dt'].toString()),
              //                                 ],
              //                               ),
              //                             ),
              //                           ),
              //                         );
              //                                                         // });
                                      
              //                                                         });
                                          
              //                             },
              //                             child:const Text('Show More'),
              //                           ),

              //               },child:const Text('show more'))),
                            

              //             ],
              //           ),
              //       ],
              //     ),
              //                  ],
              //                ),
              //  );


              // return  Container(
              //     child: ListView.builder(
              //         itemCount: cLJudgeData!.length,
              //         itemBuilder: (context, index) {
              //           return Container(
              //               margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              //               padding: const EdgeInsets.all(10),
              //               decoration: BoxDecoration(
              //                   color: const Color.fromARGB(255, 240, 240, 246),
              //                   borderRadius: BorderRadius.circular(10)),
              //                   // color:Colors.white70,
              //                   child: Column(
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     // Text(appearanceData!.toString()),

              //                     FmText(isbold:true,title: 'C.L.No :',      response: cLJudgeData![index]['brd_slno'].toString()),
              //                     FmText(isbold:true,title: 'Case Number :', response:   cLJudgeData![index]['case_number'].toString()),
              //                     FmText(isbold:true,title: 'Causelist Dated :',  response: cLJudgeData![index]['next_dt'].toString()),
              //                     // FmText(isbold:true,title: 'Name of Main Advocate :',   response: cLJudgeData![index]['Main_Advocate'].toString()),
              //                     // FmText(isbold:true,title: 'Whether Appeared (Next Date):',  response: cLJudgeData![index]['Whether_Appeared_Next_Date'].toString()),
              //                     // FmText(leftWidth:0, isbold: true, title:'PDF :' ,response: appearanceData![index]['PDF'].toString(),),
              //                     Row(
              //                       mainAxisAlignment: MainAxisAlignment.end,
              //                       children: [
              //                         TextButton(
              //                           onPressed: (){
              //                              showDialog(context: context, builder: (BuildContext context){
              //                               return AlertDialog(
              //                               shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
              //                               title:const Text('Cause List'),
              //                               content:SingleChildScrollView(
              //                               child: Container(
              //                               // height: 600,
              //                               child: Column(
              //                                 children: [
                                                
              //                                   FmText(title: 'Petitioner',  response:cLJudgeData![index]['Petitioner_name'].toString()),
              //                                   FmText(title: 'Respondent',  response:cLJudgeData![index]['Respondent_name'].toString()),
              //                                   FmText(title: 'Respondent',  response:cLJudgeData![index]['Respondent_name'].toString()),
              //                                   FmText(title: 'Advocates for Pet.',  response:cLJudgeData![index]['Petitioner_adv'].toString()),
              //                                   FmText(title: 'Advocates for Res.',  response:cLJudgeData![index]['Respondent_adv'].toString()),
              //                                   FmText(title: 'Next Tentative Date.',  response:cLJudgeData![index]['next_dt'].toString()),
              //                                 ],
              //                               ),
              //                             ),
              //                           ),
              //                         );
              //                                                         // });
                                      
              //                                                         });
                                          
              //                             },
              //                             child:const Text('Show More'),
              //                           ),
              //                       ],
              //                     ),
              //                       // HtmlWidget("<a href='${appearanceData![index]['PDF']}'>PDF</a>"),
                                    
                                  
                                  

              //                     //  RichText(
              //                     //         text: LinkTextSpan(
              //                     //             url: 'http://docs.google.com/viewer?url=http://www.pdf995.com/samples/pdf.pdf',
              //                     //             text: 'Show My Pdf'),
              //                     //       ),
              //                     // GestureDetector(
              //                     //    url ?=  appearanceData![index]['PDF'].toString();
              //                     //   onTap:(url)     {
              //                     //     debugPrint(url)
              //                     //   }                              
              //                     //   child: Text('Open PDF')
              //                     //   ),
                                  


              //                   ]));
              //         }));
             



  }
          }
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
   