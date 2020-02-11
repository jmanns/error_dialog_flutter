import 'package:flutter/material.dart';

import './consts.dart';

class ErrorDialog extends StatelessWidget {
  final String title, description, buttonText;
  final IconData icon;
  final double padding = 16.0;

  ErrorDialog({
    @required this.title,
    @required this.description,
    @required this.buttonText,
    @required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(padding),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            bottom: padding,
          ),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(padding),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(padding),
                  topRight: Radius.circular(padding),
                ),
                child: Container(
                  height: 56,
                  width: double.infinity,
                  color: Colors.redAccent,
                  child: Icon(
                    icon,
                    size: 48.0,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                title,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomCenter,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 0,
                  highlightElevation: 0,
                  color: Colors.redAccent,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    buttonText,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
