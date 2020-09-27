import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';

class Body extends StatelessWidget {
 @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text('Welcome Back',style: headingStyle,),
              SizedBox(height:15),
              GestureDetector(
                onTap: (){
                print("Emergency");
                },
                child: Container(
                  height: 350,
                  width: 350,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.blue.withOpacity(0.1),width: 10)
                  ),
                  padding: EdgeInsets.all(5.5),
                  child: Container(
                    width: 300.0,
                    height: 300.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Emergency',style: style1,),
                        Text('Tap Me',style: style2,),
                      ],
                    ),
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: kPrimaryGradientColor
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
