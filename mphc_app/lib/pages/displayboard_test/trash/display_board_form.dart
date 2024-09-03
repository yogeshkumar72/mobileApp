// import 'package:flutter/material.dart';
// // import 'package:mphc/pages/displayBoard/display_board.dart';
// // import 'package:mphc/pages/home.dart';


// class DisplayBoardForm extends StatefulWidget {
//   const DisplayBoardForm({super.key});

//   @override
//   State<DisplayBoardForm> createState() => _DisplayBoardFormState();
// }

// class _DisplayBoardFormState extends State<DisplayBoardForm> {

//   // String ? benchInput;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(onPressed: (){
//               Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
//             }, icon: const Icon(Icons.arrow_back)),

//         backgroundColor: const Color.fromARGB(255, 194, 213, 228),
//         centerTitle: true,
//         title: const Text('Display Board'),
//       ),
//       body: Container(
//         padding:const EdgeInsets.all(40),

//           decoration:const BoxDecoration(
//         color:Colors.white,
//         image: DecorationImage(
//         image:AssetImage('images/mphc02.jpg'),fit:BoxFit.contain,
//         alignment: Alignment.bottomCenter,
//         opacity: 1,        
//          colorFilter: ColorFilter.mode(Color.fromARGB(255, 2, 21, 71), BlendMode.screen),
//           ),
//          ),

//         child:Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 100,
//             ),

//             const Row(
//                     children: [
//                       Text('  Select Establishment',style: TextStyle(color:const Color.fromARGB(255, 62, 68, 107),fontWeight: FontWeight.bold),textAlign: TextAlign.start,),
//                     ],
//                   ),
//                    Container(

//                     padding:const EdgeInsets.symmetric(vertical:4,horizontal: 10),
//                     decoration: BoxDecoration(border:Border.all(width: 1,color:const Color.fromARGB(255, 62, 68, 107), ),borderRadius: BorderRadius.circular(18)),
//                      child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: [
//                         const Icon(Icons.location_city,color:const Color.fromARGB(255, 62, 68, 107), ),
//                         //  DropdownButton<String>(
//                         //       underline: Container(),
//                         //       value: benchInput,
//                         //       hint: const Text('Select Bench'),
//                         //      onChanged: (String? newValue) {
//                         //        if (newValue != null) {
//                         //          setState(() {
//                         //              benchInput = newValue;
//                         //            debugPrint(benchInput);
//                         //          });
//                         //        }
//                         //      },
//                         //       items: const [
//                         //         DropdownMenuItem<String>(
//                         //           value: '01',
//                         //           child: Text('Principle Seat Jabalpur'),
//                         //         ),
//                         //         DropdownMenuItem<String>(
//                         //           value: '02',
//                         //           child: Text('Bench Indore'),
//                         //         ),
//                         //         DropdownMenuItem<String>(
//                         //           value: '03',
//                         //           child: Text('Bench Gwalior'),
//                         //         ),
//                         //       ],
//                         //     ),
//                         DropdownButton<String>(
//                     underline: Container(),
//                     value: benchInput,
//                     hint: const Text('Select Bench'),
//                     onChanged: (String? newValue) {
//                       if (newValue != null) {
//                         setState(() {
//                             benchInput = newValue;
//                           debugPrint(benchInput);
//                         });
//                       }
//                     },
//                     items: const [
//                       DropdownMenuItem<String>(
//                         value: '1',
//                         child: Text('Principle Seat Jabalpur           '),
//                       ),
//                       DropdownMenuItem<String>(
//                         value: '2',
//                         child: Text('Bench Indore      '),
//                       ),
//                       DropdownMenuItem<String>(
//                         value: '3',
//                         child: Text('Bench Gwalior         '),
//                       ),
//                     ],
//                   ),
//                        ],
//                      ),
//                    ),
//                    SizedBox(height: 40,),
            
            
//             //  Container(
//             //   // width: double.infinity,
//             //   margin: const EdgeInsets.fromLTRB(40, 80, 40, 20),
//             //   padding: const EdgeInsets.symmetric(horizontal: 20),
              
//             //   decoration: BoxDecoration(border:Border.all(width: 0.2),borderRadius: BorderRadius.circular(8)),
//             //   child: Row(
//             //     mainAxisAlignment: MainAxisAlignment.end,
//             //     children: [
//             //       DropdownButton<String>(
//             //         underline: Container(),
//             //         value: benchInput,
//             //         hint: const Text('Select Bench'),
//             //         onChanged: (String? newValue) {
//             //           if (newValue != null) {
//             //             setState(() {
//             //                 benchInput = newValue;
//             //               debugPrint(benchInput);
//             //             });
//             //           }
//             //         },
//             //         items: const [
//             //           DropdownMenuItem<String>(
//             //             value: '1',
//             //             child: Text('Principle Seat Jabalpur'),
//             //           ),
//             //           DropdownMenuItem<String>(
//             //             value: '2',
//             //             child: Text('Bench Indore'),
//             //           ),
//             //           DropdownMenuItem<String>(
//             //             value: '3',
//             //             child: Text('Bench Gwalior'),
//             //           ),
//             //         ],
//             //       ),
//             //     ],
//             //   ),
//             // ),

//             InkWell(
//               onTap: (){
//                 if(benchInput!=null){
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>const DisplayBoard()));
//                 }
//                 else{
//                   showDialog(context: context, builder: (BuildContext context){
//                                   return AlertDialog(
//                                     shape:const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
//                                     title:const Text('Error '),
//                                     content:SingleChildScrollView(
//                                       child: Container(

//                                         height: 200,
//                                         child:const Column(
//                                           children: [
                                             
//                                             Text(
//                                               'Bench is Not Selected'
//                                             ),
                  
                                        
                                            
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                   );
//                                 // });

//                                 });
//                 }
//               },
//               child:Container(
//                 // color:Colors.blue.shade100,
//                 // padding: EdgeInsets.fromLTRB(100, 10, 100, 10),
//                 padding:const EdgeInsets.symmetric(horizontal:50, vertical:15),
//                 decoration: BoxDecoration(color: const Color.fromARGB(255, 68, 74, 108),borderRadius: BorderRadius.circular(8)),
//                 child:const Text('Submit',style: TextStyle(color: Colors.white),)
//               )
//             )



            
//           ],
//         )
//       ),
//     );
//   }
// }