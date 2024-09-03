import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'vc_other_api.dart';

class VCLINKConnect extends StatefulWidget {
  const VCLINKConnect({super.key});

  @override
  State<VCLINKConnect> createState() => _VCLINKConnectState();
}

class _VCLINKConnectState extends State<VCLINKConnect> {
  VCAPI api = VCAPI();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('VC LINK'),
      ),
      body:FutureBuilder(
          future: api.getVcLink(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (api.meetingData == null) {
              return const Center(child: Text('No Record Found'));
            } else {


                return Center(
                  child: TextButton(
            onPressed: (){launchUrlString(api.meetingData![0]['url'].toString());},
            child:Container(decoration:BoxDecoration(color:const Color.fromARGB(255, 68, 74, 108),borderRadius: BorderRadius.circular(10)), padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),child: const Text('Connect Virtual Court',style: TextStyle(color:Colors.white),))),
                );}}));
  }
}