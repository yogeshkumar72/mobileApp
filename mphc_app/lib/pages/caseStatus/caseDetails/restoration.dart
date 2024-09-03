import 'package:flutter/material.dart';
import 'api.dart';
import '../case_status.dart';

class Restoration extends StatefulWidget {
  const Restoration({super.key});

  @override
  State<Restoration> createState() => _RestorationState();
}

class _RestorationState extends State<Restoration> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: api.getRestoration(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (restorationData == null) {
              return const Center(child: Text('No Record Found'));
            } else {
              return Container(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  decoration: const BoxDecoration(
                  //     gradient: LinearGradient(
                  //   colors: [
                  //     Color.fromARGB(64, 68, 137, 255),
                  //     Color.fromARGB(34, 179, 64, 251)
                  //   ],
                  //   begin: Alignment.topLeft,
                  //   end: Alignment.bottomRight,
                  // )
                  ),
                  child: ListView.builder(
                      itemCount: restorationData!.length,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: const EdgeInsets.all(4),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              // gradient: const LinearGradient(
                                // colors: [
                                  // Color.fromARGB(40, 14, 99, 246),
                                  // Color.fromARGB(20, 206, 178, 248)
                                // ],
                                // begin: Alignment.topLeft,
                                // end: Alignment.bottomRight,
                              // ),
                               color: const Color.fromARGB(255, 240, 240, 246),
                              borderRadius: BorderRadius.circular(10),
                              // border: Border.all(width: 0.2),
                            ),

                            // color:Colors.white70,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text(restorationData.toString(),style: TextStyle(fontSize: 20),),

                                
                                
                                
                                
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),child: const Text('Sr. No.',style: TextStyle(color: Color.fromARGB(255, 80, 80, 80), fontWeight: FontWeight.bold,fontSize: 16))),
                                      Container(padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),child: Text(restorationData![index]['sno'].toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Color.fromARGB(255, 74, 74, 74)))),
                                    ],
                                  ),
                                  FmText(isbold:true,title: 'Disposal Date :',       response: restorationData![index]['Disposal_Dt'].toString()),
                                  FmText(isbold:true,title: 'Disposed By :',         response: restorationData![index]['Disposed_By'].toString()),
                                  FmText(isbold:true,title: 'Disposed Type :',       response: restorationData![index]['Disposal_Type'].toString()),
                                  FmText(isbold:true,title: 'Disp Entry Dt :',       response: restorationData![index]['Disp_Entry_Dt'].toString()),
                                  FmText(isbold:true,title: 'Restoration Date :',    response: restorationData![index]['Restoration_Dt'].toString()),
                                  FmText(isbold:true,title: 'Restored By Judge :',   response: restorationData![index]['Restore_By_Judge'].toString()),
                                  FmText(isbold:true,title: 'Restored By Case No :', response: restorationData![index]['Restored_by_Case_No'].toString()),
                                  // Row(
                                  //   children: [
                                  //     Expanded(child:Container(padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),height: 40,child: const Text('Disposal Date : ',style: TextStyle(color: Color.fromARGB(255, 40, 61, 255),fontSize: 16)))),
                                  //     Expanded(flex:2,child:Container(padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),height: 40,child: Text(restorationData![index]['Disposal_Dt'].toString(),style: const TextStyle(color: Color.fromARGB(229, 0, 0, 0),fontSize: 16,fontWeight:FontWeight.w500)))),
                                  //   ],
                                  // ),

                                  // Row(
                                  //   children: [
                                  //     Expanded(child: Container(padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),height: 40,child: const Text('Disposed By : ',style: TextStyle(color: Color.fromARGB(255, 46, 60, 250),fontSize: 16)))),
                                  //     Expanded( flex:2,child: Container( padding: const EdgeInsets.fromLTRB( 0, 0, 5, 5),height: 40,child: Text(restorationData![index]['Disposed_By'].toString(),style: const TextStyle(color: Color.fromARGB(255, 24, 24, 24),fontSize: 16,fontWeight: FontWeight.bold)))),
                                  //   ],
                                  // ),

                                  // Row(
                                    // children: [
                                    //   Expanded(child: Container(padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),height: 40,child: const Text('Disposed Type : ',style: TextStyle(color: Color.fromARGB(255, 46, 60, 250),fontSize: 16)))),
                                    //   Expanded(flex: 2, child: Container( padding: const EdgeInsets.fromLTRB( 0, 0, 5, 5),height: 40,child: Text(restorationData![index]['Disposal_Type'].toString(),style: const TextStyle(color: Color.fromARGB(255, 24, 24, 24),fontSize: 16,)))),
                                    // ],
                                  // ),

                                  // Row(
                                  //   children: [
                                  //     Expanded(child: Container(padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),height: 40,child: const Text('Disp Entry Dt : ',style: TextStyle(color: Color.fromARGB(255, 46, 60, 250),fontSize: 16)))),
                                  //     Expanded(flex: 2, child: Container( padding: const EdgeInsets.fromLTRB( 0, 0, 5, 5),height: 40,child: Text(restorationData![index]['Disp_Entry_Dt'].toString(),style: const TextStyle(color: Color.fromARGB(255, 24, 24, 24),fontSize: 16,)))),
                                  //   ],
                                  // ),

                                  // Row(
                                  //   children: [
                                  //     Expanded(child: Container(padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),height: 40,child: const Text('Restoration Date: ',style: TextStyle(color: Color.fromARGB(255, 46, 60, 250),fontSize: 16)))),
                                  //     Expanded(flex: 2, child: Container( padding: const EdgeInsets.fromLTRB( 0, 0, 5, 5),height: 40,child: Text(restorationData![index]['Restoration_Dt'].toString(),style: const TextStyle(color: Color.fromARGB(255, 24, 24, 24),fontSize: 16,)))),
                                  //   ],
                                  // ),

                                  // Row(
                                  //   children: [
                                  //     Expanded(child: Container(padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),height: 40,child: const Text('Restored By Judge: ',style: TextStyle(color: Color.fromARGB(255, 46, 60, 250),fontSize: 16)))),
                                  //     Expanded(flex: 2, child: Container( padding: const EdgeInsets.fromLTRB( 0, 0, 5, 5),height: 40,child: Text(restorationData![index]['Restore_By_Judge'].toString(),style: const TextStyle(color: Color.fromARGB(255, 24, 24, 24),fontSize: 16,)))),
                                  //   ],
                                  // ),

                                  // Row(
                                  //   children: [
                                  //     Expanded(child: Container(padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),height: 40,child: const Text('Restored By Case No : ',style: TextStyle(color: Color.fromARGB(255, 46, 60, 250),fontSize: 16)))),
                                  //     Expanded(flex: 2, child: Container( padding: const EdgeInsets.fromLTRB( 0, 0, 5, 5),height: 40,child: Text(restorationData![index]['Restored_by_Case_No'].toString(),style: const TextStyle(color: Color.fromARGB(255, 24, 24, 24),fontSize: 16,)))),
                                  //   ],
                                  // ),
                              
                                 
                                ]));
                      }));
            }
          }),
    );
  }
}
