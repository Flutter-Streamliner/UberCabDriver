import 'package:cab_driver/global_variables.dart';
import 'package:cab_driver/screens/main_page.dart';
import 'package:cab_driver/widgets/confirm_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class VehicleInfoPage extends StatelessWidget {
  static const String id = 'vehicle_info';
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  void _showSnackBar(BuildContext context, String title) {
    final SnackBar snackBar = SnackBar(
        content: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15),
    ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _updateProfile(BuildContext context) {
    String id = currentFirebaseUser.uid;
    DatabaseReference driverRef = FirebaseDatabase.instance
        .reference()
        .child('drivers/$id/vehicle_details');
    Map<String, String> map = {
      'car_model': _modelController.text,
      'car_color': _colorController.text,
      'car_number': _numberController.text,
    };
    driverRef.set(map);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(MainPage.id, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Image.asset(
                'images/logo.png',
                height: 110,
                width: 110,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Text('Enter vehicle details',
                        style:
                            TextStyle(fontFamily: 'Brand-Bold', fontSize: 22)),
                    SizedBox(
                      height: 25,
                    ),
                    TextField(
                      controller: _modelController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          labelText: 'Car model',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 10.0)),
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _colorController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: 'Car color',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 10.0)),
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _numberController,
                      maxLength: 11,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          counterText: '',
                          labelText: 'Vehicle number',
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 10.0)),
                      style: TextStyle(fontSize: 14.0),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    ConfirmButton(
                        title: 'PROCEED',
                        onPressed: () {
                          if (_modelController.text.length < 3) {
                            _showSnackBar(
                                context, 'Please provide a valid car model');
                            return;
                          }
                          if (_colorController.text.length < 3) {
                            _showSnackBar(
                                context, 'Please provide a valid car color');
                            return;
                          }
                          if (_numberController.text.length < 3) {
                            _showSnackBar(context,
                                'Please provide a valid vehicle number');
                            return;
                          }
                          _updateProfile(context);
                        }),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
