import 'package:flutter/material.dart';
import 'api.dart';
import '../case_status.dart';
// import 'package:flutter/src/gestures/tap.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:html/parser.dart';
// import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class Appearance extends StatefulWidget {
  const Appearance({super.key});

  @override
  State<Appearance> createState() => _AppearanceState();
}

class _AppearanceState extends State<Appearance> {




  



@override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // title: Text('FutureBuilder Example'),
      // ),
      body: FutureBuilder(
          future: api.getAppearance(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (appearanceData == null) {
              return const Center(child: Text('No Record Found'));
            } else {

              return Container(
                  child: ListView.builder(
                      itemCount: appearanceData!.length,
                      itemBuilder: (context, index) {
                        return Container(
                            margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 240, 240, 246),
                                borderRadius: BorderRadius.circular(10)),
                            // color:Colors.white70,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text(appearanceData!.toString()),

                                  FmText(isbold:true,title: 'Serial NO. :',      response: appearanceData![index]['SrNo'].toString()),
                                  FmText(isbold:true,title: 'Name of Accused:', response: appearanceData![index]['Accused'].toString()),
                                  FmText(isbold:true,title: 'Appearance Date :',  response: appearanceData![index]['Appearance_Date'].toString()),
                                  FmText(isbold:true,title: 'Name of Main Advocate :',   response: appearanceData![index]['Main_Advocate'].toString()),
                                  FmText(isbold:true,title: 'Whether Appeared (Next Date):',  response: appearanceData![index]['Whether_Appeared_Next_Date'].toString()),
                                  // FmText(leftWidth:0, isbold: true, title:'PDF :' ,response: appearanceData![index]['PDF'].toString(),),
                                  // TextButton(
                                  //   onPressed: () async {
                                  //        var uri = Uri.parse(appearanceData![index]['PDF'].toString());
                                  //         if (await canLaunchUrl(uri)){
                                  //             await launchUrl(uri);
                                  //         } else {
                                  //             // can't launch url
                                  //         }
                                  //     },
                                  //     child:const Text('Open PDF'),
                                  //   ),
                                    // HtmlWidget("<a href='${appearanceData![index]['PDF']}'>PDF</a>"),
                                    
                                  
                                  

                                  //  RichText(
                                  //         text: LinkTextSpan(
                                  //             url: 'http://docs.google.com/viewer?url=http://www.pdf995.com/samples/pdf.pdf',
                                  //             text: 'Show My Pdf'),
                                  //       ),
                                  // GestureDetector(
                                  //    url ?=  appearanceData![index]['PDF'].toString();
                                  //   onTap:(url)     {
                                  //     debugPrint(url)
                                  //   }                              
                                  //   child: Text('Open PDF')
                                  //   ),
                                  


                                ]));
                      }));
             



  }
          }
      ),
  );
  
 

  }



}



