import 'package:flutter/material.dart';
import '../case_status.dart';
import './api.dart';

class IA extends StatefulWidget {
  const IA({super.key});

  @override
  State<IA> createState() => _IAState();
}

class _IAState extends State<IA> {
  @override
  void initState() {
    // api.getIA();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // title: Text('FutureBuilder Example'),
      // ),
      body: FutureBuilder(
          future: api.getIA(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (iAData == null) {
              return const Center(child: Text('No Record Found'));
            } else {
              return Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  decoration: const BoxDecoration(
                  //     gradient: LinearGradient(
                  //   colors: [
                  //     Color.fromARGB(64, 255, 255, 255),
                  //     Color.fromARGB(33, 255, 255, 255)
                  //   ],
                  //   begin: Alignment.topLeft,
                  //   end: Alignment.bottomRight,
                  // )

                  ),
                  child: ListView.builder(
                      itemCount: iAData!.length,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                               color: const Color.fromARGB(255, 240, 240, 246),
                              // gradient: const LinearGradient(
                              //   colors: [
                              //     Color.fromARGB(40, 14, 99, 246),
                              //     Color.fromARGB(20, 206, 178, 248)
                              //   ],
                              //   begin: Alignment.topLeft,
                              //   end: Alignment.bottomRight,
                              // ),
                              borderRadius: BorderRadius.circular(10),
                              // border: Border.all(width: 0.05),
                            ),

                            // color:Colors.white70,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text(iAData!.toString()),



                                  FmText(leftWidth: 2,isbold: true, title: 'Particular', response: iAData![index]['Reg_No'].toString()),
                                  FmText(leftWidth: 2,isbold: true, title: 'Filed By', response: iAData![index]['Particular'].toString()),
                                  FmText(leftWidth: 2,isbold: true, title: 'Filing Date', response:  iAData![index]['Filed_By'].toString()),
                                  FmText(leftWidth: 2,isbold: true, title: 'IA No', response: iAData![index]['Filing_Date'].toString()),
                                 
                                  Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 20, 10),
                                    child: Visibility(
                                        visible: true,
                                        child: Column(children: [
                                        
                                          Row(
                                             mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              const Text('Status : ',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromARGB(
                                                          255, 0, 67, 53))),
                                              Text(
                                                  iAData![index]['Status']
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Color.fromARGB(
                                                          255, 0, 67, 53))),
                                            ],
                                          ),
                                        ])),
                                  ),
                                ]));
                      }));
            }
          }),
    );
  }
}
