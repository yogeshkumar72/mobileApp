import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:intl/intl.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:mphc_app/pages/freeTextSearch/free_text_search.dart';
// import 'package:mphc/pages/judgementOrder/judgement_order_jn.dart';

class FreeTSForm extends StatefulWidget {
  const FreeTSForm({super.key});

  @override
  State<FreeTSForm> createState() => _FreeTSFormState();
}

class _FreeTSFormState extends State<FreeTSForm> {



// String ? searchType;
// String ? searchText;
//   String ? judgeInput;
//   String? pickedDateInitial;
//   String? pickedDateEnd;
//   String ? bench;
//   String ? judgementOrder;
//   String ? afr;



  String ? textSearchHint;
  String? stringResponse;
  Map? mapResult;
  List? dropItems;
  List<String>? dropListUser;
  List<String>? dropListCode;




  
Future judgeApi() async{
    http.Response response;
    try{
      // /http://ns2.mphc.in/dgjdjdfj/judges.php?bench=1
    response = await http.post(Uri.parse('http://ns2.mphc.in/new_mobile_app_api/judges.php'),body:{
      'bench':'1',
    });
    if (response.statusCode==200){
    setState(() {
        stringResponse = response.body;
        mapResult = json.decode(response.body);
        dropItems = mapResult?['results'];
        dropListUser = dropItems!.map((map) =>(map['judgename']).toString()).toList();
        dropListCode = dropItems!.map((map) =>(map['judgecode']).toString()).toList();
        debugPrint(dropListUser.toString());
        debugPrint(dropItems.toString());
      });
    }
    }catch(e){
      debugPrint('$e');
    }
  }




  String ? formattedDate1;
  String ? formattedDate2;
  
Future <void> _selectDate1() async{
  DateTime ? picked1 = await showDatePicker(
      useRootNavigator: true,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1976),
      lastDate: DateTime(2100), 
  );
  if(picked1 !=null){
    setState(() {
      
     formattedDate1 = DateFormat('dd-MM-yyyy').format(picked1);
      // dateController?.text = formattedDate.toString();
      // pickedDate = picked.toString();
      pickedDateInitial = formattedDate1.toString();
    });
  }
}

Future <void> _selectDate2() async{
  DateTime ? picked2 = await showDatePicker(
      useRootNavigator: true,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1976),
      lastDate: DateTime(2100), 
  );
  if(picked2 !=null){
    setState(() {
      
     formattedDate2 = DateFormat('dd-MM-yyyy').format(picked2);
      // dateController?.text = formattedDate.toString();
      // pickedDate = picked.toString();
      pickedDateEnd = formattedDate2.toString();
    });
  }
}

@override
  void initState() {
    judgeApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromARGB(255, 79, 79, 94),
        title: const Text('free text search',style: TextStyle(fontWeight: FontWeight.bold),),
       
      ),
      body: Container(
        height: double.infinity,
        
        decoration: const BoxDecoration(
          image:DecorationImage(
            image: AssetImage('images/mphc02.jpg'),
            fit:BoxFit.contain,
            opacity: 1,
            alignment:Alignment.bottomCenter,
            colorFilter: ColorFilter.mode(Color.fromARGB(255, 191, 204, 227),BlendMode.screen),
            ),
          
        ),
        padding: const EdgeInsets.fromLTRB(40, 40, 40, 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
          children:[
          
            const Text('   Text for Search',style: TextStyle(fontWeight: FontWeight.bold),),
            // const SizedBox(height: 10),
            Container(
              child:TextField(
                onChanged: (value){
                    setState(() {
                      searchText = value;
                    });
                },
                decoration: const InputDecoration(
                  filled:true,
                   fillColor: Color.fromARGB(179, 231, 239, 255), 
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
                  border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))), 
                ),
              )
            ),

            const SizedBox(height: 20,),
            const Text('   Free Text Search Type',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
            Row(
              
              children:[
                
                Radio(
                  value: '1',
                  groupValue:searchType ,
                  onChanged: (value){
                   setState(() {
                      searchType = value;
                      textSearchHint = '   Exact will search the exact word or string.';
                    });
                }),
                const Text('Exact'),
                 Radio(
                  value: '2',
                  groupValue:searchType ,
                  onChanged: (value){
                   setState(() {
                      searchType = value;
                      textSearchHint = '   Any will search all or any of the words including similar words.';
                    });
                }),
                const Text('Any'),
                 Radio(
                  value: '3',
                  groupValue:searchType ,
                  onChanged: (value){
                    setState(() {
                      searchType = value;
                      textSearchHint = '   Use AND for inclusion, OR for Alternative, Not for Exclusion (in capital letters) between words for boolean search.';
                    });
                }),
                const Text('boolean'),
          
              ]
            ),
          
            Text((textSearchHint??'').toString(),textAlign: TextAlign.center ,style:const TextStyle(color:Color.fromARGB(255, 255, 77, 71))),
            // const SizedBox(height: 10,),
          
            Row(
                   children: [
                     Expanded(
                       child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('From Date',style: TextStyle(fontWeight: FontWeight.bold),),
                            TextField( 
                              onTap: (){
                                _selectDate1();
                                debugPrint(pickedDateInitial);
                              },
                              // controller:dateController,
                              decoration: InputDecoration(
                               
                    
                               fillColor: const Color.fromARGB(179, 231, 239, 255),
                                // labelText: 'From Date',
                                hintText: pickedDateInitial!=null?pickedDateInitial.toString().split(" ")[0]:'Start',
                                filled:true,
                                prefixIcon:const Icon(Icons.calendar_today),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide:BorderSide(
                                    color:Color.fromARGB(255, 175, 200, 247),
                                  ),
                                ),
                              ),
                              readOnly: true,
                            ),
                          ],
                        )
                      ),
                     ),
                     const SizedBox(width: 30,),
                     Expanded(
                       child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('To Date',style: TextStyle(fontWeight: FontWeight.bold),),
                            TextField( 
                              onTap: (){
                                _selectDate2();
                                debugPrint(pickedDateEnd);
                              },
                              // controller:dateController,
                              decoration: InputDecoration(
                                  fillColor: const Color.fromARGB(179, 231, 239, 255),
                                // labelText: 'To Date',
                                hintText: pickedDateEnd!=null?pickedDateEnd.toString().split(" ")[0]:'End',
                                filled:true,
                                prefixIcon:const Icon(Icons.calendar_today),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide:BorderSide(
                                    color:Color.fromARGB(255, 175, 200, 247),
                                  ),
                                ),
                              ),
                              readOnly: true,
                            ),
                          ],
                        )
                                  
                       ),
                     ),
                           ],
                 ),


                const SizedBox(height: 10,),

                 
                //---------------------Judges-----------------
                //  Container(margin: const EdgeInsets.fromLTRB(20, 10,0, 0),child: const Text('Select Judges',style:TextStyle(fontWeight: FontWeight.bold))),
                const Text('   Hon\'ble Judges',style:TextStyle(fontWeight: FontWeight.bold)),
                Container(
                // width: double.infinity,
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child:DropdownSearch<String>(
                    popupProps:const  PopupProps.menu(
                      showSearchBox: true,
                      searchDelay: Duration.zero,
                        showSelectedItems: true,
                      ),
                    items:  dropListUser == null? []:dropListUser!,
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                        dropdownSearchDecoration: InputDecoration(
                          filled:true,
                          fillColor: Color.fromARGB(179, 231, 239, 255),
                          prefixIcon: Icon(Icons.person),
                          border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                            // labelText: "Hon'ble Judges",
                            hintText: "select Hon'ble Judges",
                        ),
                    ),
                    onChanged: (value){
                      int index = dropListUser!.indexWhere((element)=>element == value!);
                      String val = dropListCode![index];
                      setState((){
                      judgeInput = val;
                      });
                      debugPrint(val);
                    },
                  )
                ),

// ----------------------------------bench-establishmentss---------------------
               const Text('Establishment',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
               const SizedBox(height: 5),
               Row(
              
               children:[
                
                Radio(
                   visualDensity: const VisualDensity(
                        horizontal: VisualDensity.maximumDensity,

                        vertical: VisualDensity.minimumDensity),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: 'S',
                  groupValue:bench,
                  onChanged: (value){
                   setState(() {
                      bench = value;
                      // textSearchHint = 'Exact will search the exact word or string.';
                    });
                }),
                const Text('SB'),
                 Radio(
                   visualDensity: const VisualDensity(
                        horizontal: VisualDensity.maximumDensity,
                        vertical: VisualDensity.minimumDensity),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: 'D',
                  groupValue:bench,
                  onChanged: (value){
                   setState(() {
                      bench = value;
                      // textSearchHint = 'Any will search all or any of the words including similar words.';
                    });
                }),
                const Text('DB'),
                 Radio(
                   visualDensity: const VisualDensity(
                        horizontal: VisualDensity.maximumDensity,
                        vertical: VisualDensity.minimumDensity),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: 'A',
                  groupValue:bench,
                  onChanged: (value){
                    setState(() {
                      bench = value;
                      // textSearchHint = 'Use AND for inclusion, OR for Alternative, Not for Exclusion (in capital letters) between words for boolean search.';
                    });
                }),
                const Text('All'),
          
              ]
            ),

           const SizedBox(height: 20),

  // --------------------------------Judgement / orders-------------------------------------
   const Text('Judgement / Order',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
   const SizedBox(height: 5),
               Row(
              
               children:[
                
                Radio(
                   visualDensity: const VisualDensity(
                        horizontal: VisualDensity.maximumDensity,
                        vertical: VisualDensity.minimumDensity),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: 'J',
                  groupValue:judgementOrder,
                  onChanged: (value){
                   setState(() {
                      judgementOrder = value;
                      // textSearchHint = 'Exact will search the exact word or string.';
                    });
                }),
                const Text('Judgement'),
                 Radio(
                   visualDensity: const VisualDensity(
                        horizontal: VisualDensity.maximumDensity,
                        vertical: VisualDensity.minimumDensity),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: 'O',
                  groupValue:judgementOrder,
                  onChanged: (value){
                   setState(() {
                      judgementOrder = value;
                      // textSearchHint = 'Any will search all or any of the words including similar words.';
                    });
                }),
                const Text('Order'),
              ]
            ),
            const SizedBox(height: 8),

            Row(
              children:[
                    Radio(
                       visualDensity: const VisualDensity(
                        horizontal: VisualDensity.maximumDensity,
                        vertical: VisualDensity.minimumDensity),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: 'FO',
                  groupValue:judgementOrder,
                  onChanged: (value){
                    setState(() {
                      judgementOrder = value;
                      // textSearchHint = 'Use AND for inclusion, OR for Alternative, Not for Exclusion (in capital letters) between words for boolean search.';
                    });
                }),

                const Text('Final Order'),
                    Radio(
                       visualDensity: const VisualDensity(
                        horizontal: VisualDensity.maximumDensity,
                        vertical: VisualDensity.minimumDensity),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: 'A',
                  groupValue:judgementOrder,
                  onChanged: (value){
                    setState(() {
                      judgementOrder = value;
                      // textSearchHint = 'Use AND for inclusion, OR for Alternative, Not for Exclusion (in capital letters) between words for boolean search.';
                    });
                }),
                const Text('All'),
              ]
            ),

            const SizedBox(height: 20),

// ----------------------------------A  F  R---------------------
               const Text('  AFR',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
               Row(
              
               children:[
                
                Radio(
                   visualDensity: const VisualDensity(
                        horizontal: VisualDensity.maximumDensity,
                        vertical: VisualDensity.minimumDensity),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: 'Y',
                  groupValue:afr,
                  onChanged: (value){
                   setState(() {
                      afr = value;
                      // textSearchHint = 'Exact will search the exact word or string.';
                    });
                }),
                const Text('Yes'),
                 Radio(
                   visualDensity: const VisualDensity(
                       horizontal: VisualDensity.maximumDensity,
                        vertical: VisualDensity.minimumDensity),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: 'N',
                  groupValue:afr,
                  onChanged: (value){
                   setState(() {
                      afr = value;
                      // textSearchHint = 'Any will search all or any of the words including similar words.';
                    });
                }),
                const Text('No'),
                 Radio(
                   visualDensity: const VisualDensity(
                        horizontal: VisualDensity.maximumDensity,
                        vertical: VisualDensity.minimumDensity),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  value: 'A',
                  groupValue:afr,
                  onChanged: (value){
                    setState(() {
                      afr = value;
                      // textSearchHint = 'Use AND for inclusion, OR for Alternative, Not for Exclusion (in capital letters) between words for boolean search.';
                    });
                }),
                const Text('All'),
          
              ]
            ),


            const SizedBox(height: 30,),

            TextButton(onPressed: (){
              debugPrint(searchText);
              debugPrint(searchType);
              debugPrint(pickedDateInitial);
              debugPrint(pickedDateEnd);
              debugPrint(bench);
              debugPrint(judgementOrder);
              debugPrint(afr);
              Navigator.push(context, MaterialPageRoute(builder: (context) => const FreeTextSearch() ));

            }, child: Container(width: double.infinity, padding: const EdgeInsets.fromLTRB(40, 15, 40, 15),decoration:const BoxDecoration(color: Color.fromARGB(255, 116, 116, 116),borderRadius: BorderRadius.all(Radius.circular(20))), child:const Center(child: Text('Show',style:TextStyle(color:Colors.white))))),

          
          

          
                ]
          
              ),
        ),
      )
    );
    
  }
}