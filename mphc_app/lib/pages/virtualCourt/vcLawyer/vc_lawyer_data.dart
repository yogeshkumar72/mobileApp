import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:url_launcher/url_launcher_string.dart';



  String ? mobileNo;
  String ? establishInput;
  String ? selectInput;
  String ? pickedDate;


class VCLawerData extends StatefulWidget {
  const VCLawerData({super.key});

  @override
  State<VCLawerData> createState() => _VCLawerDataState();
}

class _VCLawerDataState extends State<VCLawerData> {


  //-----------Details ===--------
String ? VCLResponse;
Map ?    VCLResult;
List ?   VCLData;
bool ?   VCLavailable;

@override
  void dispose() {
    
  mobileNo=null;
  establishInput=null;
  selectInput=null;
  pickedDate=null;
  super.dispose();
    
    
  }
  
//--------------------------Details-------------------------------------

  Future VCLawyer() async{
  
    http.Response ft;
    try{
        ft = await http.post(Uri.parse('https://mphc.gov.in/api/new_mobile_app_api/get_cl_le.php'),
        body:{
         'mobile':mobileNo.toString(),
         'dtd':pickedDate.toString(),
         'bench':establishInput.toString(),
         'mfb':selectInput.toString(),
         'dw':'1',  
      }
      );
      
      if(ft.statusCode==200){
          VCLResponse = ft.body;
          VCLResult  = json.decode(ft.body);
          VCLavailable = VCLResult?['success'];
          debugPrint('-------------------Caveat Case Api Called-------------------------');
          VCLData = VCLResult?['results'];
          debugPrint(VCLData.toString());
          
      }
      }
    catch(e){
      debugPrint('$e');
      }
    
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Virtual Lawer Court'),
      ),
      body:
        FutureBuilder(
                          future:VCLawyer(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Center(child: CircularProgressIndicator());
                            } else if (VCLData == null) {
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
                              0:FlexColumnWidth(1),
                              1:FlexColumnWidth(2),
                              2:FlexColumnWidth(2),
                              3:FlexColumnWidth(3),
                              4:FlexColumnWidth(1.5),
                        },
                      border: TableBorder.all(width: 0.3),
                      children: [
                          TableRow(
                          children: [
                            TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), height:60,child:const Text(' C.L.No./S.No.'          , style:TextStyle(fontWeight: FontWeight.w500,fontSize:16)))),
                            TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), height:60,child:const Text('Case No.'         , style:TextStyle(fontWeight: FontWeight.w500,fontSize:16) ))),
                            TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), height:60,child:const Text('[ORDERS]'         , style:TextStyle(fontWeight: FontWeight.w500,fontSize:16) ))),
                            TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), height:60,child:const Text(' HON\'BLE Justice ', style:TextStyle(fontWeight: FontWeight.w500,fontSize:16) ))),
                            TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), width:200,height:60,child: const Text('Other Details', style:TextStyle(fontWeight: FontWeight.w500,fontSize:16)))),
                         ]
                        ),
                        for(var documents in VCLData!)
                        for(var document in documents!['clist'])
                          TableRow(
                          children: [
                            TableCell(child:Container(child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children:[ Text(document!['CauseListNumber'].toString()), const Text('/'),Text(document!['Board_Serial_Number'].toString())]))),
                            TableCell(child:Container(padding:const EdgeInsets.all(5),child:Text(document!['Case_Number'].toString(), style:const TextStyle(fontWeight: FontWeight.w400,fontSize:16)))),
                            TableCell(child:Container(padding:const EdgeInsets.all(5),child:Text(document!['Stagename'].toString(), style:const TextStyle(fontWeight: FontWeight.w400,fontSize:16)))),
                            TableCell(child:Container(padding:const EdgeInsets.all(5),child:Text(documents!['coram'].toString(), style:const TextStyle(fontWeight: FontWeight.w400,fontSize:16)))),
                            TableCell(child:Container(padding:const EdgeInsets.all(0),child:
                          TextButton(onPressed:(){
                                showDialog(context: context, builder: (BuildContext context){
                                  return AlertDialog(
                                            shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                                            title:const Text('Cause List'),
                                            content:SingleChildScrollView(
                                            child: Container(
                                            // height: 600,
                                            // width: double.infinity,
                                            child: Column(
                                              children: [
                                                // 
                                                FmText(title: 'Next Date',  response:document!['Next_Date'].toString()),
                                                FmText(title: 'Hon\'ble Judge',  response: document!['jname1'].toString()),
                                                FmText(title: '',  response: document!['jname2']??''),
                                                FmText(title: '',  response: document!['jname3']??''),
                                                FmText(title: '',  response: document!['jname4']??''),
                                                FmText(title: '',  response: document!['jname5']??''),
                                                FmText(title: 'Petitioner',   response:document!['Petitioner_name'].toString()),
                                                FmText(title: 'Respondent.',  response:document!['Respondent_name'].toString()),
                                                FmText(title: 'Petitioner Advocate.', response:document!['Petitioner_Adv'].toString()),
                                                FmText(title: 'Respondent Advocate.', response:document!['Respondent_Adv'].toString()),
                                                FmText(title: 'Court Number',response:document!['Court_Number'].toString()),
                                                GestureDetector(
                                                   onTap: ()  {
                                                    
                                                   launchUrlString(document!['VC_Link'].toString());
                                
                                                   },
                                                  child:const Text('Click Here to Join VC',style: TextStyle(fontWeight: FontWeight.bold,color:Colors.blue),),),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                // });
                
                                });
                          } , child:Icon(Icons.read_more)),
                          // const Text('View')),
                            )),
                          ]
                        ),
                      ],

                          // Text(VCLData![0].toString()),
                   
                    //    const SizedBox(height: 20,),
                
                    // SingleChildScrollView(
                    //   child: Table(
                    //     columnWidths:const {
                    //           0:FlexColumnWidth(1),
                    //           1:FlexColumnWidth(2),
                    //           2:FlexColumnWidth(1),
                    //           3:FlexColumnWidth(2),
                    //           4:FlexColumnWidth(4),
                    //     },
                    //   border: TableBorder.all(width: 0.3),
                    //   children: [
                    //       TableRow(
                    //       children: [
                      
                    //         TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), height:60,child:const Text('C.No'          , style:TextStyle(fontWeight: FontWeight.w500,fontSize:16)))),
                    //         TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), height:60,child:const Text('Court'         , style:TextStyle(fontWeight: FontWeight.w500,fontSize:16) ))),
                    //         TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), height:60,child:const Text('Sr.No'         , style:TextStyle(fontWeight: FontWeight.w500,fontSize:16) ))),
                    //         TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), height:60,child:const Text('Case.No        ', style:TextStyle(fontWeight: FontWeight.w500,fontSize:16) ))),
                    //         TableCell(child:Container(color:Colors.black12,padding:const EdgeInsets.all(10), width:200,height:60,child: const Text('Court\nMessage', style:TextStyle(fontWeight: FontWeight.w500,fontSize:16)))),
                    //      ]
                    //     ),
                    //     for(var documents in VCLData!)
                    //       TableRow(
                            
                    //       children: [
                    //         TableCell(child:Container(padding:const EdgeInsets.all(10),child:Text(documents!['Court_No'].toString(),   style:const TextStyle(fontWeight: FontWeight.w400,fontSize:16)))),
                    //         TableCell(child:Container(child: Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children:[ Text(documents!['Judge_Code'].toString()), const Text('-'),Text(documents!['Single_Double_Bench'].toString())]))),
                    //         TableCell(child:Container(padding:const EdgeInsets.all(10),child:Text(documents!['Sr_No'].toString(), style:const TextStyle(fontWeight: FontWeight.w400,fontSize:16)))),
                    //         TableCell(child:Container(padding:const EdgeInsets.all(10),child:Text(documents!['Case_Number'].toString(), style:const TextStyle(fontWeight: FontWeight.w400,fontSize:16)))),
                    //         TableCell(child:Container(width:200,padding:const EdgeInsets.all(10),child:Text(documents!['Court_Message'].toString(), style:const TextStyle(fontWeight: FontWeight.w400,fontSize:16)),)),
                          
                    //       ]
                    //     ),
                                        
                        
                    //   ],
                    //                     ),
                    // ),
                
                
                      ),
                               ),
                 ]),
                               ),
                              
                  
                  ));
                            }
                          }),
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
          Expanded(flex:titleWidth!, child: Container(margin: const EdgeInsets.fromLTRB(0, 3, 2, 0), color:const Color.fromARGB(0, 255, 221, 52),child:Text('${widget.title}',style:TextStyle(fontWeight: widget.isbold ==true?FontWeight.bold:FontWeight.normal,fontSize: 15)))),
          Expanded(flex:6,child: Container(margin: const EdgeInsets.fromLTRB(5, 3, 2, 0), color:const Color.fromARGB(0, 178, 178, 178) ,child:Text('${widget.response}',textAlign: TextAlign.left,style:TextStyle(fontSize: 15,fontWeight: rb ==true?FontWeight.bold:FontWeight.normal)))),
          
        ],
      ),
    );
  }
}
   