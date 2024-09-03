import 'package:flutter/material.dart';
import 'package:mphc_app/pages/caseStatus/caseDetails/pdfview.dart';
import '../case_status.dart';
import 'api.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';

class Judgement extends StatefulWidget {
  const Judgement({super.key});

  @override
  State<Judgement> createState() => _JudgementState();
}

class _JudgementState extends State<Judgement> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // title: Text('FutureBuilder Example'),
      // ),
      body: FutureBuilder(
          future: api.getJudgement(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (judgementData == null) {
              return const Center(child: Text('No Record Found'));
            } else {
              
                 return Container(
                  child: ListView.builder(
                      itemCount: judgementData!.length,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 240, 240, 246),
                                borderRadius: BorderRadius.circular(10)),
                            // color:Colors.white70,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Text(judgementData!.toString()),
                                 
                                    FmText(  leftWidth: 3,title:'Order Date',response: judgementData![index]['order_date'].toString()),
                                    // FmText(  leftWidth: 3,title:'PDF',response: judgementData![index]['pdf_link'].toString()),
                                     ElevatedButton(

                                          onPressed: () {
                                            if(judgementData![index]['pdf_link']!=null ||judgementData![index]['pdf_link']!=''){
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (context) => PdfViewerPage(link: judgementData![index]['pdf_link'].toString())));
                                           } },
                                          child: const Text("View pdf"),
                                        ),
                                  
                                  
                                ]));
                      }));

                }
             }
          )
      );}
}