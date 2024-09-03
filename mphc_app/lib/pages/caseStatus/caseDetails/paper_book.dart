import 'package:flutter/material.dart';
import 'api.dart';
import '../case_status.dart';

class PaperBook extends StatefulWidget {
  const PaperBook({super.key});

  @override
  State<PaperBook> createState() => _PaperBookState();
}

class _PaperBookState extends State<PaperBook> {

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: FutureBuilder(
          future: api.getPaperBook(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (paperbookData == null) {
              return const Center(child: Text('No Record Found'));
            } else {
              return  Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  decoration: const BoxDecoration(
                    //   gradient: LinearGradient(
                    // colors: [
                    //   Color.fromARGB(64, 68, 137, 255),
                    //   Color.fromARGB(34, 179, 64, 251)
                    // ],
                    // begin: Alignment.topLeft,
                    // end: Alignment.bottomRight,
                  // )
                  ),
                  child: ListView.builder(
                      itemCount: paperbookData!.length,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: const EdgeInsets.all(4),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                        
                              // color:const Color.fromARGB(184, 236, 240, 255),
                              color: const Color.fromARGB(255, 240, 240, 246),
                              borderRadius: BorderRadius.circular(10),
                              // border: Border.all(width: 0.2),
                            ),

                            // color:Colors.white70,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

                                  FmText( leftWidth: 4,isbold: true,title: 'Estimated Cost :', response: paperbookData![index]['Estimated_Cost'].toString()),
                                  FmText( leftWidth: 4,isbold: true,title: 'Estimated Date :', response: paperbookData![index]['Estimate_Date'].toString()),
                                  FmText( leftWidth: 4,isbold: true,title: 'Estimated Receiving Cost :', response: paperbookData![index]['Estimate_Received_Cost'].toString()),
                                  FmText( leftWidth: 4,isbold: true,title: 'Estimated Receiving Date :', response: paperbookData![index]['Estimated_Receiving_Date'].toString()),
                                  FmText( leftWidth: 4,isbold: true,title: 'Paperbook Section Receiving :', response: paperbookData![index]['Paperbook_Section_Receiving_Date'].toString()),
                           
                                 
                                ]));
                      })); 
              





              }
            }),
              );
  }
}