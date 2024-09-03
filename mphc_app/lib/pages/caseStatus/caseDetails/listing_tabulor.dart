import 'package:flutter/material.dart';
import '../case_status.dart';
import './api.dart';

class ListingTab extends StatefulWidget {
  const ListingTab({super.key});

  @override
  State<ListingTab> createState() => _ListingState();
}

class _ListingState extends State<ListingTab> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        // title: Text('FutureBuilder Example'),
        // ),
        body: FutureBuilder(
            future: api.getListing(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (listingData == null) {
                return const Center(child: Text('No Record Found'));
              } else {
              
                return SingleChildScrollView(
                scrollDirection: Axis.vertical,

                 child: Container(
                  margin: EdgeInsets.all(10),
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
                        DataColumn(label: Expanded(flex:1,child:Text('Hearing\nDate.'))),
                        DataColumn(label: Expanded(flex:1,child:Text('Coram'))),
                        DataColumn(label: Expanded(flex:1,child:Text('Purpose'))),
                        // DataColumn(label: Expanded(flex:1,child:Text('Action'))),
                        DataColumn(label: Expanded(child: Text('More \nDetails'))),
                      ],
                      rows: [
                        // for (var document in snapshot.data!)
                        for(var documents in listingData!)
                          DataRow(
                            cells: [
                              DataCell(SingleChildScrollView(scrollDirection:Axis.vertical,child:Container( height:30,child:Text(documents!['Hearing_Date'].toString())   ))),
                              DataCell(SingleChildScrollView(scrollDirection:Axis.vertical,child:Container( height:30,child:Text(documents!['Coram'].toString()) ))),
                              DataCell(SingleChildScrollView(scrollDirection:Axis.vertical,child:Container( height:30,child:Text(documents!['Purpose'].toString())      ))),
                              DataCell(SingleChildScrollView(scrollDirection:Axis.vertical,child:GestureDetector( onTap:(){
                                // setState(() {
                                   showDialog(context: context, builder: (BuildContext context){
                                  return AlertDialog(
                                    shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                                    title:const Text('Listing Details '),
                                    content:SingleChildScrollView(
                                      child: Container(
                                        height: 400,
                                        child: Column(
                                          children: [
                                            FmText(title: 'Action', response:documents!['Action'].toString()),
                                            FmText(title: 'Other', response:documents!['Other'].toString()),
                                         
                                        
                                            
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
               );
              
                // return Container(
                //     decoration: const BoxDecoration(
                //       //   gradient: LinearGradient(
                //       // colors: [
                //       //   Color.fromARGB(64, 68, 137, 255),
                //       //   Color.fromARGB(34, 179, 64, 251)
                //       // ],
                //       // begin: Alignment.topLeft,
                //       // end: Alignment.bottomRight,
                //     // )
                //     ),
                //     child: ListView.builder(
                //         itemCount: listingData!.length,
                //         itemBuilder: (context, index) {
                //           return Container(

                //               // decoration:BoxDecoration(),
                //               margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                //               padding: const EdgeInsets.all(10),
                //               decoration: BoxDecoration(
                //                 color: const Color.fromARGB(255, 240, 240, 246),
                //                 // gradient: const LinearGradient(
                //                 //   colors: [
                //                 //     Color.fromARGB(40, 14, 99, 246),
                //                 //     Color.fromARGB(20, 206, 178, 248)
                //                 //   ],
                //                 //   begin: Alignment.topLeft,
                //                 //   end: Alignment.bottomRight,
                //                 // ),
                //                 borderRadius: BorderRadius.circular(10),
                //                 // border: Border.all(width: 0.2),
                //               ),
                //               // color:Colors.white70,
                //               child: Column(
                //                   mainAxisAlignment: MainAxisAlignment.start,
                //                   crossAxisAlignment: CrossAxisAlignment.start,
                //                   children: [
                //                     // Text(listingData!.toString()),



                                  


                //                     Row(
                //                       mainAxisAlignment: MainAxisAlignment.end,
                //                       children: [
                //                         // Container(  padding: EdgeInsets.fromLTRB(0, 10, 0,  5), child: Text('' ,style:TextStyle(color:Color.fromARGB(255, 144, 144, 144)))),
                //                         Container(
                //                             padding: const EdgeInsets.fromLTRB(
                //                                 0, 0, 0, 10),
                //                             child: Text(
                //                                 listingData![index]
                //                                         ['Hearing_Date']
                //                                     .toString(),
                //                                 style:const TextStyle(
                //                                     fontWeight: FontWeight.bold,
                //                                     fontSize: 15,
                //                                     color: Color.fromARGB(
                //                                         255, 124, 124, 124)))),
                //                       ],
                //                     ),


                //                     FmText(leftWidth: 2,isbold: true, title: 'Coram :', response:  listingData![index]['Coram'].toString()),
                //                     FmText(leftWidth: 2,isbold: true, title: 'Purpose :', response: listingData![index]['Purpose'].toString()),
                //                     FmText(leftWidth: 2,isbold: true, title: 'Action :', response: listingData![index]['Action'] == null? '': listingData![index]['Action'].toString(),),


                //                     // SingleChildScrollView(
                //                     //     scrollDirection: Axis.horizontal,
                //                     //     child: Row(
                //                     //       mainAxisAlignment:
                //                     //           MainAxisAlignment.start,
                //                     //       crossAxisAlignment:
                //                     //           CrossAxisAlignment.start,
                //                     //       children: [
                //                     //         Container(
                //                     //             padding:
                //                     //                 const EdgeInsets.fromLTRB(
                //                     //                     0, 0, 0, 5),
                //                     //             width: 80,
                //                     //             child: const Text('Coram : ',
                //                     //                 style: TextStyle(
                //                     //                     color: Color.fromARGB(
                //                     //                         255, 57, 60, 226),
                //                     //                     fontSize: 16))),
                //                     //         Container(
                //                     //             padding:
                //                     //                 const EdgeInsets.fromLTRB(
                //                     //                     0, 0, 0, 5),
                //                     //             width: 240,
                //                     //             child: Text(
                //                     //                 listingData![index]['Coram']
                //                     //                     .toString(),
                //                     //                 style: const TextStyle(
                //                     //                     color: Color.fromARGB(
                //                     //                         255, 70, 42, 255),
                //                     //                     fontSize: 16,
                //                     //                     fontWeight:
                //                     //                         FontWeight.bold))),
                //                     //       ],
                //                     //     )),

                //                     // SingleChildScrollView(
                //                     //     scrollDirection: Axis.horizontal,
                //                     //     child: Row(
                //                     //       mainAxisAlignment:
                //                     //           MainAxisAlignment.start,
                //                     //       crossAxisAlignment:
                //                     //           CrossAxisAlignment.start,
                //                     //       children: [
                //                     //         Container(
                //                     //             padding:
                //                     //                 const EdgeInsets.fromLTRB(
                //                     //                     0, 0, 0, 5),
                //                     //             width: 80,
                //                     //             child:const Text('Purpose : ',
                //                     //                 style: TextStyle(
                //                     //                     color: Color.fromARGB(
                //                     //                         255, 57, 60, 226),
                //                     //                     fontSize: 16))),
                //                     //         Container(
                //                     //             padding:
                //                     //                 const EdgeInsets.fromLTRB(
                //                     //                     0, 0, 0, 5),
                //                     //             width: 240,
                //                     //             child: Text(
                //                     //                 listingData![index]
                //                     //                         ['Purpose']
                //                     //                     .toString(),
                //                     //                 style: const TextStyle(
                //                     //                     color: Color.fromARGB(
                //                     //                         255, 37, 37, 37),
                //                     //                     fontSize: 17))),
                //                     //       ],
                //                     //     )),

                //                     // Divider(),

                //                     Container(
                //                       padding: const EdgeInsets.all(0),
                //                       child: Visibility(
                //                           visible: true,
                //                           child: Column(
                //                               crossAxisAlignment:
                //                                   CrossAxisAlignment.start,
                //                               mainAxisAlignment:
                //                                   MainAxisAlignment.start,
                //                               children: [
                //                                 //  SingleChildScrollView(
                //                                 //   scrollDirection: Axis.horizontal,
                //                                 //    child:
                //                                 // Row(
                //                                 //   mainAxisAlignment:
                //                                 //       MainAxisAlignment.start,
                //                                 //   crossAxisAlignment:
                //                                 //       CrossAxisAlignment.start,
                //                                 //   children: [
                //                                 //     Container(
                //                                 //         padding:
                //                                 //             const EdgeInsets.fromLTRB(
                //                                 //                 0, 10, 0, 5),
                //                                 //         width: 80,
                //                                 //         child: const Text('Action : ',
                //                                 //             style: TextStyle(
                //                                 //                 color: Color
                //                                 //                     .fromARGB(
                //                                 //                         255,
                //                                 //                         54,
                //                                 //                         86,
                //                                 //                         244)))),
                //                                 //     Container(
                //                                 //         padding:
                //                                 //            const EdgeInsets.fromLTRB(
                //                                 //                 0, 10, 0, 5),
                //                                 //         width: 200,
                //                                 //         child: Text(
                //                                 //             listingData![index][
                //                                 //                         'Action'] ==
                //                                 //                     null
                //                                 //                 ? ''
                //                                 //                 : listingData![
                //                                 //                             index]
                //                                 //                         [
                //                                 //                         'Action']
                //                                 //                     .toString(),
                //                                 //             style: const TextStyle(
                //                                 //                 fontSize: 15))),
                //                                 //   ],
                //                                 // ),

                //                                 // SingleChildScrollView(
                //                                 // scrollDirection: Axis.horizontal,
                //                                 //  child:
                //                                 // const Divider(),
                //                                 Row(
                //                                   mainAxisAlignment:
                //                                       MainAxisAlignment.end,
                //                                   crossAxisAlignment:
                //                                       CrossAxisAlignment.start,
                //                                   children: [
                //                                     // Container(  padding: EdgeInsets.fromLTRB(0, 5, 0,  0), width:80, child: Text('Other: ' ,style:TextStyle(color:Color.fromARGB(255, 54, 86, 244)))),
                //                                     Container(
                //                                         padding:
                //                                            const  EdgeInsets.fromLTRB(
                //                                                 0, 5, 5, 0),
                //                                         child: Text(
                //                                             listingData![index]
                //                                                     ['Other']
                //                                                 .toString(),
                //                                             style: const TextStyle(
                //                                                 fontWeight:
                //                                                     FontWeight
                //                                                         .bold,
                //                                                 color: Color
                //                                                     .fromARGB(
                //                                                         255,
                //                                                         4,
                //                                                         93,
                //                                                         84)))),
                //                                   ],
                //                                 ),

                //                                 //  Row(
                //                                 //  mainAxisAlignment: MainAxisAlignment.start,
                //                                 //   children: [
                //                                 //   const Text('Status : ' ,style:TextStyle(color:Color.fromARGB(255, 54, 86, 244))),
                //                                 //   Text(connectedData![index]['status'].toString()),
                //                                 // ],),
                //                               ])),
                //                     ),
                //                   ]));
                //         }));
              }
            }
            // }
            ));
  }
}


