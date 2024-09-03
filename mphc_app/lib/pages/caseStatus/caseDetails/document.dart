import 'package:flutter/material.dart';
import '../case_status.dart';
import './api.dart';

class Documents extends StatefulWidget {
  const Documents({super.key});

  @override
  State<Documents> createState() => _DocumentsState();
}

class _DocumentsState extends State<Documents> {
  @override
  void initState() {
    api.getDocuments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // title: Text('FutureBuilder Example'),
      // ),
      body: FutureBuilder(
          future: api.getDocuments(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (documentsData == null) {
              return const Center(child: Text('No Record Found'));
            } else {
              return Container(
                  child: ListView.builder(
                      itemCount: documentsData!.length,
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text(documentsData!.toString()),

                            




                                
                                
                                  FmText(isbold:true,title: 'Document No :',   response: documentsData![index]['Document_No'].toString()),
                                  FmText(isbold:true,title: 'Document Type :', response: documentsData![index]['Document_Type'].toString()),
                                  FmText(isbold:true,title: 'Filed By',        response:documentsData![index]['Filed_By'].toString()),
                                  FmText(isbold:true,title: 'Filing Date',     response: documentsData![index]['Filing_Date'].toString()),

                                ]));
                      }));
            }
          }),
    );
  }
}
