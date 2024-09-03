import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// import 'package:mphc/pages/caseStatus/caseDetails/pdfview.dart';
import 'package:url_launcher/url_launcher_string.dart';



String ? partyType;
String ? counselType;
String ? establishInput;
String ? freeText;
String ? judgeInput1;
String ? judgeInput2;
String ? judgeInput3;
String ? judgeInput4;
String ? judgeInput5;
String ? pickedDateInitial; 
String ? pickedDateEnd;
String ? counsel;
String ? party;





//------------------Judgement/orders-------------------
String ? judgementJNResponse;
Map ?    judgementJNResult;
List ?   judgementJNData;
bool ?   judgementJNAvailable;


void clearAPIVariables(){
//  partyType='';
//  counselType='';
//  establishInput='';
 freeText='';
 judgeInput1=null;
 judgeInput2='';
 judgeInput3='';
 judgeInput4='';
 judgeInput5='';
 pickedDateInitial=''; 
 pickedDateEnd='';
 counsel='';
 party='';
}





class JudgementOrderJN extends StatefulWidget {
  const JudgementOrderJN({super.key});

  @override
  State<JudgementOrderJN> createState() => _JudgementOrderJNState();
}

class _JudgementOrderJNState extends State<JudgementOrderJN> {

// ---------------------------------------------Judgement---------------------------------------------

   Future getJudgementJN() async{
  //  if(judgementCalled == true){
    http.Response jjmt;
    try{
        jjmt = await http.post(Uri.parse('http://ns2.mphc.in/api/judgment_by_data.php'),
        body:{  
          
        
           'btn_search' : freeText??'',   // Free Text
           'lst_judge'  : judgeInput1, // Hon'ble Judges List 1
           'lst_judge1' : judgeInput2??'',  // Hon'ble Judges List 2
           'lst_judge2' : judgeInput3??'',  // Hon'ble Judges List 3
           'lst_judge3' : judgeInput4??'',  // Hon'ble Judges List 4
           'lst_judge4' : judgeInput5??'',  // Hon'ble Judges List 5
           'lst_pet'    : partyType??'',   // Party Type
           'txtparty'   : party??'',   // Party Name
           'lst_counsel': counselType??'',   // Counsel Type
           'txtcounsel' : counsel??'',   // Counsel Name
           'date1'      : pickedDateInitial??'',
           'date2'      : pickedDateEnd??'',
           'onlyafr'    : '',   // AFR
           'bench'      : establishInput??'',   // CURRENT SELECTED BENCH


          // 'btn_search' => '',  // Free Text
          // 'lst_judge' => '90', // Hon'ble Judges List 1
          // 'lst_judge1' => '0', // Hon'ble Judges List 2
          // 'lst_judge2' => '0', // Hon'ble Judges List 3
          // 'lst_judge3' => '0', // Hon'ble Judges List 4
          // 'lst_judge4' => '0', // Hon'ble Judges List 5
          // 'lst_pet' => '', // Party Type
          // 'txtparty' => '', // Party Name
          // 'lst_counsel' => '', // Counsel Type
          // 'txtcounsel' => '', // Counsel Name
          // 'date1' => '25-11-2020',
          // 'date2' => '25-11-2020',
          // 'onlyafr' => '', // AFR
          // 'bench' => '1' // CURRENT SELECTED BENCH
 
      }
      );
      if(jjmt.statusCode==200){
        // setState(() {
          judgementJNResponse = jjmt.body;
          judgementJNResult  = json.decode(jjmt.body);
          judgementJNAvailable = judgementJNResult?['success'];
          // debugPrint('${caseResult?[0][0]} ');
          debugPrint('-------------------Judgements api called-------------------------');
          // debugPrint(documentsResult?['results'].toString());
          judgementJNData = judgementJNResult?['results'];
          debugPrint(judgementJNData.toString());

        // });
      }
      }
    catch(e){
      debugPrint('$e');
      }
    // }
    // judgementCalled = false;
  }

@override
  void initState() {
    // getJudgementJN();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Judgment / Order'),
      ),
      body:  FutureBuilder(
          future: getJudgementJN(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (judgementJNData == null) {
              return const Center(child: Text('No Record Found'));
            } else {
             
             return  SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Table(
                          columnWidths:const {
                                0:FlexColumnWidth(1),
                                1:FlexColumnWidth(1),
                                2:FlexColumnWidth(1),
                                3:FlexColumnWidth(0.7),
                                // 4:FlexColumnWidth(1),
                          },
                        border: TableBorder.all(width: 0.4),
                        children: [
                            TableRow(
                            children: [
                        
                              TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), height:60,child:const Text('Case No'          , style:TextStyle(fontWeight: FontWeight.w500,fontSize:16)))),
                              TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), height:60,child:const Text('Petitioner'         , style:TextStyle(fontWeight: FontWeight.w500,fontSize:16) ))),
                              TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), height:60,child:const Text('Respondent'          , style:TextStyle(fontWeight: FontWeight.w500,fontSize:16)))),
                              TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), height:60,child:const Text('Show More'          , style:TextStyle(fontWeight: FontWeight.w500,fontSize:16)))),
                            
                             ]
                            ),
                            for(var documents in judgementJNData!)
                            // for(var document in documents!['clist'])
                              TableRow(
                              
                            children: [
                              
                              TableCell(child:Container(padding:const EdgeInsets.all(8),child:Text(documents!['Case_No'].toString(), style:const TextStyle(fontWeight: FontWeight.w400,fontSize:16)))),
                              TableCell(child:Container(padding:const EdgeInsets.all(8),child:Text(documents!['Petitioner_Name'].toString(), style:const TextStyle(fontWeight: FontWeight.w400,fontSize:16)))),
                              TableCell(child:Container(padding:const EdgeInsets.all(8),child:Text(documents!['Respondent_Name'].toString(), style:const TextStyle(fontWeight: FontWeight.w400,fontSize:16)))),
                              
                              
                              
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
                                                FmText(title: 'Petitioner Advocate',  response:documents!['Petitioner_Advocate'].toString()),
                                                FmText(title: 'Respondent Advocate',  response:documents!['Respondent_Advocate'].toString()),
                                                FmText(title: 'Presented By',  response:documents!['Presented_By'].toString()),
                                                FmText(title: 'Date of Disposal',  response:documents!['Date_of_Disposal'].toString()),
                                                // FmText(title: 'Documents',  response:documents!['PDF_Link'].toString()),

                                                Container(padding:const EdgeInsets.all(10),
                                                child: ElevatedButton(
                                   
                                                onPressed: () {
                                              //   if(documents!['pdf_link']!=null){
                                              //     debugPrint(documents!['pdf_link']!);
                                              //   Navigator.push(context,
                                              //       MaterialPageRoute(builder: (context) => PdfViewerPage(link: documents!['PDF_link'].toString())));
                                              //  }
                                              launchUrlString(documents!['PDF_Link']!);
                                                },
                                              child: const Text("View pdf"),
                                            ),
                                 ),
                                                // FmText(title: 'Next Tentative Date.',response:documents!['next_dt'].toString()),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                // });
                
                                });


                          } , child:const Text('More Details')),
                            )),

                              //  TableCell(
                              //    child: Container(padding:const EdgeInsets.all(10),
                              //      child: ElevatedButton(
                                   
                              //                 onPressed: () {
                              //                   if(documents!['pdf_link']!=null){
                              //                     debugPrint(documents!['pdf_link']!);
                              //                   Navigator.push(context,
                              //                       MaterialPageRoute(builder: (context) => PdfViewerPage(link: documents!['pdf_link'].toString())));
                              //                  } },
                              //                 child: const Text("View pdf"),
                              //               ),
                              //    ),
                              //  ),
                            // TableCell(child:Container(padding:const EdgeInsets.all(5),  child:Text(documents!['pdf_link']??' ', style:const TextStyle(fontWeight: FontWeight.w400,fontSize:16)))),
                             
                            ]
                          ),
                                          
                          
                        ],
                                          ),
                      ),
                    );
              
                //  return Container(
                //   child: ListView.builder(
                //       itemCount: judgementData!.length,
                //       itemBuilder: (context, index) {
                //         return Container(
                //             margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                //             padding: const EdgeInsets.all(10),
                //             decoration: BoxDecoration(
                //                 color: const Color.fromARGB(255, 240, 240, 246),
                //                 borderRadius: BorderRadius.circular(10)),
                //             // color:Colors.white70,
                //             child: Column(
                //                 mainAxisAlignment: MainAxisAlignment.center,
                //                 crossAxisAlignment: CrossAxisAlignment.center,
                //                 children: [
                //                   // Text(judgementData!.toString()),
                                 
                //                     FmText(  leftWidth: 3,title:'Order Date',response: judgementData![index]['order_date'].toString()),
                //                     // FmText(  leftWidth: 3,title:'PDF',response: judgementData![index]['pdf_link'].toString()),
                //                      ElevatedButton(

                //                           onPressed: () {
                //                             if(judgementData![index]['pdf_link']!=null ||judgementData![index]['pdf_link']!=''){
                //                             Navigator.push(context,
                //                                 MaterialPageRoute(builder: (context) => PdfViewerPage(link: judgementData![index]['pdf_link'].toString())));
                //                            } },
                //                           child: const Text("View pdf"),
                //                         ),
                                        
                                  
                                  
                //                 ]));
                //       }));

                }
             }
          ),
    );
  }
}







// -------------------------------------------------fmtext()--------------








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