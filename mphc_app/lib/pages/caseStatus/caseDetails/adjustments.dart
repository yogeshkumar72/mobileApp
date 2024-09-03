import 'package:flutter/material.dart';
import 'api.dart';
import '../case_status.dart';

class Adjustments extends StatefulWidget {
  const Adjustments({super.key});

  @override
  State<Adjustments> createState() => _AdjustmentsState();
}

class _AdjustmentsState extends State<Adjustments> {



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
              return Container(
                  child: ListView.builder(
                      itemCount: adjustmentsData!.length,
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
                                  // Text(adjustmentsData!.toString()),

                                  FmText(leftWidth:3,isbold:true,title: 'Serial No. :',        response: adjustmentsData![index]['SN'].toString()),
                                  FmText(leftWidth:3,isbold:true,title: 'Advocate Name :',     response: adjustmentsData![index]['Advocate_Name'].toString()),
                                  FmText(leftWidth:3,isbold:true,title: 'Enrollment No./Year', response: adjustmentsData![index]['Enrollment_No_Year'] ==null? '': adjustmentsData![index]['Enrollment_No_Year'].toString()),
                                  FmText(leftWidth:3,isbold:true,title: 'From Date',           response: adjustmentsData![index]['From_Date'].toString()),
                                  FmText(leftWidth:3,isbold:true,title: 'To Date',             response: adjustmentsData![index]['To_Date'].toString()),

                                ]));
                      }));
              }
          }
              )
              );}
}