import 'package:flutter/material.dart';
import '../case_status.dart';
import './api.dart';

class Connected extends StatefulWidget {
  const Connected({super.key});

  @override
  State<Connected> createState() => _ConnectedState();
}

class _ConnectedState extends State<Connected> {
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
                  // decoration: BoxDecoration(border:Border.all(width: 1,color:Colors.black)),
                  decoration: const BoxDecoration(
                  //     gradient: LinearGradient(
                  //   colors: [
                  //     Color.fromARGB(26, 68, 137, 255),
                  //     Color.fromARGB(34, 179, 64, 251)
                  //   ],
                  //   begin: Alignment.topLeft,
                  //   end: Alignment.bottomRight,
                  // )
                  ),
                  child: ListView.builder(
                      itemCount: connectedData!.length,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                // border: Border.all(width: 0.2),
                                // gradient: const LinearGradient(
                                //   colors: [
                                //     Color.fromARGB(42, 14, 99, 246),
                                //     Color.fromARGB(20, 206, 178, 248)
                                //   ],
                                //   begin: Alignment.topLeft,
                                //   end: Alignment.bottomRight,
                                // ),
                                 color: const Color.fromARGB(255, 240, 240, 246),
                                borderRadius: BorderRadius.circular(10)),
                            // color:Colors.white70,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Text(connectedData!.toString()),

                                  FmText(isbold:true, responsebold: true, title: 'Petitioner :', response:  connectedData![index]['petitioner'].toString()),
                                  FmText(isbold:true, title: 'Type :', response:  connectedData![index]['main_connected'].toString()),
                                  FmText(isbold:true, title: 'Case No :', response: connectedData![index]['case_no'].toString()),
                                  FmText(isbold:true, title: 'Respondant :', response: connectedData![index]['respondant'].toString()),
                                  FmText(isbold:true, title: 'List :', response: connectedData![index]['list'].toString()),
                                  FmText(isbold:true, title: 'Status', response: connectedData![index]['status'].toString()),






                                  // Row(
                                  //   children: [
                                  //     Container(
                                  //         padding:
                                  //             const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                  //         width: 80,
                                  //         child: const Text('Petitioner : ',
                                  //             style: TextStyle(
                                  //                 fontSize: 16,
                                  //                 color:  Color.fromARGB(
                                  //                     255, 63, 54, 244)))),
                                  //     Container(
                                  //         padding:
                                  //            const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                  //         width: 230,
                                  //         child: Text(
                                  //             connectedData![index]
                                  //                     ['petitioner']
                                  //                 .toString(),
                                  //             style: const TextStyle(
                                  //                 fontSize: 16,
                                  //                 fontWeight: FontWeight.bold,
                                  //                 color: Color.fromARGB(
                                  //                     255, 58, 64, 246)))),
                                  //   ],
                                  // ),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.start,
                                  //   crossAxisAlignment:
                                  //       CrossAxisAlignment.start,
                                  //   children: [
                                  //     Container(
                                  //         padding:
                                  //            const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                  //         width: 80,
                                  //         child:const Text('Type : ',
                                  //             style: TextStyle(
                                  //                 fontSize: 16,
                                  //                 color:  Color.fromARGB(
                                  //                     255, 63, 54, 244)))),
                                  //     Container(
                                  //         padding:
                                  //             const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                  //         width: 230,
                                  //         child: Text(
                                  //             connectedData![index]
                                  //                     ['main_connected']
                                  //                 .toString(),
                                  //             style: const TextStyle(fontSize: 16))),
                                  //   ],
                                  // ),

                                  // Row(
                                  //   children: [
                                  //     Container(
                                  //         padding:
                                  //             const EdgeInsets.fromLTRB(0, 8, 0, 10),
                                  //         width: 80,
                                  //         child:const Text('Case No : ',
                                  //             style: TextStyle(
                                  //                 fontSize: 16,
                                  //                 color:  Color.fromARGB(
                                  //                     255, 63, 54, 244)))),
                                  //     Container(
                                  //         padding:
                                  //          const   EdgeInsets.fromLTRB(0, 8, 0, 10),
                                  //         width: 230,
                                  //         child: Text(
                                  //             connectedData![index]['case_no']
                                  //                 .toString(),
                                  //             style: const TextStyle(fontSize: 16))),
                                  //   ],
                                  // ),

                                  // // Divider(),

                                  // Container(
                                  //   decoration: BoxDecoration(
                                  //       // color:
                                  //           // const Color.fromARGB(168, 245, 234, 255),
                                  //       borderRadius:
                                  //           BorderRadius.circular(10)),
                                  //   padding:
                                  //       const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                  //   child: Visibility(
                                  //       visible: true,
                                  //       child: Column(children: [
                                  //         Row(
                                  //           //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  //           children: [
                                  //             Container(
                                  //                 padding:const  EdgeInsets.fromLTRB(
                                  //                     0, 5, 0, 0),
                                  //                 width: 80,
                                  //                 child:const  Text('Respondant : ',
                                  //                     style: TextStyle(
                                  //                         fontSize: 16,
                                  //                         color: Color.fromARGB(
                                  //                             255,
                                  //                             54,
                                  //                             86,
                                  //                             244)))),
                                  //             Container(
                                  //                 padding: const EdgeInsets.fromLTRB(
                                  //                     0, 5, 0, 0),
                                  //                 width: 230,
                                  //                 child: Text(
                                  //                     connectedData![index]
                                  //                             ['respondant']
                                  //                         .toString())),
                                  //           ],
                                  //         ),
                                  //         Row(
                                  //           //  mainAxisAlignment: MainAxisAlignment.start,
                                  //           children: [
                                  //             Container(
                                  //                 padding:const  EdgeInsets.fromLTRB(
                                  //                     0, 5, 0, 0),
                                  //                 width: 80,
                                  //                 child: const Text('List : ',
                                  //                     style: TextStyle(
                                  //                         fontSize: 16,
                                  //                         color: Color.fromARGB(
                                  //                             255,
                                  //                             54,
                                  //                             86,
                                  //                             244)))),
                                  //             Container(
                                  //                 padding: const EdgeInsets.fromLTRB(
                                  //                     0, 5, 0, 0),
                                  //                 width: 230,
                                  //                 child: Text(
                                  //                     connectedData![index]
                                  //                             ['list']
                                  //                         .toString())),
                                  //           ],
                                  //         ),
                                  //         Row(
                                  //           //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  //           children: [
                                  //             Container(
                                  //                 padding: const EdgeInsets.fromLTRB(
                                  //                     0, 5, 0, 8),
                                  //                 width: 80,
                                  //                 child: const Text('Status : ',
                                  //                     style: TextStyle(
                                  //                         fontSize: 16,
                                  //                         color: Color.fromARGB(
                                  //                             255,
                                  //                             54,
                                  //                             86,
                                  //                             244)))),
                                  //             Container(
                                  //                 padding:const  EdgeInsets.fromLTRB(
                                  //                     0, 5, 0, 8),
                                  //                 width: 230,
                                  //                 child: Text(
                                  //                     connectedData![index]
                                  //                             ['status']
                                  //                         .toString())),
                                  //           ],
                                  //         ),
                                  //       ])),
                                  // ),
                                ]));
                      })
                  // Text(connectedData !=null ? connectedData.toString():'No record Found'),
                  );
            }
          }),
    );
  }
}
