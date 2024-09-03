import 'package:flutter/material.dart';
import '../case_status.dart';
import './api.dart';

class Notices extends StatefulWidget {
  const Notices({super.key});

  @override
  State<Notices> createState() => _NoticesState();
}

class _NoticesState extends State<Notices> {
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
              return Container(
                  child: ListView.builder(
                      itemCount: noticesData!.length,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 238, 238, 245),
                                borderRadius: BorderRadius.circular(8)),
                            // color:Colors.white70,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text(noticesData!.toString()),

                                  FmText(isbold:true,title: 'PID', response: noticesData![index]['Process_id'].toString()),
                                  FmText(isbold:true,title: 'Notice Type :', response: noticesData![index]['Notice_Type'].toString()),
                                  FmText(isbold:true,title: 'Name :', response: noticesData![index]['Name'].toString(),),
                                  // const Divider(),
                                  FmText(title: 'Address :', response: noticesData![index] ['Address'] !=null? noticesData![index]['Address'].toString():''),
                                  FmText(title: 'Issue Date :', response: noticesData![index] ['Issue_Date'] !=  null  ? noticesData![index]  ['Issue_Date'].toString()  : ''),
                                  FmText(title: 'Returnable Date :', response: noticesData![index]
                                                          ['Returnable_Date'] !=
                                                      null
                                                  ? noticesData![index]
                                                          ['Returnable_Date']
                                                      .toString()
                                                  : ''),
                                  FmText(title: 'Dispatch Date :', response: noticesData![index]
                                                          ['Dispatch_Date'] !=
                                                      null
                                                  ? noticesData![index]
                                                          ['Dispatch_Date']
                                                      .toString()
                                                  : ''),
                                  FmText(title: 'Serve Date :', response: noticesData![index]
                                                          ['Serve_Date'] !=
                                                      null
                                                  ? noticesData![index]
                                                          ['Serve_Date']
                                                      .toString()
                                                  : ''),
                                  FmText(title: 'Ack Date :', response: noticesData![index][
                                                          'Acknowledgement_Date'] !=
                                                      null
                                                  ? noticesData![index][
                                                          'Acknowledgement_Date']
                                                      .toString()
                                                  : ''),
                                  FmText(title: 'Served / Unserved :', response: noticesData![index]
                                                          ['Served_Unserved'] !=
                                                      null
                                                  ? noticesData![index]
                                                          ['Served_Unserved']
                                                      .toString()
                                                  : ''),


                                  
                                  
                                ]));
                      }));
            }
          }),
    );
  }
}
