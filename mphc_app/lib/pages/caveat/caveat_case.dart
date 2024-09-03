import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';





  String ? establishInput;
  String ? caseTypeInput;
  String ? yearInput;
  String ? caseNumber;


class CaveatCaseNumber extends StatefulWidget {
  // final String  ? est;
  // final String ? type;
  // final String ? year;
  // final String ? cNumber;


  const CaveatCaseNumber({
    // required this.est,
    // required this.type,
    // required this.year,
    // required this.cNumber,
    super.key});

  @override
  State<CaveatCaseNumber> createState() => _CaveatCaseNumberState();
}

class _CaveatCaseNumberState extends State<CaveatCaseNumber> {


  //-----------Details ===--------
String ? caveatCaseResponse;
Map ?    caveatCaseResult;
List ?   caveatCaseData;
bool ?   caveatCaseavailable;



  
//--------------------------Details-------------------------------------

  Future caveatCase() async{
    //  if(details == true){
    http.Response ft;
    try{
        ft = await http.post(Uri.parse('http://ns2.mphc.in/new_mobile_app_api/Caveat_By_Case_No.php'),
        body:{

          // 'lst_case' : widget.type.toString(),
          // 'txtcaseno' : widget.cNumber.toString(),
          // 'txtyear' : widget.year.toString(),
          // 'bench' : widget.est.toString(),
          'lst_case' : caseTypeInput,
          'txtcaseno' : caseNumber,
          'txtyear' : yearInput,
          'bench' : establishInput,
       
       
      }
      );
      
      if(ft.statusCode==200){
          caveatCaseResponse = ft.body;
          caveatCaseResult  = json.decode(ft.body);
          caveatCaseavailable = caveatCaseResult?['success'];
          debugPrint('-------------------Caveat Case Api Called-------------------------');
          caveatCaseData = caveatCaseResult?['results'];
          debugPrint(caveatCaseData.toString());
          // debugPrint(widget.type.toString());
      }
      }
    catch(e){
      debugPrint('$e');
      }
    //  }
    //  details = false;
    }








  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title:const Text('Caveat'),
        centerTitle: true,

      ),
      body:

      SingleChildScrollView(
        child: Container(
          // height: double.infinity,
          child:Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:[
        
                    FutureBuilder(
                  future:caveatCase(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (caveatCaseData == null) {
                      return const Center(child: Text('No Record Found'));
                    } else {
                      return Container(
                      
          decoration: const BoxDecoration(
        
          ),
        
        
          child:SingleChildScrollView(
         scrollDirection: Axis.vertical,
        
         child: Container(
          margin: const EdgeInsets.all(10),
           child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
                children: [
           
               const SizedBox(height: 20,),
        
            SingleChildScrollView(
              child: Table(
                columnWidths:const {
                      // 0:FlexColumnWidth(3),
                      // 1:FlexColumnWidth(2),
                      2:FlexColumnWidth(2),
                      // 3:FlexColumnWidth(2),
                },
              border: TableBorder.all(width: 0.3),
              children: [
                
                  TableRow(
                  children: [
              
                    TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), height:60,child:const Text('Caveat'          , style:TextStyle(fontWeight: FontWeight.w500,fontSize:16)))),
                    TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), height:60,child:const Text('C_Nature'         , style:TextStyle(fontWeight: FontWeight.w500,fontSize:16) ))),
                    TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), height:60,child:const Text('First Caveator / Proposed Respondent '         , style:TextStyle(fontWeight: FontWeight.w500,fontSize:16) ))),
                    TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), height:60,child:const Text('more       ', style:TextStyle(fontWeight: FontWeight.w500,fontSize:16) ))),
                    // TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), width:200,height:60,child: const Text('Court\nMessage', style:TextStyle(fontWeight: FontWeight.w500,fontSize:16)))),
                 ]
                ),
                for(var documents in caveatCaseData!)
                  TableRow(
                  children: [
                    // TableCell(child:Container(padding:const EdgeInsets.all(10),child:Text(documents!['Court_No'].toString(),   style:const TextStyle(fontWeight: FontWeight.w400,fontSize:16)))),
                    TableCell(child:Container(padding:const EdgeInsets.symmetric(horizontal: 0,vertical: 10),child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children:[ Text(documents!['caveat_no'].toString()), const Text('/'),Text(documents!['caveat_yr'].toString())]))),
                    TableCell(child:Container(padding:const EdgeInsets.all(10),child:Text(documents!['cnature'].toString(), style:const TextStyle(fontWeight: FontWeight.w400,fontSize:16)))),
                    TableCell(child:Container(padding:const EdgeInsets.all(10),child:Text(documents!['caveator'].toString(), style:const TextStyle(fontWeight: FontWeight.w400,fontSize:16)))),
                      TableCell(child:Container(padding:const EdgeInsets.all(0),child:
                            
                          TextButton(onPressed:(){

                                showDialog(context: context, builder: (BuildContext context){
                                  return AlertDialog(
                                            shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                                            title:const Text('Caveate'),
                                            content:SingleChildScrollView(
                                            child: Container(
                                            // height: 600,
                                            // width: double.infinity,
                                            child: Column(
                                              children: [
                                                // 
                                                FmText(title: 'Caveator Address',  response:documents!['caveator_add'].toString()),
                                                FmText(title: 'Caveator District',  response: documents!['caveatordist'].toString()),
                                                FmText(title: 'First Caveatee / Purposed Petitioner',  response: documents!['caveatee']??''),
                                                FmText(title: 'Caveatee Address',   response:documents!['caveatee_add'].toString()),
                                                FmText(title: 'Caveatee District',  response:documents!['caveateedist'].toString()),
                                                FmText(title: 'Case Dist', response:documents!['casedist'].toString()),
                                                FmText(title: 'Connected Case & Date', response:documents!['fil'].toString()),
                                                FmText(title: 'Judgement Date',response:documents!['doj'].toString()),
                                                FmText(title: 'End Date',response:documents!['ent_date'].toString()),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                // });
                
                                });


                          } , child:const Text('View')),
                            )),
                    // TableCell(child:Container(width:200,padding:const EdgeInsets.all(10),child:Text(documents!['Court_Message'].toString(), style:const TextStyle(fontWeight: FontWeight.w400,fontSize:16)),)),
                  
                  ]
                ),
                                
                
              ],
                                ),
            ),
        
        
                         ],
                       ),
         ),
                       ),
                      
          
          );
                    }
                  }),
        
              
            ]
          )
        ),
      ),






    );
  }
}



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
          Expanded(flex:titleWidth!, child: Container(margin: const EdgeInsets.fromLTRB(0, 3, 2, 0), color:const Color.fromARGB(0, 255, 221, 52),child:Text(widget.title,style:TextStyle(fontWeight: widget.isbold ==true?FontWeight.bold:FontWeight.normal,fontSize: 15)))),
          Expanded(flex:5,child: Container(margin: const EdgeInsets.fromLTRB(5, 3, 2, 0), color:const Color.fromARGB(0, 178, 178, 178) ,child:Text(widget.response,style:TextStyle(fontSize: 15,fontWeight: rb ==true?FontWeight.bold:FontWeight.normal)))),
          
        ],
      ),
    );
  }
}