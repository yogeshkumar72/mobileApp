import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mphc_app/pages/caseStatus/caseDetails/pdfview.dart';


  String ? establishInput;
  String ? caseTypeInput;
  String ? yearInput;
  String ? caseNumberInput;



//------------------Judgement/orders-------------------
String ? judgementResponse;
Map ?    judgementResult;
List ?   judgementData;
bool ?   judgementAvailable;


class JudgementOrder extends StatefulWidget {
  
  const JudgementOrder({super.key});

  @override
  State<JudgementOrder> createState() => _JudgementOrderState();
}

class _JudgementOrderState extends State<JudgementOrder> {

// ---------------------------------------------Judgement---------------------------------------------

   Future getJudgement() async{
  //  if(judgementCalled == true){
    http.Response jjmt;
    try{
        jjmt = await http.post(Uri.parse('http://ns2.mphc.in/api/judgementOrders.php'),
        body:{
        // 'bench':'01',
        // 'case_type':'11',
        // 'case_no':'222',
        // 'case_year':'2016',
        'bench':establishInput,
        'case_type':caseTypeInput,
        'case_no':caseNumberInput,
        'case_year':yearInput
      }
      );
      if(jjmt.statusCode==200){
        // setState(() {
          judgementResponse = jjmt.body;
          judgementResult  = json.decode(jjmt.body);
          judgementAvailable = judgementResult?['success'];
          // debugPrint('${caseResult?[0][0]} ');
          debugPrint('-------------------Judgements api called-------------------------');
          // debugPrint(documentsResult?['results'].toString());
          judgementData = judgementResult?['results'];
          // debugPrint(judgementData.toString());

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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text('Judgement / Orders'),
      ),
      body: FutureBuilder(
          future: getJudgement(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (judgementData == null) {
              return const Center(child: Text('No Record Found'));
            } else {
             
             return  SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Table(
                          // columnWidths:const {
                          //       0:FlexColumnWidth(1),
                          //       1:FlexColumnWidth(2),
                          //       2:FlexColumnWidth(2),
                          //       3:FlexColumnWidth(3),
                          //       4:FlexColumnWidth(1.5),
                          // },
                        border: TableBorder.all(width: 0.4),
                        children: [
                            TableRow(
                            children: [
                        
                              TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), height:60,child:const Text(' Order Date'          , style:TextStyle(fontWeight: FontWeight.w500,fontSize:16)))),
                              TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), height:60,child:const Text('View PDF'         , style:TextStyle(fontWeight: FontWeight.w500,fontSize:16) ))),
                              
                           ]
                          ),
                          for(var documents in judgementData!)
                          // for(var document in documents!['clist'])
                            TableRow(
                              
                            children: [
                              
                              TableCell(child:Container(padding:const EdgeInsets.all(10),child:Text(documents!['order_date'].toString(), style:const TextStyle(fontWeight: FontWeight.w400,fontSize:16)))),

                               TableCell(
                                 child: Container(padding:const EdgeInsets.all(10),
                                   child: ElevatedButton(
                                   
                                              onPressed: () {
                                                if(documents!['pdf_link']!=null){
                                                  debugPrint(documents!['pdf_link']!);
                                                Navigator.push(context,
                                                    MaterialPageRoute(builder: (context) => PdfViewerPage(link: documents!['pdf_link'].toString())));
                                               } },
                                              child: const Text("View pdf"),
                                            ),
                                 ),
                               ),
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
          )
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