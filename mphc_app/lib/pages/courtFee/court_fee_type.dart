import 'package:flutter/material.dart';
import 'package:mphc_app/pages/courtFee/courtFeeTypes/fee_status_form.dart';
import 'package:mphc_app/pages/courtFee/courtFeeTypes/fresh_case_form.dart';
import 'package:mphc_app/pages/courtFee/courtFeeTypes/pending_case_form.dart';
class CourtFeeType extends StatefulWidget {
  const CourtFeeType({super.key});
  @override
  State<CourtFeeType> createState() => _CourtFeeTypeState();
}
class _CourtFeeTypeState extends State<CourtFeeType> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Online Court Fee',style:TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 16, 55, 124),
        foregroundColor: Colors.white,
      ),
      body:Container(
        height: double.infinity,
        padding: const EdgeInsets.all(50),
        decoration:const BoxDecoration(
        color:Color.fromARGB(255, 255, 255, 255),
        image: DecorationImage(
        image:AssetImage('images/mphc02.jpg'),fit:BoxFit.contain,
        alignment: Alignment.bottomCenter,
        opacity: 1,        
         colorFilter: ColorFilter.mode(Color.fromARGB(255, 0, 24, 94), BlendMode.screen),
          ),
         ),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children:[
            InkWell(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> const FreshCaseForm())),
              child: Container(margin:const EdgeInsets.all(10),padding: const EdgeInsets.all(15),width:double.infinity,decoration: BoxDecoration(color:Color.fromARGB(255, 46, 203, 255), borderRadius: BorderRadius.circular(20)),child:const Text('Fresh Case'  ,style:TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color:Colors.white),textAlign: TextAlign.center, )),
            ),
            InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> const PendingCaseForm())),
              child: Container(margin:const EdgeInsets.all(10),padding: const EdgeInsets.all(15),width:double.infinity,decoration: BoxDecoration(color:Color.fromARGB(255, 44, 153, 255), borderRadius: BorderRadius.circular(20)),child:const Text('Pending Case',style:TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color:Colors.white), textAlign: TextAlign.center, )),
            ),
            InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>const FeeStatusForm())),
              child: Container(margin:const EdgeInsets.all(10),padding: const EdgeInsets.all(15),width:double.infinity,decoration: BoxDecoration(color:Color.fromARGB(255, 72, 130, 255),   borderRadius: BorderRadius.circular(20)),child:const Text('Fee Status'    ,style:TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color:Colors.white), textAlign: TextAlign.center, )),
            ),
          ]
        )
      )
    );
  }
}