import 'package:cab_driver/global_variables.dart';
import 'package:cab_driver/screens/main_page.dart';
import 'package:cab_driver/widgets/confirm_button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class VehicleInfoPage extends StatefulWidget {
  static const String id = 'vehicle_info';

  @override
  _VehicleInfoPageState createState() => _VehicleInfoPageState();
}

class _VehicleInfoPageState extends State<VehicleInfoPage> {
  final TextEditingController _modelController = TextEditingController();

  final TextEditingController _colorController = TextEditingController();

  final TextEditingController _numberController = TextEditingController();

  void _showSnackBar(String title) {
    final SnackBar snackBar = SnackBar(
        content: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 15),
    ));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void _updateProfile() {
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(
                'images/logo.png',
                height: 110,
                width: 110,
              ),
              SizedBox(height: 10),
              Text('Enter vehicle details',
                  style: TextStyle(fontFamily: 'Brand-Bold', fontSize: 22)),
              SizedBox(
                height: 25,
              ),
              TextField(
                controller: _modelController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: 'Car model',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 10.0)),
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
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 10.0)),
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
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 10.0)),
                style: TextStyle(fontSize: 14.0),
              ),
              SizedBox(
                height: 40,
              ),
              ConfirmButton(
                  title: 'PROCEED',
                  onPressed: () {
                    if (_modelController.text.length < 3) {
                      _showSnackBar('Please provide a valid car model');
                      return;
                    }
                    if (_colorController.text.length < 3) {
                      _showSnackBar('Please provide a valid car color');
                      return;
                    }
                    if (_numberController.text.length < 3) {
                      _showSnackBar('Please provide a valid vehicle number');
                      return;
                    }
                    _updateProfile();
                  }),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _modelController.dispose();
    _colorController.dispose();
    _numberController.dispose();
    super.dispose();
  }
}
