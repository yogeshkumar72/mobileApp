import 'package:flutter/material.dart';
import '../case_status.dart';
import 'api.dart';

class EarlierCourt extends StatefulWidget {
  // final APICall api;
  const EarlierCourt({super.key});

  @override
  State<EarlierCourt> createState() => _EarlierCourtState();
}

class _EarlierCourtState extends State<EarlierCourt> {
  bool downArrow =false;
  @override
  void initState() {
    // api.getEarlierCourt();
    // debugPrint(earlierCourtData.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // title: Text('FutureBuilder Example'),
      // ),
      body: FutureBuilder(
        future: api.getEarlierCourt(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (earlierCourtData == null) {
            return const Center(child: Text('No Record Found'));
          } else {
            return Container(
              margin:const EdgeInsets.all(10),
                child: ListView.builder(
                    itemCount: earlierCourtData!.length,
                    itemBuilder: (context, index) {
                      return Container(
                          margin: const EdgeInsets.all(4),
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                        //       gradient: const LinearGradient(colors: [
                                
                        // Color.fromARGB(48, 68, 137, 255),
                        // Color.fromARGB(19, 179, 64, 251)
                      
                        //       ]),
                        color: const Color.fromARGB(255, 240, 240, 246),
                              borderRadius: BorderRadius.circular(10)),

                          // color:Colors.white70,
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                FmText(title: 'Lower Court', response: earlierCourtData![index]['Lower_court_Name'].toString(),isbold: true,),
                                FmText(title: 'District : ',response:earlierCourtData![index]['District_Name'].toString()),
                                FmText(title: 'Police Station : ',response:earlierCourtData![index]['Police_Station'].toString()),
                                FmText(title: 'Crime No : ', response: earlierCourtData![index]['Crime_Number'].toString()),
                                FmText(title: 'Judge Name', response: earlierCourtData![index]['Judge_Name'].toString(),isbold: true,),
                                FmText(title: 'Decision Date', response: earlierCourtData![index]['Decision_Date'].toString() ),
                                // TextButton(onPressed: (){
                                 
                                // }, 
                                // child:const Text('Show More 
                                const Divider(),
                                // FmText(title: 'Case No.', response: earlierCourtData![index]['Same_Crime'] !=null ?earlierCourtData![index]['Same_Crime'][0]['Case_No'].toString():''),
                                // FmText(title: 'Filing Date :', response: earlierCourtData![index]['Same_Crime'] !=null ?earlierCourtData![index]['Same_Crime'][0]['Filing_dt'].toString():''),
                                // FmText(title: 'Category :', response: earlierCourtData![index]['Same_Crime'] !=null ?earlierCourtData![index]['Same_Crime'][0]['Catname1'].toString():''),
                                // // FmText(title: 'Category :', response: earlierCourtData![index]['Same_Crime'] !=null ?earlierCourtData![index]['Same_Crime'][0]['Catname2'].toString():''),
                                // //  FmText(title: 'Category :', response: earlierCourtData![index]['Same_Crime'] !=null ?earlierCourtData![index]['Same_Crime'][0]['Catname3'].toString():''),
                                // const  Divider(),
                                // FmText(title: 'Pet Vs Res :', response: earlierCourtData![index]['Same_Crime'] !=null ?earlierCourtData![index]['Same_Crime'][0]['Pet_vs_Res'].toString():'null'),
                                // FmText(title: 'Lower Court Case No :', response: earlierCourtData![index]['Same_Crime'] !=null ?earlierCourtData![index]['Same_Crime'][0]['Lower_Court'].toString():'null'),
                                // FmText(title: 'Lower Court Judge Name / Designation :', response: earlierCourtData![index]['Same_Crime'] !=null ?earlierCourtData![index]['Same_Crime'][0]['Judge_Name_Designation'].toString():'null'),
                                // FmText(title: 'Police Station :', response: earlierCourtData![index]['Same_Crime'] !=null ?earlierCourtData![index]['Same_Crime'][0]['Police_Station'].toString():'null'),
                                // FmText(title: 'Status :', response: earlierCourtData![index]['Same_Crime'] !=null ?earlierCourtData![index]['Same_Crime'][0]['Status'].toString():'null'),
                                // FmText(title: 'Bail No :', response:earlierCourtData![index]['Same_Crime'] !=null ?earlierCourtData![index]['Same_Crime'][0]['Bail_No'].toString():'null'),
                                // FmText(title: 'Date of Disposal :', response:earlierCourtData![index]['Same_Crime'] !=null ?earlierCourtData![index]['Same_Crime'][0]['Date_of_Disposal'].toString():'null'),
                                // FmText(title: 'Remark :', response:earlierCourtData![index]['Same_Crime'] !=null ?earlierCourtData![index]['Same_Crime'][0]['Remark'].toString():'null'),
                                // FmText(title: 'Hon\'ble Justice:', response:earlierCourtData![index]['Same_Crime'] !=null ?earlierCourtData![index]['Same_Crime'][0]['Honble_Justice'].toString():'null'),
                                // FmText(title: 'Reason :', response:earlierCourtData![index]['Same_Crime'] !=null ?earlierCourtData![index]['Same_Crime'][0]['Reason'].toString():'null'),
                               
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  // decoration: BoxDecoration( color:const Color.fromARGB(255, 226, 226, 226),borderRadius: BorderRadius.all(Radius.circular(8))),
                                  // height: 400,
                                 
                                  child:  Column(children: [
                                   
                                      FmText(title: 'Case No.', response: earlierCourtData![index]['Same_Crime'] !=null ?earlierCourtData![index]['Same_Crime'][0]['Case_No'].toString():''),
                                      FmText(title: 'Filing Date :', response: earlierCourtData![index]['Same_Crime'] !=null ?earlierCourtData![index]['Same_Crime'][0]['Filing_dt'].toString():''),
                                      FmText(title: 'Category :', response: earlierCourtData![index]['Same_Crime'] !=null ?earlierCourtData![index]['Same_Crime'][0]['Catname1'].toString():''),
                                      // FmText(title: 'Category :', response: earlierCourtData![index]['Same_Crime'] !=null ?earlierCourtData![index]['Same_Crime'][0]['Catname2'].toString():''),
                                      // FmText(title: 'Category :', response: earlierCourtData![index]['Same_Crime'] !=null ?earlierCourtData![index]['Same_Crime'][0]['Catname3'].toString():''),
                                      const  Divider(),
                                      FmText(title: 'Pet Vs Res :', response: earlierCourtData![index]['Same_Crime'] !=null ?earlierCourtData![index]['Same_Crime'][0]['Pet_vs_Res'].toString():'null'),
                                      FmText(title: 'Lower Court Case No :', response: earlierCourtData![index]['Same_Crime'] !=null ?earlierCourtData![index]['Same_Crime'][0]['Lower_Court'].toString():'null'),
                                      FmText(title: 'Lower Court Judge Name / Designation :', response: earlierCourtData![index]['Same_Crime'] !=null ?earlierCourtData![index]['Same_Crime'][0]['Judge_Name_Designation'].toString():'null'),
                                      FmText(title: 'Police Station :', response: earlierCourtData![index]['Same_Crime'] !=null ?earlierCourtData![index]['Same_Crime'][0]['Police_Station'].toString():'null'),
                                      FmText(title: 'Status :', response: earlierCourtData![index]['Same_Crime'] !=null ?earlierCourtData![index]['Same_Crime'][0]['Status'].toString():'null'),
                                      FmText(title: 'Bail No :', response:earlierCourtData![index]['Same_Crime'] !=null ?earlierCourtData![index]['Same_Crime'][0]['Bail_No'].toString():'null'),
                                      FmText(title: 'Date of Disposal :', response:earlierCourtData![index]['Same_Crime'] !=null ?earlierCourtData![index]['Same_Crime'][0]['Date_of_Disposal'].toString():'null'),
                                      FmText(title: 'Remark :', response:earlierCourtData![index]['Same_Crime'] !=null ?earlierCourtData![index]['Same_Crime'][0]['Remark'].toString():'null'),
                                      FmText(title: 'Hon\'ble Justice:', response:earlierCourtData![index]['Same_Crime'] !=null ?earlierCourtData![index]['Same_Crime'][0]['Honble_Justice'].toString():'null'),
                                      FmText(title: 'Reason :', response:earlierCourtData![index]['Same_Crime'] !=null ?earlierCourtData![index]['Same_Crime'][0]['Reason'].toString():'null'),
                                                                                                 
                                       ]),
                                ),
                              ]));
                    }));
          }
        },
      ),
    );
  }
}
