import 'package:flutter/material.dart';
import './api.dart';
import '../case_status.dart';

class Defaults extends StatefulWidget {
  const Defaults({super.key});

  @override
  State<Defaults> createState() => _DefaultsState();
}

class _DefaultsState extends State<Defaults> {
 
  @override
  void initState() {
    // api.getDefaults();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      // title: Text('FutureBuilder Example'),
      // ),
      body: FutureBuilder(
          future: api.getDefaults(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (defaultsData == null) {
              return const Center(child: Text('No Record Found'));
            } else {
              
              

               return Container(
                  child: ListView.builder(
                      itemCount: defaultsData!.length,
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
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Text(defaultsData!.toString()),
                                 
                                    FmText(isbold: true,  leftWidth: 2, title:'Objection' ,  response: defaultsData![index]['Objection'].toString()),
                                    FmText(isbold: true,  leftWidth: 2, title:'Remark' ,     response: defaultsData![index]['Remark'].toString()),
                                    FmText(isbold: true,  leftWidth: 2, title:'Remove Date' ,response: defaultsData![index]['Remove_Date'].toString()),
                                  
                            

                                ]));
                      }));

  }
          }
      ),
  );
  
 

  }
}