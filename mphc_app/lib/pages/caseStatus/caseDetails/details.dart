import 'package:flutter/material.dart';
import 'package:mphc_app/pages/caseStatus/caseDetails/petitioners.dart';
import 'package:mphc_app/pages/caseStatus/caseDetails/respondant.dart';
import '../case_status.dart';
import './api.dart';
// import 'dart:convert';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool dropDown = false;

  @override
  void initState() {
    // debugPrint(caseData.toString());
    api.caseDetails();
    super.initState();
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // title: Text('FutureBuilder Example'),
      // ),
      body: FutureBuilder(
          future: api.caseDetails(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (caseData == null) {
              return const Center(child: Text('No Record Found'));
            } else { 
              return Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Color.fromARGB(26, 68, 137, 255),
                Color.fromARGB(34, 179, 64, 251)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
            // -----------------------------------------------------------------------------------------------------
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                // height: 500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(json.encode(caseData),style:TextStyle(fontSize: 18)),

                    // if (caseData != null && caseData!.isNotEmpty)

                    //Registration Date---------------------------------------------------------------------------------
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 150,
                            padding: const EdgeInsets.all(5),
                            child: const Text(
                              'Registration Date : ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 54, 92, 244),
                                  fontSize: 18),
                            )),
                        Container(
                            width: 150,
                            padding: const EdgeInsets.all(5),
                            child: Text('${caseData?[0]['Registration_Date']}',
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 39, 24, 23),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))),
                      ],
                    ),

                    //Case Details---------------------------------------------------------------------------------------
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 150,
                            padding: const EdgeInsets.all(5),
                            child: const Text(
                              'Case Detail : ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 54, 82, 244),
                                  fontSize: 18),
                            )),
                        Container(
                            width: 150,
                            padding: const EdgeInsets.all(5),
                            child: Text('${caseData?[0]['Case_Detail']}',
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 39, 24, 23),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              // if(dropDown?null){
                              dropDown = !dropDown;

                              // }
                              debugPrint('$dropDown');
                            });
                          },
                          icon: Icon(dropDown == true
                              ? Icons.arrow_drop_down_sharp
                              : Icons.arrow_drop_up_sharp),
                          iconSize: 30,
                        ),
                      ],
                    ),
                    // const Divider(),
                    //DA Name--------------------------------------------------------------------------------------------
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            width: 150,
                            padding: const EdgeInsets.all(5),
                            child:const Text(
                              'DA Name : ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 54, 111, 244),
                                  fontSize: 18),
                            )),
                        Container(
                            width: 200,
                            padding: const EdgeInsets.all(5),
                            child: Text('${caseData?[0]['DA_name']}',
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 39, 24, 23),
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold))),
                      ],
                    ),
                    const Divider(),

                    Visibility(
                      visible: dropDown,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //  ---------------------more details-----------------------------
                          const SizedBox(
                            height: 8,
                          ),
                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 120,
                                      padding: const EdgeInsets.all(5),
                                      child:const Text('First Entry Clerk : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 54, 79, 244)))),
                                  Container(
                                      width: 200,
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                          '${caseData?[0]['First_Entry_Clerk']}',
                                          style:const TextStyle(
                                              color: Colors.amberAccent))),
                                ],
                              )),

                          // SizedBox(height: 10,),

                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 120,
                                      padding: const EdgeInsets.all(5),
                                      child: const Text('Last Updated By : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 54, 79, 244)))),
                                  Container(
                                      width: 200,
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                          '${caseData?[0]['Last_Updated_By']}')),
                                ],
                              )),
                          //  SizedBox(height: 10,),

                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 120,
                                      padding: const EdgeInsets.all(5),
                                      child:const Text('Last Listed On: ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 54, 79, 244)))),
                                  Container(
                                      width: 230,
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                          '${caseData?[0]['Last_Listed_On']}')),
                                ],
                              )),
                          //  SizedBox(height: 10,),

                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 120,
                                      padding: const EdgeInsets.all(5),
                                      child:const Text('Last Order : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 54, 79, 244)))),
                                  Container(
                                      width: 230,
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                          '${caseData?[0]['Last_Order']}')),
                                ],
                              )),
                          //  SizedBox(height: 10,),

                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 120,
                                      padding: const EdgeInsets.all(5),
                                      child:const Text('Tentative Date : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 54, 79, 244)))),
                                  Container(
                                      width: 230,
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                          '${caseData?[0]['Tentative_date']}')),
                                ],
                              )),
                          //  SizedBox(height: 10,),

                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 120,
                                      padding: const EdgeInsets.all(5),
                                      child: const Text('Update On: ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 54, 79, 244)))),
                                  Container(
                                      width: 220,
                                      padding: const EdgeInsets.all(5),
                                      child:
                                          Text('${caseData?[0]['Update_On']}')),
                                ],
                              )),
                          //  SizedBox(height: 10,),

                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 120,
                                      padding: const EdgeInsets.all(5),
                                      child:const  Text('Status : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 54, 79, 244)))),
                                  Container(
                                      width: 220,
                                      padding: const EdgeInsets.all(5),
                                      child: Text('${caseData?[0]['Status']}')),
                                ],
                              )),
                          //  const SizedBox(height: 10,),

                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 120,
                                      padding: const EdgeInsets.all(5),
                                      child:const  Text('Stage : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 54, 79, 244)))),
                                  Container(
                                      width: 120,
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                          '${caseData?[0]['Stage1']} \n${caseData?[0]['Stage2']} \n${caseData?[0]['Stage3']}')),
                                ],
                              )),
                          //  const SizedBox(height: 10,),

                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 120,
                                      padding: const EdgeInsets.all(5),
                                      child:const  Text('Statutory Info : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 54, 79, 244)))),
                                  Container(
                                      width: 220,
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                          '${caseData?[0]['Statutory_Info']}')),
                                ],
                              )),
                          //  const SizedBox(height: 10,),

                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 120,
                                      padding: const EdgeInsets.all(5),
                                      child:const Text('Bench : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 54, 79, 244)))),
                                  Container(
                                      width: 220,
                                      padding: const EdgeInsets.all(5),
                                      child: Text('${caseData?[0]['Bench']}')),
                                ],
                              )),
                          //  const SizedBox(height: 10,),

                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 120,
                                      padding: const EdgeInsets.all(5),
                                      child:const  Text('LIST BEFORE: ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 54, 79, 244)))),
                                  Container(
                                      width: 220,
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                          '${caseData?[0]['List_Before']}')),
                                ],
                              )),
                          //  const SizedBox(height: 10,),

                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 120,
                                      padding: const EdgeInsets.all(5),
                                      child:const  Text(
                                          'NOT GO BEFORE ( By Advocate ): ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 54, 79, 244)))),
                                  Container(
                                      width: 220,
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                          '${caseData?[0]['Last_Listed_On']}')),
                                ],
                              )),
                          //  const SizedBox(height: 10,),

                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 120,
                                      padding: const EdgeInsets.all(5),
                                      child: const Text('Category : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 54, 79, 244)))),
                                  Container(
                                      width: 220,
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                          '${caseData?[0]['Cat_1']} \n ${caseData?[0]['Cat_2']} \n ${caseData?[0]['Cat_3']}')),
                                ],
                              )),
                          //  const SizedBox(height: 10,),

                          const Divider(),

                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 120,
                                      padding: const EdgeInsets.all(5),
                                      child: const Text('Act : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 54, 79, 244)))),
                                  Container(
                                      width: 220,
                                      padding: const EdgeInsets.all(5),
                                      child:
                                          Text('${caseData?[0]['Act_Main']}')),
                                ],
                              )),
                          //  const SizedBox(height: 10,),

                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 130,
                                      padding: const EdgeInsets.all(5),
                                      child:const Text('Main Pet. Advocate : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 54, 79, 244)))),
                                  Container(
                                      width: 220,
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                          '${caseData?[0]['Main_Petitioner_adv']}')),
                                ],
                              )),
                          //  SizedBox(height: 10,),

                          SingleChildScrollView(
                              // scrollDirection: Axis.horizontal,
                              child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 130,
                                  padding: const EdgeInsets.all(5),
                                  child: const Text('Petitioner(s) : ',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 54, 79, 244)))),
                              Container(
                                  width: 220,
                                  padding: const EdgeInsets.all(5),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Petition()));
                                      },
                                      child: const Text('Show Petitioners'))),
                            ],
                          )),
                          //  const SizedBox(height: 10,),

                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 130,
                                      padding: const EdgeInsets.all(5),
                                      child:const Text('Pet. Advocate(s) : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 54, 79, 244)))),
                                  Container(
                                      width: 220,
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                          '${caseData?[0]['Additional_Petitioner_Advocate']?[0]['Advocate_P']} ')),
                                ],
                              )),
                          //  SizedBox(height: 10,),

                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 120,
                                      padding: const EdgeInsets.all(5),
                                      child:const Text('Main Resp. Advocate : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 54, 79, 244)))),
                                  Container(
                                      width: 120,
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                          '${caseData?[0]['Main_Respondent_adv']}')),
                                ],
                              )),
                          //  SizedBox(height: 10,),

                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 120,
                                      padding: const EdgeInsets.all(5),
                                      child:const Text('Resp. Advocate: ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 54, 79, 244)))),
                                  Container(
                                      width: 220,
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                          '${caseData![0]['Additional_Respondent_Advocate']!=null?caseData![0]['Additional_Respondent_Advocate'][0]['Advocate_R']:null}')),
                                ],
                              )),
                          //  SizedBox(height: 10,),

                          SingleChildScrollView(
                              // scrollDirection: Axis.horizontal,
                              child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  width: 120,
                                  padding: const EdgeInsets.all(5),
                                  child:const  Text('Respondent(s) : ',
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 54, 79, 244)))),
                              Container(
                                  width: 220,
                                  padding: const EdgeInsets.all(5),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Respondant()));
                                      },
                                      child: const Text('Show Respondent'))),
                            ],
                          )),

                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 120,
                                      padding: const EdgeInsets.all(5),
                                      child: const Text('Caveat No : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 54, 79, 244)))),
                                  Container(
                                      width: 120,
                                      padding: const EdgeInsets.all(5),
                                      child:
                                          Text('${caseData?[0]['Caveat_No']}')),
                                ],
                              )),
                          //  SizedBox(height: 10,),

                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 120,
                                      padding: const EdgeInsets.all(5),
                                      child: const Text('District : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 54, 79, 244)))),
                                  Container(
                                      width: 120,
                                      padding: const EdgeInsets.all(5),
                                      child:
                                          Text('${caseData?[0]['District']}')),
                                ],
                              )),
                          //  SizedBox(height: 10,),

                          SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      width: 120,
                                      padding: const EdgeInsets.all(5),
                                      child: const Text('U/Section : ',
                                          style: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 54, 79, 244)))),
                                  Container(
                                      width: 120,
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                          '${caseData?[0]['Under_Section']}')),
                                ],
                              )),
                          //  SizedBox(height: 10,),
                          const Divider(),
                        ],
                      ),
                    ),

                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
          );
            }
          }
    ),
    );
  }
  }

