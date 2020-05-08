import 'package:flutter/material.dart';

class TabAuthButton extends StatelessWidget {
  final String btext;
  final bool isActive;
  final Function onPressed;

  const TabAuthButton(
      {Key key,
      @required this.btext,
      this.isActive = false,
      @required this.onPressed})
      : assert(btext != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    double width0 = (MediaQuery.of(context).size.width) / 2 - 48;
    return Stack(
      children: [
        Container(
          width: width0,
          child: FlatButton(
            onPressed: onPressed,
            child: Text(btext),
          ),
        ),
        isActive ? Container(
          margin: EdgeInsets.only(top: 44),
          height: 4,
          width: width0,
          decoration:
              BoxDecoration(color: Color(0xFFFFCF29), boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color(0x66FFCF29),
              blurRadius: 2,
              spreadRadius: 1,
              offset: Offset(0,2)
            )
          ]),
        ):Container(),
      ],
    );
    /**/
  }
}
