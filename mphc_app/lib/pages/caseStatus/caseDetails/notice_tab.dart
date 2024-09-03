import 'package:flutter/material.dart';
import '../case_status.dart';
import './api.dart';

class NoticesTab extends StatefulWidget {
  const NoticesTab({super.key});

  @override
  State<NoticesTab> createState() => _NoticesState();
}

class _NoticesState extends State<NoticesTab> {
  @override
  void initState() {
    // api.getNotices();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // title: Text('FutureBuilder Example'),
      // ),
      body: FutureBuilder(
          future: api.getNotices(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (noticesData == null) {
              return const Center(child: Text('No Record Found'));
            } else {

               return SingleChildScrollView(
                scrollDirection: Axis.vertical,

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
                      DataColumn(label: Expanded(flex:1,child:Text('PID'))),
                      DataColumn(label: Expanded(flex:1,child:Text('Notice Type'))),
                      DataColumn(label: Expanded(flex:1,child:Text('Name'))),
                      // DataColumn(label: Expanded(flex:1,child:Text('IA No'))),
                      DataColumn(label: Expanded(child: Text('Details'))),
                    ],
                    rows: [
                      // for (var document in snapshot.data!)
                      for(var documents in noticesData!)
                        DataRow(
                          cells: [
                            DataCell(SingleChildScrollView(scrollDirection:Axis.vertical,child:Container( height:30,child:Text((documents!['Process_id'].split(',')[0]).toString())   ))),
                            DataCell(SingleChildScrollView(scrollDirection:Axis.vertical,child:Container( height:30,child:Text(documents!['Notice_Type'].toString()) ))),
                            DataCell(SingleChildScrollView(scrollDirection:Axis.vertical,child:Container( height:30,child:Text(documents!['Name'].toString()) ))),
                            
                            
                            DataCell(SingleChildScrollView(scrollDirection:Axis.vertical,child:GestureDetector( onTap:(){
                                // setState(() {
                                   showDialog(context: context, builder: (BuildContext context){
                                  return AlertDialog(
                                    shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                                    title:const Text('Notice Details '),
                                    content:Container(
                                      height: 400,
                                      child: Column(
                                        children: [
                                          FmText(title: 'Address', response:documents!['Address'].toString()),
                                          FmText(title: 'Issue Date', response:documents!['Issue_Date'].toString()),
                                          FmText(title: 'Returnable Date', response:documents!['Returnable_Date'].toString()),
                                          FmText(title: 'Dispatch Date', response:documents!['Dispatch_Date'].toString()),
                                          FmText(title: 'Serve Date', response:documents!['Serve_Date'].toString()),
                                          FmText(title: 'Acknowledgement Date', response:documents!['Acknowledgement_Date'].toString()),
                                          FmText(title: 'Served Unserved', response: documents!['Served_Unserved'].toString())
                                      
                                          
                                        ],
                                      ),
                                    ),
                                  );
                                // });

                                });
                             
                            },child: Container( height:30,child:const Text('More Details'))))),
                            
                          ],
                        ),
                    ],
                  ),
                               ],
                             ),
               );





              // return Container(
              //     child: ListView.builder(
              //         itemCount: noticesData!.length,
              //         itemBuilder: (context, index) {
              //           return Container(
              //               margin: const EdgeInsets.all(10),
              //               padding: const EdgeInsets.all(5),
              //               decoration: BoxDecoration(
              //                   color: const Color.fromARGB(255, 238, 238, 245),
              //                   borderRadius: BorderRadius.circular(8)),
              //               // color:Colors.white70,
              //               child: Column(
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     // Text(noticesData!.toString()),

              //                     FmText(isbold:true,title: 'PID', response: noticesData![index]['Process_id'].toString()),
              //                     FmText(isbold:true,title: 'Notice Type :', response: noticesData![index]['Notice_Type'].toString()),
              //                     FmText(isbold:true,title: 'Name :', response: noticesData![index]['Name'].toString(),),
              //                     // const Divider(),
              //                     FmText(title: 'Address :', response: noticesData![index] ['Address'] !=null? noticesData![index]['Address'].toString():''),
              //                     FmText(title: 'Issue Date :', response: noticesData![index] ['Issue_Date'] !=  null  ? noticesData![index]  ['Issue_Date'].toString()  : ''),
              //                     FmText(title: 'Returnable Date :', response: noticesData![index]
              //                                             ['Returnable_Date'] !=
              //                                         null
              //                                     ? noticesData![index]
              //                                             ['Returnable_Date']
              //                                         .toString()
              //                                     : ''),
              //                     FmText(title: 'Dispatch Date :', response: noticesData![index]
              //                                             ['Dispatch_Date'] !=
              //                                         null
              //                                     ? noticesData![index]
              //                                             ['Dispatch_Date']
              //                                         .toString()
              //                                     : ''),
              //                     FmText(title: 'Serve Date :', response: noticesData![index]
              //                                             ['Serve_Date'] !=
              //                                         null
              //                                     ? noticesData![index]
              //                                             ['Serve_Date']
              //                                         .toString()
              //                                     : ''),
              //                     FmText(title: 'Ack Date :', response: noticesData![index][
              //                                             'Acknowledgement_Date'] !=
              //                                         null
              //                                     ? noticesData![index][
              //                                             'Acknowledgement_Date']
              //                                         .toString()
              //                                     : ''),
              //                     FmText(title: 'Served / Unserved :', response: noticesData![index]
              //                                             ['Served_Unserved'] !=
              //                                         null
              //                                     ? noticesData![index]
              //                                             ['Served_Unserved']
              //                                         .toString()
              //                                     : ''),


                                  
                                  
              //                   ]));
              //         }));
            }
          }),
    );
  }
}


void errorCaseType(BuildContext context){
  showDialog(context: context, builder: (BuildContext context){
    return const AlertDialog(
      shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
      title:Text(' Case Type '),
      content:Text('Please Select Case Type !'),
    );
  });
}
