import 'package:flutter/material.dart';
import 'api.dart';
import '../case_status.dart';


class Petition extends StatefulWidget {
  const Petition({super.key});

  @override
  State<Petition> createState() => _PetitionState();

}

class _PetitionState extends State<Petition> {

  @override
  void initState() {
    api.caseDetails();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title:const Text('Petitions'),
        // backgroundColor: Colors.white,
        // foregroundColor: Colors.black,
        elevation: null,
      ),
      body:
      ListView.builder(
          itemCount: caseData![0]['Petitioner'].length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              decoration: const BoxDecoration(color:Color.fromARGB(255, 235, 234, 242), borderRadius: BorderRadius.all(Radius.circular(10))),
              
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Container( padding: EdgeInsets.fromLTRB(0, 10, 0, 0), width:20,child:Text( '${caseData![0]['Petitioner'][index]['sr_no']}')),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      
                      children: [
                        Expanded(flex :5,child: Container()),
                        Expanded( flex:2, child:Container( padding: EdgeInsets.fromLTRB(0,  0, 0,  5), width: 70, child: Text('Serial No. :',style:TextStyle(color: Color.fromARGB(255, 142, 142, 142),fontSize: 16)))),
                        Expanded( flex:1, child:Container( padding: EdgeInsets.fromLTRB(0, 0, 0, 5), width:30,child:Text( '${caseData![0]['Petitioner'][index]['sr_no']}',style:TextStyle(color: Color.fromARGB(255, 143, 143, 143),fontSize: 16,fontWeight: FontWeight.w400)))),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      
                      children: [
                       Expanded( flex:2,child: Container( padding: EdgeInsets.fromLTRB(0,  0, 0,  0), width: 80, child: Text('Name :',style:TextStyle(color:  Color.fromARGB(255, 70, 45, 253),fontSize: 16)))),
                       Expanded( flex:5,child: Container( padding: EdgeInsets.fromLTRB(20, 0, 0,  10), width: 220, child:Text('${caseData?[0]['Petitioner'][index]['partyname']}',style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color:   Color.fromARGB(255, 70, 45, 253)),))),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:[
                        Expanded( flex:2,child: Container( padding: EdgeInsets.fromLTRB(0, 0, 0,  0), width: 80, child: Text('S/D/W/Thru :',style:TextStyle(color: Color.fromARGB(255, 70, 45, 253),fontSize: 16)))),
                        Expanded( flex:5,child: Container(padding: EdgeInsets.fromLTRB(20, 0, 0, 10), width: 220,child:Text('${caseData![0]['Petitioner'][index]['prfhname']}   ' , style:const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color:  Color.fromARGB(255, 65, 65, 65))))),  
                      ]
                    ),
                    Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded( flex:2,child:Container( padding: EdgeInsets.fromLTRB(0, 0, 0,  0), width: 80, child: Text('Address :',style:TextStyle(color:  Color.fromARGB(255, 70, 45, 253),fontSize: 16)))),
                        Expanded( flex:5,child:Container( padding: EdgeInsets.fromLTRB(20, 0, 0, 10), width: 220,child: Expanded (child: Text('${caseData![0]['Petitioner'][index]['addr2']} ')), ))
                      ],
                    ),
                   

                ],
              )
            );
          },
        )

    );  
  }
}