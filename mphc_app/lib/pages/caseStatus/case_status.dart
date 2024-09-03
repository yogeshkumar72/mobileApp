import 'package:flutter/material.dart';
// import 'package:mphc/pages/caseStatus/caseDetails/adjustments.dart';
import 'package:mphc_app/pages/caseStatus/caseDetails/adjustments_tabulor.dart';
// import 'package:http/http.dart' as http;
import 'package:mphc_app/pages/caseStatus/caseDetails/api.dart';
// import 'package:mphc/pages/caseStatus/caseDetails/appearance.dart';
import 'package:mphc_app/pages/caseStatus/caseDetails/appearance_tabulor.dart';
// import 'package:mphc/pages/caseStatus/caseDetails/connected.dart';
import 'package:mphc_app/pages/caseStatus/caseDetails/connected_tabulor.dart';
import 'package:mphc_app/pages/caseStatus/caseDetails/defaults.dart';
// import 'package:mphc/pages/caseStatus/caseDetails/defaults.dart';
// import 'dart:convert';
import 'package:mphc_app/pages/caseStatus/caseDetails/details.dart';
// import 'package:mphc/pages/caseStatus/caseDetails/document.dart';
import 'package:mphc_app/pages/caseStatus/caseDetails/documents_tabulor.dart';
import 'package:mphc_app/pages/caseStatus/caseDetails/drop_note.dart';
// import 'package:mphc/pages/caseStatus/caseDetails/ia.dart';2
import 'package:mphc_app/pages/caseStatus/caseDetails/ia_tabulor.dart';
import 'package:mphc_app/pages/caseStatus/caseDetails/judgement.dart';
// import 'package:mphc/pages/caseStatus/caseDetails/listing.dart';
import 'package:mphc_app/pages/caseStatus/caseDetails/listing_tabulor.dart';
import 'package:mphc_app/pages/caseStatus/caseDetails/mention_memo.dart';
import 'package:mphc_app/pages/caseStatus/caseDetails/notice_tab.dart';
// import 'package:mphc/pages/caseStatus/caseDetails/notices.dart';
import 'package:mphc_app/pages/caseStatus/caseDetails/paper_book.dart';
import 'package:mphc_app/pages/caseStatus/caseDetails/restoration.dart';
import 'caseDetails/earlier_court.dart';



APICall api = APICall();

//--------------------Details--------------
// String ? caseResponse;
// Map? caseResult;
// List? caseData;
// bool ? available;


class CaseStatus extends StatefulWidget {

  final String ? establishment;
  final String ? caseType;
  final String ? year;
  final String ? caseNumber;

  const CaseStatus({
    required this.establishment,
    required this.caseType,
    required this.year,
    required this.caseNumber,
    super.key});

  @override
  State<CaseStatus> createState() => _CaseStatusState();
}

class _CaseStatusState extends State<CaseStatus> {

 
    // ------------------------------Details---------------------------------------
    // Future caseDetails() async{
    // http.Response casedetails;
    // try{
    //     casedetails = await http.post(Uri.parse('http://ns2.mphc.in/new_mobile_app_api/pet_res_name.php'),
    //     body:{
    //     // 'bench':'01',
    //     // 'case_type':'11',
    //     // 'case_no':'222',
    //     // 'case_year':'2016',
    //     'bench':widget.establishment,
    //     'case_type':widget.caseType,
    //     'case_no':widget.caseNumber,
    //     'case_year':widget.year,
    //   }
    //   );
    //   if(casedetails.statusCode==200){
    //       caseResponse = casedetails.body;
    //       caseResult  = json.decode(casedetails.body);
    //       available = caseResult?['success'];
    //       debugPrint('-------------------Details API Called-------------------------');
    //       caseData = caseResult?['results'];
    //       debugPrint(caseData.toString());
    //   }
    //   }
    // catch(e){
    //   debugPrint('$e');
    //   }
    // }
    @override
  void initState() {
    // caseDetails();
    api.apiCallAgain();
    // caseDetails();
    debugPrint(caseData.toString());

    establishInput = widget.establishment;
    caseTypeInput = widget.caseType;
    yearInput = widget.year;
    caseNumberInput = widget.caseNumber;


    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

   return MaterialApp(
     debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 16,
        child: Scaffold(
          appBar: AppBar(
            // foregroundColor: Colors.white,
            // backgroundColor: Color.fromARGB(255, 181, 181, 236),
            flexibleSpace: Container(
              decoration: const BoxDecoration(gradient:LinearGradient(colors: [
                Color.fromARGB(174, 172, 192, 220),
                Color.fromARGB(221, 255, 255, 255),
              ])),
            ),
            bottom: const TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: 'Details',),
                Tab(text:'Earlier Court'),
                Tab(text:'Connected'),
                Tab(text:'Listing'),
                Tab(text:'I.A.'),
                Tab(text:'Documents'),
                Tab(text:'Notices'),
                Tab(text:'Defaults'),
                Tab(text:'Judgement/Orders'),
                Tab(text:'Adjustments'),
                Tab(text:'Mention Memo'),
                Tab(text:'Restoration'),
                Tab(text:'DropNote'),
                Tab(text:'Appearance'),
                Tab(text:'Paper Book'),
                Tab(text:'Certified copying'),
              ],
            ),
            title: const Text('Case Status'),
            centerTitle: true,
          ),
          body: const TabBarView(
            children: [
              Details(),
              EarlierCourt(),
              // Connected(),
              ConnectedTab(),
              // Listing(),
              ListingTab(),
              // IA(),
              IATab(),
              DocumentsTab(),
              // Notices(),
              NoticesTab(),
              Defaults(),
              Judgement(),
              // Adjustments(),
              AdjustmentsTab(),
              MentionMemo(),
              Restoration(),
              DropNote(),
              // Appearance(),
              AppearanceTab(),
              PaperBook(),
              Icon(Icons.balance),
            ],
          ),
        ),
      ),
    );
  
  }
}