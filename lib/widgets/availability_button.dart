import 'package:flutter/material.dart';
import 'package:cab_driver/brand_colors.dart';

class AvailabilityButton extends StatelessWidget {
  final Function onPressed;
  final String title;
  final Color color;

  AvailabilityButton(
      {@required this.title,
      @required this.onPressed,
      this.color = BrandColors.colorGreen});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () => onPressed(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      color: color,
      textColor: Colors.white,
      child: Container(
        height: 50,
        width: 200,
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 20, fontFamily: 'Brand-Bold'),
          ),
        ),
      ),
    );
  }
}
