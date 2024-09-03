// import 'dart:ui';

// import 'package:flutter/cupertino.dart';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mphc_app/pages/caseStatus/case_status_form.dart';
import 'package:mphc_app/pages/causeList/cause_list_form.dart';
import 'package:mphc_app/pages/caveat/caveat_form.dart';
import 'package:mphc_app/pages/courtFee/court_fee_type.dart';
import 'package:mphc_app/pages/defectsDefaults/defects_defaults_form.dart';
import 'package:mphc_app/pages/displayBoard/display_board_form.dart';
import 'package:mphc_app/pages/freeTextSearch/free_text_search_form.dart';
// import 'package:mphc_app/pages/displayboard/displayboard.dart';
import 'package:mphc_app/pages/home/bloc/home_bloc.dart';
import 'package:mphc_app/pages/judgementOrder/judgement_order_form.dart';
import 'package:mphc_app/pages/qrscanner/qrscanner.dart';
import 'package:mphc_app/pages/virtualCourt/vcOther/vc_other_form.dart';
import 'package:url_launcher/url_launcher_string.dart';

final List<String> imgList = [
  // 'assets/slide_1.jpg'
  'assets/slide/slide_1.jpg',
  'assets/slide/slide_2.jpg',
  'assets/slide/slide_3.jpg',
  'assets/slide/slide_4.jpg',
  'assets/mphc02.jpg',
 ];

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}


class _HomeState extends State<Home> {
bool iSHindi = false;

final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc:homeBloc,
      // listenWhen: (previous, current){null;},
      // buildWhen: (previous,current){null;},

      listener: (context, state) {
        // TODO: implement listener

      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title:Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Expanded( flex:1,child: Image.asset('assets/mphc_logo.png',width: 55 ,height: 40,fit: BoxFit.contain,)),
                Flexible(
                  flex:4,
                  child: Container(
                    margin:const EdgeInsets.fromLTRB(5, 0, 0, 0),
                    // color:const Color.fromARGB(53, 255, 193, 7),
                    width: double.infinity,
                    child: Text(
                      iSHindi?'मध्‍यप्रदेश उच्‍च न्‍यायालय':'High Court of M.P.',
                      style:const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w300,
                        ),
                      textAlign: TextAlign.left,
                      ),
                  ),
                ),
            ]),
            // backgroundColor: Color.fromARGB(255, 39, 64, 137),
            // backgroundColor:  Color.fromARGB(43, 2, 76, 137),
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            foregroundColor: const Color.fromARGB(255, 0, 0, 0),
            actions: [
              // Switch for Changing language
              Transform.scale(
                alignment: Alignment.centerRight,
                scale:0.8,
                child: Switch(
                  activeTrackColor: const Color.fromARGB(210, 254, 76, 22),
                  inactiveTrackColor: Colors.white,
                  activeColor: Colors.black,
                  inactiveThumbColor: const Color.fromARGB(255, 19, 22, 35),
                  value: iSHindi,
                  onChanged:(value){
                    setState(() {
                      iSHindi = value;
                      debugPrint('$value');
                    });
                }),
              ),
              //added bloc event here
              IconButton(onPressed: (){homeBloc.add(HomeNavigateEvent());}, icon:const Icon(Icons.notifications,size:30)),
            ],
          ),
            
          body: Container(
              margin:const EdgeInsets.all(0),
              decoration: const BoxDecoration(

                      // gradient:LinearGradient(
                      //   begin: Alignment.topCenter,
                      //   // end:Alignment.bottomRight,
                      //   end:Alignment.bottomCenter,
                      //   colors: [
                      //     Color.fromARGB(255, 244, 242, 242),
                      //     // Color.fromARGB(43, 2, 76, 137),
                      //     // Color.fromARGB(87, 4, 7, 133),
                      //       Color.fromARGB(255, 246, 242, 242),
                      //       Colors.white,
                      //    ]),

                      image: DecorationImage(
                      image: AssetImage('assets/bg/bg-gradient_2.jpg',),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(Color.fromARGB(181, 255, 255, 255), BlendMode.screen)),
                    ),
            child:SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children:[
                  // const Text("High Cout of Madhya Pradesh"),
                  // Container(
                  //   width: double.infinity,
                  //   height: 150,
                  //   margin:const EdgeInsets.all(12),
                  //   decoration: const BoxDecoration(
                  //       boxShadow:[BoxShadow(
                  //       color: Color.fromARGB(255, 228, 226, 226),
                  //       blurRadius: 10.0,
                  //     ),],
                  //     borderRadius:BorderRadius.all(Radius.circular(8)),
                  //     // gradient:LinearGradient(
                  //     //   begin: Alignment.topCenter,
                  //     //   end:Alignment.bottomRight,
                  //     //   colors: [
                  //     //     Color.fromARGB(176, 164, 193, 217),
                  //     //     Color.fromARGB(87, 4, 7, 133)
                  //     //    ]),
                  //   ),
                  //                                                               //-------------------------------slider------------
                  //  child: CarouselSlider(
                  //             options: CarouselOptions(
                  // height:200,
                  // viewportFraction: 1.0,
                  // enlargeCenterPage: false,
                  // autoPlay: true,
                  //             ),
                  //             items: imgList.map((item) => Container(
                  //  margin:const EdgeInsets.all(12),
                  //  width: double.infinity,
                  //  clipBehavior: Clip.hardEdge,
                  // decoration: const BoxDecoration(
                  //   borderRadius: BorderRadius.all(Radius.circular(8)),
                  //   color:Color.fromARGB(255, 255, 255, 255),
                  // ),
                  // child: Image.asset(item, fit: BoxFit.cover,),
                  //             )).toList(),
                  //           ),
                  //             //--------Image carousel----------
                  // ),
                    
                    
                 
                    
                  Container(
                    width: double.infinity,
                    // margin:const EdgeInsets.all(12),
                       margin:const EdgeInsets.symmetric(horizontal: 12, vertical:5),
                    decoration: const BoxDecoration(
                      borderRadius:BorderRadius.all(Radius.circular(8)),
                      color:Color.fromARGB(255, 255, 255, 255),
                      boxShadow:[BoxShadow(
                        color: Color.fromARGB(255, 228, 226, 226),
                        blurRadius: 10.0,
                      ),]
                    ),
                    child:SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          Row(
                        children: [
                         BoxIcon(icon: Icons.video_call, title:iSHindi?'VC लिंक्‍स':'VC LINKS',navigate:const VCUserForm(),),
                         BoxIcon(icon: Icons.list_alt, title: iSHindi?'वाद सूची':'Cause List',navigate:const CauseListForm(),),
                         BoxIcon(icon: Icons.balance, title: iSHindi?'निर्णय-आदेश':'Judgement\n/Orders',navigate: const JudgementOrderForm(),),
                      ],),
                    
                      Row(children: [
                         BoxIcon(icon: Icons.edit_road_sharp, title:iSHindi?'केवियट': 'Caveat',navigate: const CaveatForm(),),
                         BoxIcon(icon: Icons.settings_suggest_sharp, title: iSHindi?' डिफेट्स / डिफॉल्‍ट्स ':'Defects \nDefaults',navigate:const DefectsDefaultsForm(),),
                          BoxIcon(icon: Icons.book, title: iSHindi?' ई-पेपरबुक':'E-Paperbook',navigate:const Text("test"),),
                        //  BoxIcon(icon: Icons.my_library_books_outlined, title:iSHindi?'माय डायरी': 'My Diary',navigate:Text("test"),),
                      ],),
                      Row(children: [
                         BoxIcon(icon: Icons.manage_search_outlined, title:iSHindi?'फ्री टेक्‍स्‍ट सर्च': 'Free Text \nSearch',navigate: const FreeTSForm(),),
                         BoxIcon(icon: Icons.payments_outlined, title:iSHindi?'ऑनलाइन कोर्ट शुल्‍क': 'Online \nCourt Fee',navigate: const CourtFeeType()),
                         BoxIcon(icon: Icons.temple_buddhist_outlined, title: iSHindi?'जिला न्‍यायालय':'District \nCourt',navigate: Text("test"),),
                      ],),
                      
                        Row(children: [
                         BoxIcon(icon: Icons.groups_2_outlined, title:iSHindi?'रोस्‍टर':'Roaster',navigate: Text("test"),),
                         BoxIcon(icon: Icons.device_hub_outlined, title: iSHindi?'साईटमैप':'Sitemap',navigate: Text("test"),),
                         BoxIcon(icon: Icons.manage_search_outlined, title:iSHindi?'आईएलआर जर्नल':'ILR \nJournal',navigate: Text("test")),
                      ],),

                      Container(
                        margin:const EdgeInsets.symmetric(horizontal: 40, vertical: 2),
                        child: const Divider( thickness:0.5,),
                      ),
                    //  const Row(mainAxisAlignment: MainAxisAlignment.start,children: [ Text("Quick Links", style:TextStyle(fontSize: 16, fontWeight: FontWeight.bold),textAlign: TextAlign.start,)]),
                      
                       Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                     Container(
                              // color:Colors.amber,
                              margin:  const EdgeInsets.fromLTRB(4, 4, 4, 0),
                              padding: const EdgeInsets.only(right: 4),
                         
                              decoration: BoxDecoration(borderRadius:BorderRadius.circular(6),color: Color.fromARGB(255, 255, 191, 0)),
                              child: const Text("  Quick Links",textAlign: TextAlign.start,style:TextStyle(fontWeight: FontWeight.bold))
                              ),]
                       ),
                      
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                         children:[

                                 


                                  Expanded(
                                    child: InkWell(
                                      onTap:(){
                                        launchUrlString('https://mphc.gov.in/judges-roster');
                                      },
                                      child:Container(
                                        margin:const EdgeInsets.all(5),
                                        padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(8)),
                                           color:Color.fromARGB(255, 156, 244, 158),
                                           
                                        ),
                                        child:const Row(
                                          children:[ 
                                            Icon(Icons.public, color: Color.fromARGB(255, 24, 29, 78), size: 18,),
                                            Text("Roaster",style: TextStyle(color:Color.fromARGB(255, 5, 25, 35),fontWeight: FontWeight.w800),)
                                          ]),
                                      )
                                    ),
                                  ),




                                    Expanded(
                                      child: InkWell(
                                      onTap:(){
                                         launchUrlString('https://mphc.gov.in/sitemap');
                                      },
                                      child:Container(
                                        margin:const EdgeInsets.all(5),
                                        padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(8)),
                                           color:Color.fromARGB(255, 156, 244, 158),
                                           
                                        ),
                                        child:const Row(
                                          children:[ 
                                            Icon(Icons.map_outlined, color: Color.fromARGB(255, 24, 29, 78), size: 18,),
                                            Text("Sitemap",style: TextStyle(color:Color.fromARGB(255, 5, 25, 35),fontWeight: FontWeight.w800),)
                                          ]),
                                      )
                                                                        ),
                                    ),

                         ]
                      ),
                        ]
                      ),
                    )
                ),






                    

                ClipRect(
                  child: BackdropFilter(
                    filter:ImageFilter.blur(
                      sigmaX: 2.0,
                      sigmaY: 2.0,
                    ),
                    child:
                    
                    
                     Container(
                          width: double.infinity,
                          height: 100,
                          // margin:const EdgeInsets.all(12),
                          margin:const EdgeInsets.symmetric(horizontal: 12, vertical:5),
                          decoration:  BoxDecoration(
                          //     boxShadow:[BoxShadow(
                          //   color: Color.fromARGB(255, 228, 226, 226),
                          //   blurRadius: 10.0,
                          // ),],
                            borderRadius:const BorderRadius.all(Radius.circular(8)),
                            border:Border.all(width: 0.5,color:Colors.white),
                            color:Color.fromARGB(67, 232, 255, 251),
                          ),  
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:[ 
                              // Container(
                              //   // color:Colors.amber,
                              //   margin:  const EdgeInsets.fromLTRB(4, 4, 4, 0),
                              //   padding: const EdgeInsets.only(right: 4),
                              //   decoration: BoxDecoration(borderRadius:BorderRadius.circular(6),color: const Color.fromARGB(255, 255, 191, 0)),
                              //   child: const Text("  Common Links",textAlign: TextAlign.start,style:TextStyle(fontWeight: FontWeight.bold))
                              //   ),
                              Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children:[
                                BoxIcon(icon: Icons.screenshot_monitor_rounded, title: iSHindi?'ई-डिस्‍प्‍ले बोर्ड':'Display Board',navigate:const DisplayBoardForm(),),
                                BoxIcon(icon: Icons.document_scanner_outlined, title: iSHindi?'प्रकरणों की स्थिति':'Case Status', navigate: const CaseStatusForm(),),
                                BoxIcon(icon: Icons.copy, title:iSHindi?'प्रतिलिपि': 'Copying',navigate: const Text("Copying"),),
                                BoxIcon(icon: Icons.my_library_books_outlined, title:iSHindi?'माय डायरी': 'My Diary',navigate:const  Text("NO Diary"),),
                              ]
                            ),
                           ]),
                      ),
                  ),
                ),












                    Container(
                        width: double.infinity,
                        height: 550,
                        margin:const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          // borderRadius:BorderRadius.all(Radius.circular(8)),
                          borderRadius:BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                          color:Color.fromARGB(255, 255, 255, 255),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(padding:EdgeInsets.all(10),child: Icon(Icons.keyboard_double_arrow_up,color:const Color.fromARGB(255, 33, 33, 33))),

                            Container(
                              width: double.infinity,
                              height: 150,
                              margin:const EdgeInsets.all(12),
                              decoration: const BoxDecoration(
                                borderRadius:BorderRadius.all(Radius.circular(8)),
                                // gradient:LinearGradient(
                                //   begin: Alignment.topCenter,
                                //   end:Alignment.bottomRight,
                                //   colors: [
                                //     Color.fromARGB(176, 164, 193, 217),
                                //     Color.fromARGB(87, 4, 7, 133)
                                //    ]),
                              ),
                                                                                          //-------------------------------slider------------
                             child: CarouselSlider(
                              options: CarouselOptions(
                                height:200,
                                viewportFraction: 1.0,
                                enlargeCenterPage: false,
                                autoPlay: true,
                                            ),
                                            items: imgList.map((item) => Container(
                                 margin:const EdgeInsets.all(12),
                                 width: double.infinity,
                                 clipBehavior: Clip.hardEdge,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                  color:Color.fromARGB(255, 255, 255, 255),
                                ),
                                child: Image.asset(item, fit: BoxFit.cover,),
                                            )).toList(),
                                          ),
                                            //--------Image carousel----------
                              ),


                               Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:[

                                  const Text("Other important links ", style:TextStyle(fontSize: 18, fontWeight: FontWeight.w300),textAlign: TextAlign.start,),


                                  InkWell(
                                    onTap:(){
                                      launchUrlString('https://mphc.gov.in/judges-roster');
                                    },
                                    child:Container(
                                      margin:const EdgeInsets.all(5),
                                      padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(8)),
                                         color:Color.fromARGB(255, 214, 255, 214),
                                         
                                      ),
                                      child:const Row(
                                        children:[ 
                                          Icon(Icons.public, color: Color.fromARGB(255, 24, 29, 78), size: 18,),
                                          Text("Roaster",style: TextStyle(color:Color.fromARGB(255, 5, 25, 35),fontWeight: FontWeight.w800),)
                                        ]),
                                    )
                                  ),




                                    InkWell(
                                    onTap:(){
                                       launchUrlString('https://mphc.gov.in/sitemap');
                                    },
                                    child:Container(
                                      margin:const EdgeInsets.all(5),
                                      padding:const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(8)),
                                         color:Color.fromARGB(255, 229, 255, 229),
                                         
                                      ),
                                      child:const Row(
                                        children:[ 
                                          Icon(Icons.map_outlined, color: Color.fromARGB(255, 24, 29, 78), size: 18,),
                                          Text("Sitemap",style: TextStyle(color:Color.fromARGB(255, 5, 25, 35),fontWeight: FontWeight.w800),)
                                        ]),
                                    )
                                  ),




                         ]
                              )

                            //  Container(
                            //   child:Column(
                            //     children:[
                            //       // Text("")
                            //     ]
                            //   )
                            //  )





















                          ],
                        )
                      ),
                 
                 
                ]
              ),
            )
          ),
            
            
            
            
            
            
            
            
            
            
            
            
            
          bottomNavigationBar: SafeArea(
            child: Container(
              padding: const EdgeInsets.all(18),
              margin: const EdgeInsets.all(10),
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                gradient:LinearGradient(colors: [
                  // Color.fromARGB(255, 33, 79, 243),
                  // Colors.blue,
                  // Color.fromARGB(255, 48, 17, 101),
                  //     Color.fromARGB(255, 224, 230, 235),
                  // Color.fromARGB(255, 191, 191, 191),
                  Color.fromARGB(255, 244, 242, 242),
                  Color.fromARGB(255, 244, 242, 242),
                ])
                // color: Color.fromARGB(255, 18, 36, 224), // Set color to transparent
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                    const Icon(Icons.home,color:Color.fromARGB(255, 29, 44, 105)),
                    const Icon(Icons.calendar_month,color:Color.fromARGB(255, 29, 44, 105)),
                    InkWell(
                      hoverColor: Colors.black12,
                      splashColor: Colors.black12,
                      
                      onTap:(){
                      
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const QrScanner()));
                    },child: const Icon(Icons.qr_code,color:Color.fromARGB(255, 29, 44, 105))),
                    const Icon(Icons.info,color:Color.fromARGB(255, 29, 44, 105)),
                ]
              ),
                    
            ),
          ),
        
        );
      },
    );
  }
}





















// ---------------------------Icons of Home Page ---------------------------------------

class BoxIcon extends StatefulWidget {
  final IconData icon;
  final String title;
  final Widget navigate;
    const BoxIcon({required this.icon, required this.title, required this.navigate,super.key});
  @override
  State<BoxIcon> createState() => _BoxIconState();
}
class _BoxIconState extends State<BoxIcon> {

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap:() =>Navigator.push(context, MaterialPageRoute(builder: (context)=> widget.navigate)),
        child: Container(
                  // margin: const EdgeInsets.all(4),
                  decoration:  const BoxDecoration(
                    
                    // color:const Color.fromARGB(255, 255, 255, 255),
                    // color:Color.fromARGB(255, 255, 255, 255),
                    // gradient:  LinearGradient(
                    //   // transform:GradientRotation(320),
                    //   begin: Alignment.topLeft,
                    //   end: Alignment.bottomCenter,
                    //   colors:[
                    //     Color.fromARGB(47, 182, 197, 251),
                    //     Color.fromARGB(41, 142, 191, 255),
                    //     Color.fromARGB(47, 0, 55, 255),
               
                    //     // Colors.white,
                    //     // Color.fromARGB(255, 160, 166, 255),
                    //   ]
                    // ),
                    // borderRadius: const BorderRadius.all(Radius.circular(8)),
                    // border:Border(left:BorderSide(width: 0.5,color:Color.fromARGB(255, 2, 66, 118))),
                    // border:Border.all(width:0.5,color:Color.fromARGB(255, 44, 46, 172)),
                    
                    ),
                  height: 80,
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Icon(widget.icon, size:30,color:Theme.of(context).colorScheme.primary,),         
                     Icon(widget.icon, size:30,color:const Color.fromARGB(255, 29, 44, 105),),             
                      Text(widget.title,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color:Theme.of(context).colorScheme.primary,),textAlign: TextAlign.center, ),
                    ],
                    )
                  ),
      ),
              );
  }
  // backgroundColor: const Color.fromARGB(255, 16, 55, 124),
}

// Future<void> _launchUrl() async {
//   if (!await launchUrl(url)) {
//     throw Exception('Could not launch $url');
//   }
// }




//  Row(
          //         children: [
          //          BoxIcon(icon: Icons.video_call, title:iSHindi?'VC लिंक्‍स':'VC LINKS',navigate:const VCUserForm(),),
          //          BoxIcon(icon: Icons.screenshot_monitor_rounded, title: iSHindi?'ई-डिस्‍प्‍ले बोर्ड':'Display Board',navigate: DisplayBoardForm(),),
          //          BoxIcon(icon: Icons.balance, title: iSHindi?'निर्णय-आदेश':'Judgement\n/Orders',navigate: JudgementOrderForm(),),
          //       ],),
          //       Row(
          //         children: [
          //           BoxIcon(icon: Icons.document_scanner_outlined, title: iSHindi?'प्रकरणों की स्थिति':'Case Status', navigate: CaseStatusForm(),),
          //           BoxIcon(icon: Icons.list_alt, title: iSHindi?'वाद सूची':'Cause List',navigate:CauseListForm(),),
          //           BoxIcon(icon: Icons.copy, title:iSHindi?'प्रतिलिपि': 'Copying',navigate: CopyingForm(),),
          //       ],),
          //       Row(children: [
          //          BoxIcon(icon: Icons.edit_road_sharp, title:iSHindi?'केवियट': 'Caveat',navigate: CaveatForm(),),
          //          BoxIcon(icon: Icons.settings_suggest_sharp, title: iSHindi?' डिफेट्स / डिफॉल्‍ट्स ':'Defects \nDefaults',navigate:DefectsDefaultsForm(),),
          //          BoxIcon(icon: Icons.my_library_books_outlined, title:iSHindi?'माय डायरी': 'My Diary',navigate: MyDiaryTab(),),
          //       ],),
          //       Row(children: [
          //          BoxIcon(icon: Icons.manage_search_outlined, title:iSHindi?'फ्री टेक्‍स्‍ट सर्च': 'Free Text \nSearch',navigate: FreeTSForm(),),
          //          BoxIcon(icon: Icons.payments_outlined, title:iSHindi?'ऑनलाइन कोर्ट शुल्‍क': 'Online \nCourt Fee',navigate: CourtFeeType()),
          //          BoxIcon(icon: Icons.temple_buddhist_outlined, title: iSHindi?'जिला न्‍यायालय':'District \nCourt',navigate: CaseStatusForm(),),
          //       ],),
