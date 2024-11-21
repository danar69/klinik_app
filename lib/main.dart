import 'package:flutter/material.dart';
import 'package:klinik_app/helpers/user_info.dart';
import 'package:klinik_app/ui/poli_homepage.dart';
import 'package:klinik_app/ui/poli_login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var token = await UserInfo().getToken();
  print(token);
  runApp(MaterialApp(
    title: "Klinik App",
    debugShowCheckedModeBanner: false,
    home: token == null ? Login() : PoliHomepage(),
  ));
}
