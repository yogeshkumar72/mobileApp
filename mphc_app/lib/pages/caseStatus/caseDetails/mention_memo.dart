import 'package:flutter/material.dart';
import 'package:mphc_app/pages/caseStatus/caseDetails/pdfview.dart';
import './api.dart';
import '../case_status.dart';

class MentionMemo extends StatefulWidget {
  const MentionMemo({super.key});

  @override
  State<MentionMemo> createState() => _MentionMemoState();
}

class _MentionMemoState extends State<MentionMemo> {
  
@override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // title: Text('FutureBuilder Example'),
      // ),
      body: FutureBuilder(
          future: api.getMentionMemo(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (mentionData == null) {
              return const Center(child: Text('No Record Found'));
            } else {
               return Container(
                  child: ListView.builder(
                      itemCount: mentionData!.length,
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
                                  // Text(mentionData!.toString()),
                                 
                                    FmText( leftWidth: 3, title:'Case No',response: mentionData![index]['Case_No'].toString()),
                                    // FmText(title: 'PDF', response: mentionData![index]['PDF'].toString()),
                                    ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (context) => PdfViewerPage(link: mentionData![index]['Case_No'].toString())));
                                          },
                                          child: const Text("View pdf"),
                                        ),
                                  
                                  
                            

                                ]));
                      }));

  }
          }
      ),
  );
  
 

  }

}