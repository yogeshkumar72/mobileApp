// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:mphc_app/pages/displayboard/bloc';
// import 'package:mphc_app/pages/displayboard/bloc/displayboard_bloc.dart';

// class DisplayBoard extends StatefulWidget {
//   const DisplayBoard({super.key});

//   @override
//   State<DisplayBoard> createState() => _DisplayBoardState();
// }

// class _DisplayBoardState extends State<DisplayBoard> {
// String ? benchInput;

// //  String ? benchInput;

// List<String> branchName = ["Principle Seat Jabalpur", "Bench Indore", "Bench Gwalior"];
// List<String> branchCode= ["1", "2", "3"];

// String ? branchInput;

// final DisplayboardBloc displayBoard = DisplayboardBloc();

//   @override
//   Widget build(BuildContext context) {
    
//     return BlocConsumer<DisplayboardBloc, DisplayboardState>(
//       bloc:displayBoard,


//       // listenWhen: (previous, current){null;},
//       // buildWhen: (previous,current){null;},


//       listener: (context, state) {
//         // TODO: implement listener
//       },
//       builder: (context, state) {
//         return Scaffold(
//           appBar: AppBar(
//             title:const Text("Display Board"),
//             centerTitle: true,
//             backgroundColor: Colors.white,
//           ),
//           body:Container(
//             padding:const EdgeInsets.all(20),
//             decoration: const BoxDecoration(
//               color:Colors.white,
//             ),
//             child: Column(
//               children:[ 
//                 // const Text("form will be here"),
//                 const Row(
//                       children: [
//                         Text('  Select Establishment',style: TextStyle(color: Color.fromARGB(255, 62, 68, 107),fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
//                       ],
//                 ),
    
    
    
//                    Container(
//                     width: double.infinity,
//                     child:DropdownSearch<String>(
//                     popupProps:const  PopupProps.menu(
//                       showSearchBox: true,
//                       searchFieldProps: TextFieldProps(
//                         decoration: InputDecoration(
//                         labelText: "Search",
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Color.fromARGB(255, 160, 160, 160), width: 0.5),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Color.fromARGB(255, 28, 28, 28), width: 0.5),
//                         ),
//                           border: OutlineInputBorder(
//                             borderSide: BorderSide(width:2, color: Colors.black54),
//                           ),
//                         )
//                       ),
    
    
//                       searchDelay: Duration.zero,
//                       showSelectedItems: true,
//                       ),
//                     items:  branchName == null? []:branchName!,
//                     // dropdownDecoratorProps: const DropDownDecoratorProps(
//                     dropdownDecoratorProps: const DropDownDecoratorProps(
//                         dropdownSearchDecoration: InputDecoration(
//                           fillColor: Colors.white,
//                           filled: true,
//                           // focusColor: Color.fromARGB(255, 255, 255, 255),
//                           // hoverColor: Colors.white,
//                           border:OutlineInputBorder(
//                             borderSide: BorderSide(width: 0.5,color: Color.fromARGB(255, 218, 234, 0)),
//                             borderRadius: BorderRadius.all(Radius.circular(10))),
//                             // labelText: "Case Type",
//                             hintText: "Select Bench",
//                             prefixIcon:Icon(Icons.location_city,color: Color.fromARGB(255, 62, 68, 107), )
//                         ),
//                     ),
//                     onChanged: (value){
//                       int index = branchName!.indexWhere((element)=>element == value!);
//                       String val = branchCode![index];
//                       setState((){
//                       branchInput = val;
//                       });
//                       debugPrint(val);
//                     },
//                   )
//                 ),
    
    
//                 const SizedBox(
//                   height: 50,
//                 ),
    
//                 InkWell(
//                   onTap: (){
//                     if(branchInput!=null){
//                     Navigator.push(context, MaterialPageRoute(builder: (context)=>const Text("displayBoard")));
//                     }
//                     else{
//                       showDialog(context: context, builder: (BuildContext context){
//                                       return AlertDialog(
//                                         shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
//                                         title:const Text('Error '),
//                                         content:SingleChildScrollView(
//                                           child: Container(
//                                             height: 200,
//                                             child:const Column(
//                                               children: [
//                                                 Text(
//                                                   'Bench is Not Selected'
//                                                 ),
                          
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                       );
//                                     // });
    
//                                     });
//                     }
//                   },
//                   child:Container(
//                     // color:Colors.blue.shade100,
//                     // padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
//                     padding:const EdgeInsets.symmetric(horizontal:50, vertical:15),
//                     decoration: BoxDecoration(color: const Color.fromARGB(255, 68, 74, 108),borderRadius: BorderRadius.circular(8)),
//                     child:const Text('Submit',style: TextStyle(color: Colors.white),)
//                   )
//                 )
    
    
    
    
    
    
    
    
    
                
    
//                 //  Container(
//                 //         padding:const EdgeInsets.symmetric(vertical:4,horizontal: 10),
//                 //         decoration: BoxDecoration(border:Border.all(width: 1,color:const Color.fromARGB(255, 62, 68, 107), ),borderRadius: BorderRadius.circular(12)),
//                 //         width: double.infinity,
//                 //         //  child: Row(
//                 //         //   mainAxisAlignment: MainAxisAlignment.center,
//                 //         //   crossAxisAlignment: CrossAxisAlignment.center,
//                 //         //    children: [
//                 //         //     const Icon(Icons.location_city, color: Color.fromARGB(255, 62, 68, 107), ),          
//                 //             child:DropdownButton<String>(
//                 //         underline:Container(
                          
//                 //         ),
//                 //         value: benchInput,
//                 //         hint: const Row(mainAxisAlignment: MainAxisAlignment.end,children:[Icon(Icons.location_city),Text('Select Bench',textAlign: TextAlign.center)]),
//                 //         onChanged: (String? newValue) {
//                 //           if (newValue != null) {
//                 //             setState(() {
//                 //                 benchInput = newValue;
//                 //               debugPrint(benchInput);
//                 //             });
//                 //           }
//                 //         },
//                 //         items: const [
//                 //           DropdownMenuItem<String>(
//                 //             value: '1',
//                 //             // child: Text('Principle Seat Jabalpur'),
//                 //             child:Row(children:[Icon(Icons.location_city),Text('Principle Seat Jabalpur'),])
//                 //           ),
//                 //           DropdownMenuItem<String>(
//                 //             value: '2',
//                 //             // child: Text('Bench Indore'),
//                 //             child:Row(children:[Icon(Icons.location_city),Text('Bench Indore'),])
//                 //           ),
//                 //           DropdownMenuItem<String>(
//                 //             value: '3',
//                 //             // child: Text('Bench Gwalior'),
//                 //             child:Row(children:[Icon(Icons.location_city),Text('Bench Gwalior'),])
//                 //           ),
//                 //         ],
//                 //       ),
//                 //         //    ],
//                 //         //  ),
//                 //        ),
    
    
//               ]
//             )
//           )
//         );
//       },
//     );
//   }
// }