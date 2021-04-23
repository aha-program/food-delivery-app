import 'package:flutter/material.dart';

import '../const.dart';

class CustomAlertDialog extends StatefulWidget {
  final String title, descriptions, text;

  const CustomAlertDialog({
    Key? key,
    required this.title,
    required this.descriptions,
    required this.text,
  }) : super(key: key);

  @override
  _CustomAlertDialogState createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kPadding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
              left: kPadding,
              top: kAvatarRadius + kPadding,
              right: kPadding,
              bottom: kPadding),
          margin: EdgeInsets.only(top: kAvatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(kPadding),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, 10),
                    blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                widget.title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                widget.descriptions,
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 22,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      widget.text,
                      style: TextStyle(fontSize: 18),
                    )),
              ),
            ],
          ),
        ),
        Positioned(
          left: kPadding,
          right: kPadding,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(kPadding)),
              child: Icon(
                Icons.error_outline,
                color: kDarkRed,
                size: 100,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
