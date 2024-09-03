import 'package:flutter/material.dart';
import '../case_status.dart';
import './api.dart';

class ConnectedTab extends StatefulWidget {
  const ConnectedTab({super.key});

  @override
  State<ConnectedTab> createState() => _ConnectedState();
}

class _ConnectedState extends State<ConnectedTab> {
// bool toggle = false;
// List<bool> toggleindex = List.generate(connectedData!.length, (toggle) =>  false );

  @override
  void initState() {
    // api.getConnected();
    // Connected();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // title: Text('FutureBuilder Example'),
      // ),
      body: FutureBuilder(
          future: api.getConnected(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (connectedData == null) {
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                   
                       const SizedBox(height: 20,),
                    DataTable(
                      
                      headingRowColor:const MaterialStatePropertyAll(Color.fromARGB(255, 238, 240, 244)),
                      columnSpacing: 10,
                      border:TableBorder.all(width: 0.1),
                      
                      columns: const[
                        DataColumn(label: Expanded(flex:1,child:Text('Petitioner'))),
                        DataColumn(label: Expanded(flex:1,child:Text('Type'))),
                        DataColumn(label: Expanded(flex:1,child:Text('Case No'))),
                        // DataColumn(label: Expanded(flex:1,child:Text('Action'))),
                        DataColumn(label: Expanded(child: Text('More \nDetails'))),
                      ],
                      rows: [
                        // for (var document in snapshot.data!)
                        for(var documents in connectedData!)
                          DataRow(
                            cells: [
                              DataCell(SingleChildScrollView(scrollDirection:Axis.vertical,child:Container( height:30,child:Text(documents!['petitioner'].toString())   ))),
                              DataCell(SingleChildScrollView(scrollDirection:Axis.vertical,child:Container( height:30,child:Text(documents!['main_connected'].toString()) ))),
                              DataCell(SingleChildScrollView(scrollDirection:Axis.vertical,child:Container( height:30,child:Text(documents!['case_no'].toString())      ))),
                              DataCell(SingleChildScrollView(scrollDirection:Axis.vertical,child:GestureDetector( onTap:(){
                                // setState(() {
                                   showDialog(context: context, builder: (BuildContext context){
                                  return AlertDialog(
                                    shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                                    title:const Text('Connected Details '),
                                    content:SingleChildScrollView(
                                      child: Container(
                                        height: 400,
                                        child: Column(
                                          children: [
                                            FmText(title: 'Respondant', response:documents!['respondant'].toString()),
                                            FmText(title: 'List', response:documents!['list'].toString()),
                                            FmText(title: 'Status', response:documents!['status'].toString()),
                                         
                                        
                                            
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                // });

                                });
                             
                            },child: Container( height:30,child:const Text('More Details'))))),
                            
                              
                              // DataCell(SingleChildScrollView(scrollDirection:Axis.vertical,child:Container( height:30,child:Text(documents!['Action'].toString())   ))),
                              
                              // DataCell(SingleChildScrollView(scrollDirection:Axis.vertical,child:Container( height:30,child:Text(documents!['Other'].toString())   ))),
                              
                            ],
                          ),
                      ],
                    ),
                                 ],
                               ),
                 ),
               ),
                  // child: ListView.builder(
                  //     itemCount: connectedData!.length,
                  //     itemBuilder: (context, index) {
                  //       return Container(
                  //           margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                  //           padding: const EdgeInsets.all(10),
                  //           decoration: BoxDecoration(
                  //               // border: Border.all(width: 0.2),
                  //               // gradient: const LinearGradient(
                  //               //   colors: [
                  //               //     Color.fromARGB(42, 14, 99, 246),
                  //               //     Color.fromARGB(20, 206, 178, 248)
                  //               //   ],
                  //               //   begin: Alignment.topLeft,
                  //               //   end: Alignment.bottomRight,
                  //               // ),
                  //                color: const Color.fromARGB(255, 240, 240, 246),
                  //               borderRadius: BorderRadius.circular(10)),
                  //           // color:Colors.white70,
                  //           child: Column(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               crossAxisAlignment: CrossAxisAlignment.center,
                  //               children: [
                  //                 // Text(connectedData!.toString()),

                  //                 FmText(isbold:true, responsebold: true, title: 'Petitioner :', response:  connectedData![index]['petitioner'].toString()),
                  //                 FmText(isbold:true, title: 'Type :', response:  connectedData![index]['main_connected'].toString()),
                  //                 FmText(isbold:true, title: 'Case No :', response: connectedData![index]['case_no'].toString()),
                  //                 FmText(isbold:true, title: 'Respondant :', response: connectedData![index]['respondant'].toString()),
                  //                 FmText(isbold:true, title: 'List :', response: connectedData![index]['list'].toString()),
                  //                 FmText(isbold:true, title: 'Status', response: connectedData![index]['status'].toString()),

                  //               ])
                  //               );
                  //     })
                  
                  );
            }
          }),
    );
  }
}
