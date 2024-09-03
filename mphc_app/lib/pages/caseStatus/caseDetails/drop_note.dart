import 'package:flutter/material.dart';
import 'api.dart';
import '../case_status.dart';

class DropNote extends StatefulWidget {
  const DropNote({super.key});

  @override
  State<DropNote> createState() => _DropNoteState();
}

class _DropNoteState extends State<DropNote> {

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: FutureBuilder(
          future: api.getDropNote(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (dropnoteData == null) {
              return const Center(child: Text('No Record Found'));
            } else {
              return   Container(
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
                      itemCount: dropnoteData!.length,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: const EdgeInsets.all(4),
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                        
                              color: const Color.fromARGB(255, 240, 240, 246),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(width: 0.2),
                            ),

                            // color:Colors.white70,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [

       
                                          
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(padding: const EdgeInsets.fromLTRB(0, 5, 5, 10),child: const Text('CL Date.',style: TextStyle(color: Color.fromARGB(255, 80, 80, 80),fontWeight: FontWeight.bold,fontSize: 16))),
                                      Container(padding: const EdgeInsets.fromLTRB(0, 5, 5, 10),child: Text(dropnoteData![index]['CL_Date'].toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 16, color: Color.fromARGB(255, 74, 74, 74)))),
                                    ],
                                  ),

                                  FmText( isbold: true ,title: 'Honble Court :', response:dropnoteData![index]['Honble_Court'].toString()),
                                  FmText( isbold: true ,title: 'Cause List No. :', response:dropnoteData![index]['Cause_List_No'].toString()),
                                  FmText( isbold: true ,title: 'Honble Court', response:dropnoteData![index]['Remark'].toString()),

                                 const SizedBox(
                                    height: 15,
                                  )
                                ]));
                      })); 
              




              }
            }),
              );
  }

}