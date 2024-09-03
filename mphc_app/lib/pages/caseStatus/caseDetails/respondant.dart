import 'package:flutter/material.dart';
// import '../case_status.dart';
import './api.dart';

class Respondant extends StatefulWidget {
  const Respondant({super.key});

  @override
  State<Respondant> createState() => _RespondantState();
}

class _RespondantState extends State<Respondant> {

  APICall api = APICall();

  @override
  void initState() {
    api.caseDetails();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title:const Text('Respondent'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: null,
      ),
      body:
      ListView.builder(
        padding: const EdgeInsets.all(20),
        scrollDirection: Axis.vertical,
          itemCount: caseData?[0]['Respondent'].length,
          itemBuilder: (context, index) {
            return Card(
              color:const Color.fromARGB(255, 241, 241, 246),
              
              margin: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: [
                    Container(padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),child:Text('Serial No. ${caseData?[0]['Respondent'][index]['sr_no']}' , style: const TextStyle(color:Color.fromARGB(255, 145, 145, 145),))),
                    
                
                   
                   
                    // Text( '${caseData?[0]['Respondent'][index]['sr_no']}  '),
                    // Expanded(
                    //   child:Text('Name : ${caseData?[0]['Respondent'][index]['partyname']}'),
                    // ),
                     
                  ],
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [

                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded( flex:2,child: Container(padding: const EdgeInsets.fromLTRB(0, 5, 0,  5), width: 80,child: const Text('Name :', style: TextStyle(fontSize: 16,color:Color.fromRGBO(74, 36, 224, 1)),),)),
                        Expanded( flex:5,child: Container(padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),width: 210,child:Text('${caseData?[0]['Respondent'][index]['partyname']}',style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 16,color:Color.fromRGBO(74, 36, 224, 1)),),)),
                      ],
                    ),
                        
                    SingleChildScrollView(
                      child:
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded( flex:2,child: Container(padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),width: 80,child: Text('S/D/W/Thru ${caseData?[0]['Respondent'][index]['prfhname']}' ,style:const TextStyle(fontSize: 15,color:Color.fromRGBO(72, 37, 212, 1))),)),
                          Expanded( flex:5,child: Container(padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),width: 210,child:Text('${caseData?[0]['Respondent'][index]['addr2']}' ,style:const TextStyle(fontSize: 16)),)),
                          
                          
                        ],
                      ),
                    ),
                    // Text('Address: ${petitioners?[index]['addr1']} ${petitioners?[index]['addr2']}'),
                  ],
                ),
              ),
            );
          },
        )

    );  
  }
}