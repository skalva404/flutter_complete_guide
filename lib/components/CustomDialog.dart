import 'package:flutter/material.dart';

import '../Constants.dart';

class CustomDialog extends StatelessWidget {
  final Image img;
  final String title, descriptions, text;

  const CustomDialog(
      {Key key, this.title, this.descriptions, this.text, this.img})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(padding),
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
              left: padding,
              top: avatarRadius + padding,
              right: padding,
              bottom: padding),
          margin: EdgeInsets.only(top: avatarRadius),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(padding),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                title.toUpperCase(),
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                descriptions,
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      text,
                      style: TextStyle(fontSize: 18),
                    )),
              ),
            ],
          ),
        ),
        Positioned(
            left: padding,
            right: padding,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: avatarRadius,
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(avatarRadius)),
                  child: Image.asset(
                    "assets/help/" + title + ".jpeg",
                    width: 100,
                    fit: BoxFit.cover,
                  )),
              // child: Image.asset("assets/elon.jpg")),
            )), // top part
      ],
    );
  }
}
