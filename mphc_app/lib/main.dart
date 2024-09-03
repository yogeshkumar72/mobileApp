import 'package:flutter/material.dart';
import 'package:mphc_app/pages/home/home.dart';
import 'package:mphc_app/pages/login/login.dart';
import 'package:mphc_app/themes/light_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {

  String ? validate;
  // This widget is the root of your application.
    //  Future<dynamic> getUser() async {
    //     SharedPreferences store = await SharedPreferences.getInstance();
    //     return store.getString('validate');
    // }

  void _loadUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      // _mobile = prefs.getString('mobile').toString();
      validate = prefs.getString('validate').toString();
    });
  }

  @override
  void initState() {
     _loadUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context)  {

     if (validate == 'YES'){
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MPHC App',
        theme: lightMode,
        home: const Home(),
      );
    }else{
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MPHC App',
        theme: lightMode,
        home: Login(),
        // home:const Home(),
      );
    }
  }
}
 