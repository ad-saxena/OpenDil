import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shop_app/size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {



  void _showcontent1() {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Cancel Request'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: [
                Text('Do you want to cancel the request?',style: TextStyle(fontFamily: 'nunito'),),
                //Text('Units Required : 3',style: TextStyle(fontFamily: 'nunito'),),
                //Text('Deadline : 1:00pm, 20th September ',style: TextStyle(fontFamily: 'nunito'),),
                //Text('Contact Number : 9001230019',style: TextStyle(fontFamily: 'nunito'),),
              ],
            ),
          ),
          actions: [
            new FlatButton(

              child: new Text('Confirm',style:TextStyle(color: Colors.blue) ,),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            new FlatButton(

              child: new Text('Cancel',style:TextStyle(color: Colors.blue) ,),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _showcontent() {
    showDialog(
      context: context, barrierDismissible: false, // user must tap button!

      builder: (BuildContext context) {
        return new AlertDialog(
          title: new Text('Location Sent'),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: [
                Text('Your Location has been sent to your Emergency Contacts',style: TextStyle(fontFamily: 'nunito'),),
              ],
            ),
          ),
          actions: [
            new FlatButton(

              child: new Text('Confirm',style:TextStyle(color: Colors.blue) ,),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            new FlatButton(

              child: new Text('Cancel',style:TextStyle(color: Colors.blue) ,),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }


  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;
  String _currentAddress;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });

      _getAddressFromLatLng();
    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
        "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }
  @override

  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height:13),
              Text('Welcome Back',style: headingStyle,),
              SizedBox(height:15),
              GestureDetector(
                onTap: (){
                  setState(() {
                    print(_currentAddress);
                    _showcontent();
                    //if (_currentPosition != null && _currentAddress != null)
                      //Text(_currentAddress);
                  });
                  print(_currentAddress);
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
              //SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.white,Colors.white, ],
                          tileMode: TileMode.clamp
                      ),
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromRGBO(53, 146, 255, 1),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x303592FF),
                          blurRadius: 15,
                          offset: Offset(0, 10),
                        )
                      ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Location',
                          style: style3,
                        ),
                        SizedBox(height: 3,),
                        if (_currentPosition != null &&
                            _currentAddress != null)
                          Text(_currentAddress,
                              style:style4),
                      ],
                    ),
                  ),
                ),
              ),
              //SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [kPrimaryColor,Colors.black, ],
                          tileMode: TileMode.clamp
                      ),
                      borderRadius: BorderRadius.circular(15),
                      color: Color.fromRGBO(53, 146, 255, 1),
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x303592FF),
                          blurRadius: 15,
                          offset: Offset(0, 10),
                        )
                      ]
                  ),
                  child: GestureDetector(
                    onTap: _showcontent1,
                      child: Center(child: Text('Cancel Request',style: style5,))),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

