import 'package:shared_preferences/shared_preferences.dart';

class LoginState {
Future<dynamic> getUser() async {
    SharedPreferences store = await SharedPreferences.getInstance();
    return store.getString('validate');
  }


}