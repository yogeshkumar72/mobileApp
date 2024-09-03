import 'package:flutter/material.dart';
import 'api.dart';
import '../case_status.dart';

class AdjustmentsTab extends StatefulWidget {
  const AdjustmentsTab({super.key});

  @override
  State<AdjustmentsTab> createState() => _AdjustmentsState();
}

class _AdjustmentsState extends State<AdjustmentsTab> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // title: Text('FutureBuilder Example'),
      // ),
      body: FutureBuilder(
          future: api.getAdjustments(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (adjustmentsData == null) {
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
                      DataColumn(label: Expanded(flex:1,child:Text('S.No. '))),
                      DataColumn(label: Expanded(flex:1,child:Text('Advocate Name'))),
                      DataColumn(label: Expanded(flex:1,child:Text('Enrollment \nNo./Year'))),
                      // DataColumn(label: Expanded(flex:1,child:Text('IA No'))),
                      DataColumn(label: Expanded(child: Text('From Date'))),
                      DataColumn(label: Expanded(child: Text('To Date'))),
                    ],
                    rows: [
                      // for (var document in snapshot.data!)
                      for(var documents in adjustmentsData!)
                      
                        DataRow(
                          cells: [
                            DataCell(SingleChildScrollView(scrollDirection:Axis.vertical,child:Container( height:30,child:Text(documents!['SN'].toString())   ))),
                            DataCell(SingleChildScrollView(scrollDirection:Axis.vertical,child:Container( height:30,child:Text(documents!['Advocate_Name'].toString()) ))),
                            DataCell(SingleChildScrollView(scrollDirection:Axis.vertical,child:Container( height:30,child:Text(documents!['Enrollment_No_Year'].toString()) ))),
                            DataCell(SingleChildScrollView(scrollDirection:Axis.vertical,child:Container( height:30,child:Text(documents!['From_Date'].toString()) ))),
                            DataCell(SingleChildScrollView(scrollDirection:Axis.vertical,child:Container( height:30,child:Text(documents!['To_Date'].toString()) ))),
                            
                            
                            // DataCell(SingleChildScrollView(scrollDirection:Axis.vertical,child:GestureDetector( onTap:(){
                                // setState(() {
                                  //  showDialog(context: context, builder: (BuildContext context){
                                  // return AlertDialog(
                                  //   shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                                  //   title:const Text('Notice Details '),
                                  //   content:Column(
                                  //     children: [
                                  //       FmText(title: 'Address', response:documents!['Address'].toString()),
                                  //       FmText(title: 'Issue Date', response:documents!['Issue_Date'].toString()),
                                  //       FmText(title: 'Returnable Date', response:documents!['Returnable_Date'].toString()),
                                  //       FmText(title: 'Dispatch Date', response:documents!['Dispatch_Date'].toString()),
                                  //       FmText(title: 'Serve Date', response:documents!['Serve_Date'].toString()),
                                  //       FmText(title: 'Acknowledgement Date', response:documents!['Acknowledgement_Date'].toString()),
                                  //       FmText(title: 'Served Unserved', response: documents!['Served_Unserved'].toString())

                                        
                                  //     ],
                                  //   ),
                                  // );
                                // });

                                // });
                             
                            // },child: Container( height:30,child:const Text('More Details'))))),
                            
                          ],
                        ),
                    ],
                  ),
                               ],
                             ),
               );
              // return Container(
              //     child: ListView.builder(
              //         itemCount: adjustmentsData!.length,
              //         itemBuilder: (context, index) {
              //           return Container(
              //               margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              //               padding: const EdgeInsets.all(10),
              //               decoration: BoxDecoration(
              //                   color: const Color.fromARGB(255, 240, 240, 246),
              //                   borderRadius: BorderRadius.circular(10)),
              //               // color:Colors.white70,
              //               child: Column(
              //                   mainAxisAlignment: MainAxisAlignment.center,
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     // Text(adjustmentsData!.toString()),

              //                     FmText(leftWidth:3,isbold:true,title: 'Serial No. :',        response: adjustmentsData![index]['SN'].toString()),
              //                     FmText(leftWidth:3,isbold:true,title: 'Advocate Name :',     response: adjustmentsData![index]['Advocate_Name'].toString()),
              //                     FmText(leftWidth:3,isbold:true,title: 'Enrollment No./Year', response: adjustmentsData![index]['Enrollment_No_Year'] ==null? '': adjustmentsData![index]['Enrollment_No_Year'].toString()),
              //                     FmText(leftWidth:3,isbold:true,title: 'From Date',           response: adjustmentsData![index]['From_Date'].toString()),
              //                     FmText(leftWidth:3,isbold:true,title: 'To Date',             response: adjustmentsData![index]['To_Date'].toString()),

              //                   ]));
              //         }));
              }
          }
              )
              );}
}