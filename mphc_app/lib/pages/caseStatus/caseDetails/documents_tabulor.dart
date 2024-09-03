import 'package:flutter/material.dart';
import '../case_status.dart';
import './api.dart';

class DocumentsTab extends StatefulWidget {
  const DocumentsTab({super.key});

  @override
  State<DocumentsTab> createState() => _DocumentsState();
}

class _DocumentsState extends State<DocumentsTab> {
  @override
  void initState() {
    // api.getDocuments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // title: Text('FutureBuilder Example'),
      // ),
      body: FutureBuilder(
        
          future: api.getDocuments(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (documentsData == null) {
              return const Center(child: Text('No Record Found'));
            } else {
               return SingleChildScrollView(
                scrollDirection: Axis.vertical,

                 child: Column(
                      children: [

                     const SizedBox(height: 20,),
                  DataTable(
                    
                    headingRowColor:const MaterialStatePropertyAll(Color.fromARGB(255, 238, 240, 244)),
                    columnSpacing: 10,
                    border:TableBorder.all(width: 0.1),
                    
                    columns: const[
                      DataColumn(label: Expanded(flex:1,child:Text('Document_No'))),
                      DataColumn(label: Expanded(flex:1,child:Text('Document Type'))),
                      DataColumn(label: Expanded(flex:1,child:Text('Filed By'))),
                      DataColumn(label: Expanded(flex:1,child:Text('Filing Date'))),
                    ],
                    rows: [
                      // for (var document in snapshot.data!)
                      for(var documents in documentsData!)
                        DataRow(
                          cells: [
                            DataCell(SingleChildScrollView(scrollDirection:Axis.vertical,child: Container( height:30,child:Text((documents!['Document_No'].split(',')[0]).toString())   ))),
                            DataCell(SingleChildScrollView(scrollDirection:Axis.vertical,child: Container( height:30,child:Text(documents!['Document_Type'].toString()) ))),
                            DataCell(SingleChildScrollView(scrollDirection:Axis.vertical,child: Container( height:30,child:Text(documents!['Filed_By'].toString())      ))),
                            DataCell(SingleChildScrollView(scrollDirection:Axis.vertical,child: Container( height:30,child:Text(documents!['Filing_Date'].toString())   ))),
                          ],
                        ),
                    ],
                  ),
                               ],
                             ),
               );


            }
          }),
    );
  }
}
