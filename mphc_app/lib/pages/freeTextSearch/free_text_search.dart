import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:url_launcher/url_launcher_string.dart';


  String ? searchType;
  String ? searchText;
  String ? judgeInput;
  String ? pickedDateInitial;
  String ? pickedDateEnd;
  String ? bench;
  String ? judgementOrder;
  String ? afr;
  
  
class FreeTextSearch extends StatefulWidget {
  const FreeTextSearch({super.key});

  @override
  State<FreeTextSearch> createState() => _FreeTextSearchState();
}

class _FreeTextSearchState extends State<FreeTextSearch> {


int ? index = 0; 


  //-----------Details ===--------
String ? freeTextResponse;
Map ?    freeTextResult;
List ?   freeTextData;
bool ?   freeTextavailable;



  
//--------------------------Details-------------------------------------

  Future freeTextAPI() async{
    //  if(details == true){
    http.Response ft;
    try{
        ft = await http.post(Uri.parse('http://ns2.mphc.in/new_mobile_app_api/free_text_search.php'),
        body:{
       'txt_search' : searchText,
       'fts_type' : searchType,
       'date1' : pickedDateInitial,
       'date2' : pickedDateEnd,
       'j1' :judgeInput,
       'j2' :'',
       'bench' : bench,
       'judgement' : judgementOrder,
       'afr' : afr,
       'index' :'0', 
      }
      );
      
      if(ft.statusCode==200){
          freeTextResponse = ft.body;
          freeTextResult  = json.decode(ft.body);
          freeTextavailable = freeTextResult?['success'];
          debugPrint('-------------------free text API Called-------------------------');
          freeTextData = freeTextResult?['results'];
          debugPrint(freeTextData.toString());
      }
      }
    catch(e){
      debugPrint('$e');
      }
    //  }
    //  details = false;
    }
    incrementIndex(){
     index = index! + 1;
    }

@override
  void initState() {
    freeTextAPI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Free Text Search'),
        centerTitle: true,

      ),
      body:
      SingleChildScrollView(
                child: Container(
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[
                
                           FutureBuilder(
                          future:freeTextAPI(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Center(child: CircularProgressIndicator());
                            } else if (freeTextData == null) {
                              return const Center(child: Text('No Record Found'));
                            } else {
                              incrementIndex();
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
                              // 0:FlexColumnWidth(1),
                              // 1:FlexColumnWidth(2),
                              2:FlexColumnWidth(3),
                              // 3:FlexColumnWidth(2),
                              // 4:FlexColumnWidth(4),
                        },
                      border: TableBorder.all(width: 0.3),
                      children: [
                          TableRow(
                          children: [
                      
                            TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), height:60,child:const Text('S.No'          , style:TextStyle(fontWeight: FontWeight.w500,fontSize:16)))),
                            TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), height:60,child:const Text('Case No.'         , style:TextStyle(fontWeight: FontWeight.w500,fontSize:16) ))),
                            TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), height:60,child:const Text('Bench'         , style:TextStyle(fontWeight: FontWeight.w500,fontSize:16) ))),
                            // TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), height:60,child:const Text('Case.No'       , style:TextStyle(fontWeight: FontWeight.w500,fontSize:16) ))),
                            TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), width:200,height:60, child: const Text('Show More', style:TextStyle(fontWeight: FontWeight.w500,fontSize:16)))),
                         ]
                        ),
                        
                        // for(var documents in freeTextData!)
                        for(int i=0; i<freeTextData!.length; i++ )
                        

                           
                          TableRow(
                            
                          children: [
                            TableCell(child:Container(padding:const EdgeInsets.all(10),child:Text((i+1).toString(),   style:const TextStyle(fontWeight: FontWeight.w400,fontSize:16)))),
                            // TableCell(child:Container(child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children:[ Text(documents!['Case_No'].toString()), const Text('-'),Text(documents!['Bench'].toString())]))),
                            TableCell(child:Container(padding:const EdgeInsets.all(10),child:Text(freeTextData![i]['Case_No'].toString(), style:const TextStyle(fontWeight: FontWeight.w400,fontSize:16)))),
                            TableCell(child:Container(padding:const EdgeInsets.all(10),child:Text(freeTextData![i]['Bench'].toString(), style:const TextStyle(fontWeight: FontWeight.w400,fontSize:16)))),
                            // TableCell(child:Container(width:200,padding:const EdgeInsets.all(10),child:const Text('More Details', style:TextStyle(fontWeight: FontWeight.w400,fontSize:16)),)),
                            TextButton(                         
                           onPressed: (){
                            // debugPrint(.toString());
                            
                            showDialog(context: context, builder: (BuildContext context){
                                  return AlertDialog(
                                    backgroundColor: const Color.fromARGB(255, 249, 251, 255),
                                    shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                                    title:const Text('Case Details '),
                                    content:SingleChildScrollView(
                                      child: Container(
                                        height: 400,
                                        child: Column(
                                          children: [
                                              FmText(isbold:true, leftWidth:3,title: 'Petitioner Vs Respondent :',  response: freeTextData![i]['Petitioner_Respondent'].toString()),
                                              FmText(isbold:true, leftWidth:3,title: 'Order Date',    response: freeTextData![i]['Order_Date'].toString()),
                                              // FmText(isbold:true, leftWidth:2,title: 'Court Message', response: documents![''].toString()),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  TextButton(onPressed: (){
                                                    launchUrlString(freeTextData![i]['PDF_Link'].toString());
                                                  
                                                  }, child: Container( margin:const EdgeInsets.fromLTRB(0, 40,0, 10),child: const Text('Download PDF'))),
                                                ],
                                              )
                                          ],
                                        ),

                                        
                                      ),
                                    ),
                                  );
                                // });

                                });

                            }, child: Icon(Icons.read_more_outlined,size:30),
                            // const Text('Show More')
                         ),


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