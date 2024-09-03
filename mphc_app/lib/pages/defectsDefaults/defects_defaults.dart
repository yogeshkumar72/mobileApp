import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:mphc/pages/caseStatus/caseDetails/api.dart';
import 'dart:convert';
// import './defects_defaults_form.dart';


  //-----Form Storage Variables 
  String ? establishInput;
  String ? caseTypeInput;
  String ? yearInput;
  String ? caseNumberInput;


// class DDefaults extends StatefulWidget {
//   final String est;
//   final String year;
//   final String cno;
//   final String ctype;
//   const DDefaults({
//     required this.est,
//     required this.year,
//     required this.cno,
//     required this.ctype,
    
//     super.key
//     });

//   @override
//   State<DDefaults> createState() => _DefaultsState();
// }

// class _DefaultsState extends State<DDefaults> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child:Column(
//         children: [
//           FmText(title: 'Case Number', response: widget.cno.toString()),
//           FmText(title: 'Establishment', response: widget.est.toString()),
//           FmText(title: 'Year', response: widget.year.toString()),
//           FmText(title: 'Case type', response: widget.ctype.toString()),
//         ],
//       ),
//     );
//   }
// }







































// import './api.dart';
// import '../case_status.dart';

//------------------Defaults-------------------
String ? defaultsResponse;
Map ?    defaultsResult;
List ?   defaultsData;
bool ?   defaultsAvailable;

class DDefaults extends StatefulWidget {
  // final String ? establishInput;
  // final String ? caseTypeInput;
  // final String ? yearInput;
  // final String ? caseNumberInput;
  const DDefaults({
    // required this.establishInput,
    // required this.caseNumberInput,
    // required this.yearInput,
    // required this.caseTypeInput,
    super.key});

  @override
  State<DDefaults> createState() => _DefaultsState();
}

class _DefaultsState extends State<DDefaults> {


   Future getDefaults() async{
  //  if(defalutsCalled == true){
    http.Response dflt;
    try{
        dflt = await http.post(Uri.parse('http://ns2.mphc.in/api/defaults.php'),
        body:{
        // 'bench':'01',
        // 'case_type':'11',
        // 'case_no':'222',
        // 'case_year':'2016',
        'bench':    establishInput.toString(),
        'case_type':caseTypeInput.toString(),
        'case_no':  caseNumberInput.toString(),
        'case_year':yearInput.toString(),
      }
      );
      if(dflt.statusCode==200){
        // setState(() {
          defaultsResponse = dflt.body;
          defaultsResult  = json.decode(dflt.body);
          debugPrint(defaultsResult.toString());
          defaultsAvailable = defaultsResult?['success'];
          // debugPrint('${caseResult?[0][0]} ');
          debugPrint('-------------------Defaults api called-------------------------');
          // debugPrint(documentsResult?['results'].toString());
          defaultsData = defaultsResult?['results'];
          debugPrint(defaultsData.toString());
          // debugPrint(establishInput);
          // debugPrint(caseTypeInput);
          // debugPrint(caseNumberInput);
          // debugPrint(yearInput);
          

        // });
      }
      }
    catch(e){
      debugPrint('$e');
      }
    }
    // defalutsCalled = false;
  // }


 
  @override
  void initState() {
    getDefaults();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: const Text('Defects / Defaults'),
      centerTitle: true,
      ),
      body: FutureBuilder(
          future: getDefaults(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (defaultsData == null) {
              return const Center(child: Text('No Record Found'));
            } else {
              
              return Container(
                margin: const EdgeInsets.all(10),
                child:SingleChildScrollView(
                  child: Table(
                    border: TableBorder.all(width: 0.3),
                    children: [
                        TableRow(
                        children: [
                          TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), height:40,child:const Text('Objection',   style:TextStyle(fontWeight: FontWeight.w500,fontSize:16)))),
                          TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), height:40,child:const Text('Remark',      style:TextStyle(fontWeight: FontWeight.w500,fontSize:16)))),
                          TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), height:40,child:const Text('Remove Date', style:TextStyle(fontWeight: FontWeight.w500,fontSize:16)))),
                        ]
                      ),
                      for(var documents in defaultsData!)
                        TableRow(
                        children: [
                          TableCell(child:Container(padding:const EdgeInsets.all(10),child:Text(documents!['Objection'].toString(),   style:const TextStyle(fontWeight: FontWeight.w400,fontSize:16)))),
                          TableCell(child:Container(padding:const EdgeInsets.all(10),child:Text(documents!['Remark'].toString(),      style:const TextStyle(fontWeight: FontWeight.w400,fontSize:16)))),
                          TableCell(child:Container(padding:const EdgeInsets.all(10),child:Text(documents!['Remove_Date'].toString(), style:const TextStyle(fontWeight: FontWeight.w400,fontSize:16)))),
                        ]
                      ),
                  
                      
                    ],
                  ),
                )
              );

              //  return Container(
              //   margin:EdgeInsets.all(10),
              //    child: SingleChildScrollView(
              //     scrollDirection: Axis.vertical,
                 
              //      child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
                 
              //          const SizedBox(height: 20,),
              //       DataTable(
                      
              //         headingRowColor:const MaterialStatePropertyAll(Color.fromARGB(255, 238, 240, 244)),
              //         columnSpacing: 10,
              //         border:TableBorder.all(width: 0.1),
                      
              //         columns: const[
              //           DataColumn(label:Text('Objection')),
              //           DataColumn(label:Text('Remark')),
              //           DataColumn(label:Text('Remove \nDate')),
              //           // DataColumn(label: Expanded(flex:1,child:Text('Filing Date'))),
              //         ],
              //         rows: [
              //           // for (var document in snapshot.data!)
              //           for(var documents in defaultsData!)
              //             DataRow(
              //               cells: [
              //                 DataCell(SingleChildScrollView(child:Container( width:110,child:Text(documents!['Objection'].toString())))),
              //                 DataCell(SingleChildScrollView(child:Container( child:Text(documents!['Remark'].toString())))),
              //                 DataCell(SingleChildScrollView(child:Container( child:Text(documents!['Remove_Date'].toString())))),
              //                 // DataCell(SingleChildScrollView(scrollDirection:Axis.vertical,child: Container( height:30,child:Text(documents!['Filing_Date'].toString())   ))),
              //               ],
              //             ),
                          
                         
              //         ],
                       
              //       ),
              //                    ],
              //                  ),
              //    ),
              //  );


                      // Container(
                        // child: ListView.builder(
                            // itemCount: defaultsData!.length,
                            // itemBuilder: (context, index) {

                      //   return Container(
                      //       margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      //       padding: const EdgeInsets.all(10),
                      //       decoration: BoxDecoration(
                      //           color: const Color.fromARGB(255, 240, 240, 246),
                      //           borderRadius: BorderRadius.circular(10)),
                      //       // color:Colors.white70,
                      //       child: Column(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           crossAxisAlignment: CrossAxisAlignment.center,
                      //           children: [
                      //             // Text(defaultsData!.toString()),
                                 
                      //               FmText(isbold: true,  leftWidth: 2, title:'Objection' ,  response: defaultsData![index]['Objection'].toString()),
                      //               FmText(isbold: true,  leftWidth: 2, title:'Remark' ,     response: defaultsData![index]['Remark'].toString()),
                      //               FmText(isbold: true,  leftWidth: 2, title:'Remove Date' ,response: defaultsData![index]['Remove_Date'].toString()),
                                  
                            

                                // ]));
                      }
          }),
                      );

  }
          }
      // ),
  // );

  // }
// }




  class FmText extends StatefulWidget {
  final String title;
  final String response;
  final bool ? isbold;
  final int ? leftWidth;
  final bool ? responsebold;
  
  const FmText({
    required this.title,
    required this.response,
    this.isbold,
    this.leftWidth,
    this.responsebold,
    super.key});

  @override
  State<FmText> createState() => _FmTextState();
}

class _FmTextState extends State<FmText> {
int ?titleWidth;
bool ? rb;
@override
void initState() {
 titleWidth  =  widget.leftWidth ?? 3;
 rb = widget.responsebold ?? false;
 super.initState();
}

  @override
  Widget build(BuildContext context) {
    return Container(
      // color:Color.fromARGB(8, 255, 219, 103),
      padding:const EdgeInsets.symmetric(vertical: 5),
      // decoration: BoxDecoration(border:bo) ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex:titleWidth!, child: Container(margin: const EdgeInsets.fromLTRB(0, 3, 2, 0), color:const Color.fromARGB(0, 255, 221, 52),child:Text('${widget.title}',style:TextStyle(fontWeight: widget.isbold ==true?FontWeight.bold:FontWeight.normal,fontSize: 15)))),
          Expanded(flex:5,child: Container(margin: const EdgeInsets.fromLTRB(5, 3, 2, 0), color:const Color.fromARGB(0, 178, 178, 178) ,child:Text('${widget.response}',style:TextStyle(fontSize: 15,fontWeight: rb ==true?FontWeight.bold:FontWeight.normal)))),
          
        ],
      ),
    );
  }
}