import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

import '../constants.dart';
import '../size_config.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key key,
    this.text,
    this.press,
  }) : super(key: key);
  final String text;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [kPrimaryColor,kPrimaryColor1, ],
                tileMode: TileMode.clamp
            ),
            borderRadius: BorderRadius.circular(15),
            color: Color.fromRGBO(53, 146, 255, 1),
            boxShadow: [
              BoxShadow(
                color: Color(0x303592FF),
                blurRadius: 5,
                offset: Offset(0, 10),
              )
            ]
        ),
        child: FlatButton(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Colors.transparent,
          onPressed: press,
          child: Text(
            text,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(18),
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
