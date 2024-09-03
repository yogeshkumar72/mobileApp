import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ------***---------API Input-----------------
String ? establishInput;
String ? caseTypeInput;
String ? yearInput;
String ? caseNumberInput;

//-----------Details ===--------
String ? caseResponse;
Map ?    caseResult;
List ?   caseData;
bool ?   available;

//-------------------Earlier Court------
String ? earlierCourtResponse;
Map ?    earlierCourtResult;
List ?   earlierCourtData;
bool ?   earlierCourtAvailable;

// ------------------connected------------------------
String ? connectedResponse;
Map ?    connectedResult;
List ?   connectedData;
bool ?   connnectedAvailable;

//--------------------Listing------------------------------
String ? listingResponse;
Map ?    listingResult;
List ?   listingData;
bool ?   listingAvailable;

//-------------------- IA------------------------------
String ? iAResponse;
Map ?    iAResult;
List ?   iAData;
bool ?   iAAvailable;

//--------------- ----Documents------------------------------
String ? documentsResponse;
Map ?    documentsResult;
List ?   documentsData;
bool ?   documentsAvailable;

//-------------------Notices------------------------------
String ? noticesResponse;
Map ?    noticesResult;
List ?   noticesData;
bool ?   noticesAvailable;

//------------------Defaults-------------------
String ? defaultsResponse;
Map ?    defaultsResult;
List ?   defaultsData;
bool ?   defaultsAvailable;

//------------------Judgement/orders-------------------
String ? judgementResponse;
Map ?    judgementResult;
List ?   judgementData;
bool ?   judgementAvailable;

//-------------------Restoraion------------------------------
String ? restorationResponse;
Map ?    restorationResult;
List ?   restorationData;
bool ?   restorationAvailable;

//-------------------DropNote------------------------------
String ? dropnoteResponse;
Map ?    dropnoteResult;
List ?   dropnoteData;
bool ?   dropnoteAvailable;

//-------------------Paper Book------------------------------
String ? paperbookResponse;
Map ?    paperbookResult;
List ?   paperbookData;
bool ?   paperbookAvailable;

//-------------------Adjustments------------------------------
String ? adjustmentsResponse;
Map ?    adjustmentsResult;
List ?   adjustmentsData;
bool ?   adjustmentsAvailable;

//-------------------Mention Memo------------------------------
String ? mentionResponse;
Map ?    mentionResult;
List ?   mentionData;
bool ?   mentionAvailable;

//-------------------Appearance------------------------------
String ? appearanceResponse;
Map ?    appearanceResult;
List ?   appearanceData;
bool ?   appearanceAvailable;



// bool ? call = true;
  
  class APICall {
   bool details= true;
   bool noticesCalled = true; 
   bool earlierCourtCalled = true;
   bool connectedCalled = true;
   bool listingCalled = true;
   bool iACalled = true;
   bool documentsCalled = true;
   bool defalutsCalled = true;
   bool restorationCalled =true;
   bool dropNoteCalled = true;
   bool paperBookCalled =true;
   bool judgementCalled = true;
   bool adjustmentsCalled = true;
   bool mentionCalled = true;
   bool appearanceCalled = true;


// ------------------------------------------------

apiCallAgain(){

//-----------Details ===--------
caseResponse=null;
caseResult=null;
caseData=null;
available=null;
  
//-------------------Earlier Court------
earlierCourtResponse = null;
earlierCourtResult=null;
earlierCourtData=null;
earlierCourtAvailable=null;

// ------------------connected------------------------
connectedResponse=null;
connectedResult=null;
connectedData=null;
connnectedAvailable=null;

//--------------------Listing------------------------------
listingResponse=null;
listingResult=null;
listingData=null;
listingAvailable=null;

//-------------------- IA------------------------------
iAResponse=null;
iAResult=null;
iAData=null;
iAAvailable=null;

//--------------- ----Documents------------------------------
documentsResponse=null;
documentsResult=null;
documentsData=null;
documentsAvailable=null;

//-------------------Notices------------------------------
noticesResponse=null;
noticesResult=null;
noticesData=null;
noticesAvailable=null;

// -------------------Defaults------------------------------
defaultsResponse=null;
defaultsResult=null;
defaultsData=null;
defaultsAvailable=null;

// -------------------Restoration------------------------------
restorationResponse=null;
restorationResult=null;
restorationData=null;
restorationAvailable=null;

// -------------------Drop Note------------------------------
dropnoteResponse=null;
dropnoteResult=null;
dropnoteData=null;
dropnoteAvailable=null;

// -------------------Paper Book------------------------------
paperbookResponse=null;
paperbookResult=null;
paperbookData=null;
paperbookAvailable=null;

//------------------Judgement/orders-------------------
judgementResponse=null;
judgementResult=null;
judgementData=null;
judgementAvailable=null;

//------------------Adjustments-------------------
adjustmentsResponse=null;
adjustmentsResult=null;
adjustmentsData=null;
adjustmentsAvailable=null;

//------------------Mention Memo-------------------
mentionResponse=null;
mentionResult=null;
mentionData=null;
mentionAvailable=null;

//--------------------Appearance-------------------
appearanceResponse=null;
appearanceResult=null;
appearanceData=null;
appearanceAvailable=null;


   noticesCalled = true; 
   earlierCourtCalled = true;
   connectedCalled = true;
   listingCalled = true;
   iACalled = true;
   documentsCalled = true;
   defalutsCalled = true;
   restorationCalled =true;
   paperBookCalled =true;
   dropNoteCalled =true;
   judgementCalled = true;
   adjustmentsCalled = true;
   mentionCalled = true;
   appearanceCalled = true;
   

  }

//--------------------------Details-------------------------------------

  Future caseDetails() async{
    //  if(details == true){
    http.Response casedetails;
    try{
        casedetails = await http.post(Uri.parse('http://ns2.mphc.in/new_mobile_app_api/pet_res_name.php'),
        body:{
        // 'bench':'01',
        // 'case_type':'11',
        // 'case_no':'222',
        // 'case_year':'2016',
        'bench':establishInput,
        'case_type':caseTypeInput,
        'case_no':caseNumberInput,
        'case_year':yearInput,
      }
      );
      
      if(casedetails.statusCode==200){
          caseResponse = casedetails.body;
          caseResult  = json.decode(casedetails.body);
          available = caseResult?['success'];
          debugPrint('-------------------Details API Called-------------------------');
          caseData = caseResult?['results'];
          debugPrint(caseData.toString());
      }
      }
    catch(e){
      debugPrint('$e');
      }
    //  }
    //  details = false;

    }

// -----------------------------------EarlierCourt--------------------------------------------------
Future getEarlierCourt() async{
  if(earlierCourtCalled == true){
    http.Response earlierCourt;
    try{
        earlierCourt= await http.post(Uri.parse('http://ns2.mphc.in/new_mobile_app_api/earlier_Court.php'),
        body:{
        // 'bench':'01',
        // 'case_type':'11',
        // 'case_no':'222',
        // 'case_year':'2016',
      'bench':establishInput,
        'case_type':caseTypeInput,
        'case_no':caseNumberInput,
        'case_year':yearInput,
      }
      );
      if(earlierCourt.statusCode==200){
        // setState(() {
          earlierCourtResponse = earlierCourt.body;
          earlierCourtResult  = json.decode(earlierCourt.body);
          
          earlierCourtAvailable = earlierCourtResult?['success'];
          // debugPrint('${caseResult?[0][0]} ');
          debugPrint('-------------------Earlier Court API Called-------------------------');
          // debugPrint('\n\n\n\n\n\n\n\n\n\n ------------- earlier  Court API Called ----------------- \n\n\n\n\n\n\n\n\n\n\n');
          // debugPrint(earlierCourtResult?['results'].toString());
          earlierCourtData = earlierCourtResult?['results'];
          // debugPrint(caseData.toString());
        // });
      }
      }
    catch(e){
      debugPrint('$e');
      }
  }
  earlierCourtCalled = false;
    }
    // -------------------------------------Connected------------------------------------------------
    Future getConnected() async{
      if(connectedCalled == true){
    http.Response connected;
    try{
        connected= await http.post(Uri.parse('http://ns2.mphc.in/new_mobile_app_api/connected.php'),
        body:{
        // 'bench':'01',
        // 'case_type':'11',
        // 'case_no':'222',
        // 'case_year':'2016',
       'bench':establishInput,
        'case_type':caseTypeInput,
        'case_no':caseNumberInput,
        'case_year':yearInput,
      }
      );
      if(connected.statusCode==200){
        // setState(() {
          connectedResponse = connected.body;
          connectedResult  = json.decode(connected.body);
          
          connnectedAvailable = earlierCourtResult?['success'];
          // debugPrint('${caseResult?[0][0]} ');
          debugPrint('-------------------Connected Called-------------------------');
          // debugPrint('\n\n\n\n\n\n\n\n\n\n ------------- earlier  Court API Called ----------------- \n\n\n\n\n\n\n\n\n\n\n');
          // debugPrint(connectedResult?['results'].toString());
          connectedData = connectedResult?['results'];
          // debugPrint(connectedData.toString());
        // });
      }
      }
    catch(e){
      debugPrint('$e');
      }
    }
    connectedCalled = false;
    }
    // -----------------------------Listing-----------------------------------------------------------------
     Future getListing() async{
      if(listingCalled == true){
    http.Response listing;
    try{
        listing = await http.post(Uri.parse('http://ns2.mphc.in/new_mobile_app_api/listing.php'),
        body:{
        // 'bench':'01',
        // 'case_type':'11',
        // 'case_no':'222',
        // 'case_year':'2016',
      'bench':establishInput,
        'case_type':caseTypeInput,
        'case_no':caseNumberInput,
        'case_year':yearInput,
      }
      );
      if(listing.statusCode==200){
        // setState(() {
          listingResponse = listing.body;
          listingResult  = json.decode(listing.body);
          
          listingAvailable = listingResult?['success'];
          // debugPrint('${caseResult?[0][0]} ');
          debugPrint('-------------------Listing API Called-------------------------');
          // debugPrint('\n\n\n\n\n\n\n\n\n\n ------------- earlier  Court API Called ----------------- \n\n\n\n\n\n\n\n\n\n\n');
          // debugPrint(listingResult?['results'].toString());
          listingData = listingResult?['results'];
          // debugPrint(listingData.toString());
        // });
      }
      }
    catch(e){
      debugPrint('$e');
      }
      }
      listingCalled = false;
    }
    //------------------------------------------IA----------------------------------------------------
    Future getIA() async{
      if(iACalled == true){
    http.Response iA;
    try{
        iA = await http.post(Uri.parse('http://ns2.mphc.in/new_mobile_app_api/ia.php'),
        body:{
        // 'bench':'01',
        // 'case_type':'11',
        // 'case_no':'222',
        // 'case_year':'2016',
     'bench':establishInput,
        'case_type':caseTypeInput,
        'case_no':caseNumberInput,
        'case_year':yearInput,
      }
      );
      if(iA.statusCode==200){
        // setState(() {
          iAResponse = iA.body;
          iAResult  = json.decode(iA.body);
          
          iAAvailable = iAResult?['success'];
          // debugPrint('${caseResult?[0][0]} ');
          debugPrint('-------------------I.A. API Called-------------------------');
          // debugPrint('\n\n\n\n\n\n\n\n\n\n ------------- IA API Called ----------------- \n\n\n\n\n\n\n\n\n\n\n');
          // debugPrint(iAResult?['results'].toString());
          iAData = iAResult?['results'];
          // debugPrint(caseData.toString());
        // });
      }
      }
    catch(e){
      debugPrint('$e');
      }
      }
      iACalled =false;
    }    
    //--------------------------------------------------------Documetns---------------------------------------------
    Future getDocuments() async{
      if(documentsCalled == true){
    http.Response documents;
    try{
        documents= await http.post(Uri.parse('http://ns2.mphc.in/new_mobile_app_api/documents.php'),
        body:{
        // 'bench':'01',
        // 'case_type':'11',
        // 'case_no':'222',
        // 'case_year':'2016',
        'bench':establishInput,
        'case_type':caseTypeInput,
        'case_no':caseNumberInput,
        'case_year':yearInput,
      }
      );
      if(documents.statusCode==200){
        // setState(() {
          documentsResponse = documents.body;
          documentsResult  = json.decode(documents.body);
          documentsAvailable = documentsResult?['success'];
          // debugPrint('${caseResult?[0][0]} ');
          debugPrint('-------------------I.A. API Called-------------------------');
          // debugPrint('\n\n\n\n\n\n\n\n\n\n ------------- Documents API Called ----------------- \n\n\n\n\n\n\n\n\n\n\n');
          // debugPrint(documentsResult?['results'].toString());
          documentsData = documentsResult?['results'];
          // debugPrint(documentsData.toString());
        // });
      }
      }
    catch(e){
      debugPrint('$e');
      }
      }
      documentsCalled = false;
    } 

    // ---------------------------------------------------Notices---------------------------------------------

   Future getNotices() async{
   if(noticesCalled == true){
    http.Response notices;
    try{
        notices = await http.post(Uri.parse('http://ns2.mphc.in/new_mobile_app_api/notices.php'),
        body:{
        // 'bench':'01',
        // 'case_type':'11',
        // 'case_no':'222',
        // 'case_year':'2016',
        'bench':establishInput,
        'case_type':caseTypeInput,
        'case_no':caseNumberInput,
        'case_year':yearInput,
      }
      );
      if(notices.statusCode==200){
        // setState(() {
          noticesResponse = notices.body;
          noticesResult  = json.decode(notices.body);
          noticesAvailable = noticesResult?['success'];
          // debugPrint('${caseResult?[0][0]} ');
          debugPrint('-------------------NOtices API Called from API.dart-------------------------');
          // debugPrint(documentsResult?['results'].toString());
          noticesData = noticesResult?['results'];
          // debugPrint(noticesData.toString());
        // });
      }
      }
    catch(e){
      debugPrint('$e');
      }
    }
    noticesCalled = false;
  } 
     // ---------------------------------------------------Restoration---------------------------------------------

   Future getRestoration() async{
   if(restorationCalled == true){
    http.Response restoration;
    try{
        restoration = await http.post(Uri.parse('http://ns2.mphc.in/new_mobile_app_api/restoration.php'),
        body:{
        // 'bench':'01',
        // 'case_type':'11',
        // 'case_no':'222',
        // 'case_year':'2016',
        'bench':establishInput,
        'case_type':caseTypeInput,
        'case_no':caseNumberInput,
        'case_year':yearInput
      }
      );
      if(restoration.statusCode==200){
        // setState(() {
          restorationResponse = restoration.body;
          restorationResult  = json.decode(restoration.body);
          restorationAvailable = restorationResult?['success'];
          // debugPrint('${caseResult?[0][0]} ');
          debugPrint('-------------------Restoration Api Called-------------------------');
          // debugPrint(documentsResult?['results'].toString());
          restorationData = restorationResult?['results'];
          // debugPrint(restorationData.toString());

        // });
      }
      }
    catch(e){
      debugPrint('$e');
      }
    }
    restorationCalled = false;
  } 

       // ---------------------------------------------Drop Note-------------------------------------------------

   Future getDropNote() async{
   if(dropNoteCalled == true){
    http.Response dropnote;
    try{
        dropnote = await http.post(Uri.parse('http://ns2.mphc.in/new_mobile_app_api/dropNote.php'),
        body:{
        // 'bench':'01',
        // 'case_type':'11',
        // 'case_no':'222',
        // 'case_year':'2016',
        'bench':establishInput,
        'case_type':caseTypeInput,
        'case_no':caseNumberInput,
        'case_year':yearInput
      }
      );
      if(dropnote.statusCode==200){
        // setState(() {
          dropnoteResponse = dropnote.body;
          dropnoteResult  = json.decode(dropnote.body);
          dropnoteAvailable = restorationResult?['success'];
          // debugPrint('${caseResult?[0][0]} ');
          debugPrint('-------------------drop Note Api Called------------------------');
          // debugPrint(documentsResult?['results'].toString());
          dropnoteData = dropnoteResult?['results'];
          // debugPrint(dropnoteData.toString());

        // });
      }
      }
    catch(e){
      debugPrint('$e');
      }
    }
    dropNoteCalled = false;
  }
    
         // -------------------------------------------------Paper Book---------------------------------------------

   Future getPaperBook() async{
   if(paperBookCalled == true){
    http.Response paperbook;
    try{
        paperbook = await http.post(Uri.parse('http://ns2.mphc.in/new_mobile_app_api/paper_Book.php'),
        body:{
        // 'bench':'01',
        // 'case_type':'11',
        // 'case_no':'222',
        // 'case_year':'2016',
        'bench':establishInput,
        'case_type':caseTypeInput,
        'case_no':caseNumberInput,
        'case_year':yearInput
      }
      );
      if(paperbook.statusCode==200){
        // setState(() {
          paperbookResponse = paperbook.body;
          paperbookResult  = json.decode(paperbook.body);
          paperbookAvailable = paperbookResult?['success'];
          // debugPrint('${caseResult?[0][0]} ');
          debugPrint('-------------------Paper Book api called-------------------------');
          // debugPrint(documentsResult?['results'].toString());
          paperbookData = paperbookResult?['results'];
          // debugPrint(paperbookData.toString());

        // });
      }
      }
    catch(e){
      debugPrint('$e');
      }
    }
    paperBookCalled = false;
  }

   // ----------------------------------------------Defaults---------------------------------------------

   Future getDefaults() async{
   if(defalutsCalled == true){
    http.Response dflt;
    try{
        dflt = await http.post(Uri.parse('http://ns2.mphc.in/api/defaults.php'),
        body:{
        // 'bench':'01',
        // 'case_type':'11',
        // 'case_no':'222',
        // 'case_year':'2016',
        'bench':establishInput,
        'case_type':caseTypeInput,
        'case_no':caseNumberInput,
        'case_year':yearInput
      }
      );
      if(dflt.statusCode==200){
        // setState(() {
          defaultsResponse = dflt.body;
          defaultsResult  = json.decode(dflt.body);
          defaultsAvailable = defaultsResult?['success'];
          // debugPrint('${caseResult?[0][0]} ');
          debugPrint('-------------------Defaults api called-------------------------');
          // debugPrint(documentsResult?['results'].toString());
          defaultsData = defaultsResult?['results'];
          // debugPrint(defaultsData.toString());

        // });
      }
      }
    catch(e){
      debugPrint('$e');
      }
    }
    defalutsCalled = false;
  }

// ---------------------------------------------Judgement---------------------------------------------

   Future getJudgement() async{
   if(judgementCalled == true){
    http.Response jjmt;
    try{
        jjmt = await http.post(Uri.parse('http://ns2.mphc.in/api/judgementOrders.php'),
        body:{
        // 'bench':'01',
        // 'case_type':'11',
        // 'case_no':'222',
        // 'case_year':'2016',
        'bench':establishInput,
        'case_type':caseTypeInput,
        'case_no':caseNumberInput,
        'case_year':yearInput
      }
      );
      if(jjmt.statusCode==200){
        // setState(() {
          judgementResponse = jjmt.body;
          judgementResult  = json.decode(jjmt.body);
          judgementAvailable = judgementResult?['success'];
          // debugPrint('${caseResult?[0][0]} ');
          debugPrint('-------------------Judgements api called-------------------------');
          // debugPrint(documentsResult?['results'].toString());
          judgementData = judgementResult?['results'];
          // debugPrint(judgementData.toString());

        // });
      }
      }
    catch(e){
      debugPrint('$e');
      }
    }
    judgementCalled = false;
  }



// ---------------------------------------------adjustments---------------------------------------------

   Future getAdjustments() async{
   if(adjustmentsCalled == true){
    http.Response adj;
    try{
        adj = await http.post(Uri.parse('http://ns2.mphc.in/api/adjustments.php'),
        body:{
        // 'bench':'01',
        // 'case_type':'11',
        // 'case_no':'222',
        // 'case_year':'2016',
        'bench':establishInput,
        'case_type':caseTypeInput,
        'case_no':caseNumberInput,
        'case_year':yearInput
      }
      );
      if(adj.statusCode==200){
        // setState(() {
          adjustmentsResponse = adj.body;
          adjustmentsResult  = json.decode(adj.body);
          adjustmentsAvailable = adjustmentsResult?['success'];
          // debugPrint('${caseResult?[0][0]} ');
          debugPrint('-------------------Adjustment api called-------------------------');
          // debugPrint(documentsResult?['results'].toString());
          adjustmentsData = adjustmentsResult?['results'];
          // debugPrint(adjustmentsData.toString());

        // });
      }
      }
    catch(e){
      debugPrint('$e');
      }
    }
    adjustmentsCalled = false;
  }

  // ---------------------------------------------Mention Memo---------------------------------------------

   Future getMentionMemo() async{
   if(mentionCalled == true){
    http.Response mm;
    try{
        mm = await http.post(Uri.parse('http://ns2.mphc.in/api/mention_memo.php'),
        body:{
        // 'bench':'01',
        // 'case_type':'11',
        // 'case_no':'222',
        // 'case_year':'2016',
        'bench':establishInput,
        'case_type':caseTypeInput,
        'case_no':caseNumberInput,
        'case_year':yearInput
      }
      );
      if(mm.statusCode==200){
        // setState(() {
          mentionResponse = mm.body;
          mentionResult  = json.decode(mm.body);
          mentionAvailable = mentionResult?['success'];
          // debugPrint('${caseResult?[0][0]} ');
          debugPrint('-------------------Mention Memo api called-------------------------');
          // debugPrint(documentsResult?['results'].toString());
          mentionData = mentionResult?['results'];
          debugPrint(mentionData.toString());

        // });
      }
      }
    catch(e){
      debugPrint('$e');
      }
    }
    mentionCalled = false;
  }



  // ---------------------------------------------Appearance---------------------------------------------

   Future getAppearance() async{
   if(appearanceCalled == true){
    http.Response ap;
    try{
        ap = await http.post(Uri.parse('http://ns2.mphc.in/new_mobile_app_api/appearance.php'),
        body:{
        // 'bench':'01',
        // 'case_type':'11',
        // 'case_no':'222',
        // 'case_year':'2016',
        'bench':establishInput,
        'case_type':caseTypeInput,
        'case_no':caseNumberInput,
        'case_year':yearInput,
      }
      );
      if(ap.statusCode==200){
        // setState(() {
          appearanceResponse = ap.body;
          appearanceResult  = json.decode(ap.body);
          appearanceAvailable = appearanceResult?['success'];
          // debugPrint('${caseResult?[0][0]} ');
          debugPrint('-------------------Appearance api called-------------------------');
          // debugPrint(documentsResult?['results'].toString());
          appearanceData = appearanceResult?['results'];
          // debugPrint(appearanceData.toString());

        // });
      }
      }
    catch(e){
      debugPrint('$e');
      }
    }
    appearanceCalled = false;
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
          Expanded(flex:5,child: Container(margin: const EdgeInsets.fromLTRB(5, 3, 2, 0), color:const Color.fromARGB(0, 178, 178, 178) ,child:Text('${widget.response}',style:TextStyle(fontSize: 15,fontWeight: rb ==true?FontWeight.bold:FontWeight.normal)))),
          
        ],
      ),
    );
  }
}
   
