import 'dart:io';

import 'package:cab_driver/screens/main_page.dart';
import 'package:cab_driver/screens/registration_page.dart';
import 'package:cab_driver/screens/vehicle_info_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    final FirebaseApp app = await Firebase.initializeApp(
      name: 'db2',
      options: Platform.isIOS || Platform.isMacOS
          ? FirebaseOptions(
              appId: '1:993836699208:ios:21daffc4cf81311cfb527d',
              apiKey: 'AIzaSyAiXrI_kv7Iy7S9bY4TZvqyM1smWBNHL4w',
              projectId: 'uberclone-983d8',
              messagingSenderId: '993836699208',
              databaseURL:
                  'https://uberclone-983d8-default-rtdb.firebaseio.com',
            )
          : FirebaseOptions(
              appId: '1:993836699208:android:9b7b1441a9978f16fb527d',
              apiKey: 'AIzaSyAXw7GcRdCoQE7S1yEF1aplSAiR2mIJPGs',
              messagingSenderId: '993836699208',
              projectId: 'uberclone-983d8',
              databaseURL:
                  'https://uberclone-983d8-default-rtdb.firebaseio.com',
            ),
    );
  } catch (e) {
    print('try app catch $e');
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: RegistrationPage.id,
      routes: {
        MainPage.id: (ctx) => MainPage(),
        RegistrationPage.id: (ctx) => RegistrationPage(),
        VehicleInfoPage.id: (ctx) => VehicleInfoPage(),
      },
    );
  }
}
