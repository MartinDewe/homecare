import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:perawat_app/NavPages/menu.dart';
import 'package:perawat_app/SubMenu/invoice.dart';
import 'package:perawat_app/SubMenu/loading.dart';
import 'package:perawat_app/SubMenu/orderdone.dart';
import 'package:perawat_app/home.dart';
import 'package:perawat_app/splashscreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MaterialApp(
   home: Splash(),
   
 ));
}

