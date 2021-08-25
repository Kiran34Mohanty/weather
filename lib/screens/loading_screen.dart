import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'dart:io';

const apiKey = '2fbfdc60fa9fef8a95475a5267ffa879';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

var latitude;
var longitude;
var isLoading = true;
var temp;
var cond;
var name;

class _LoadingScreenState extends State<LoadingScreen> {
  Location l = new Location();
  NetworkHelper n = new NetworkHelper();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('yo');
    getLocation();
  }

  void getLocation() async {
    Location l = new Location();
    await l.getCurrentLocation();
    latitude = l.latitude;
    longitude = l.longitude;
    n.getData();
    sleep(Duration(milliseconds: 1500));
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Hello');
    print(isLoading);
    return Scaffold(
      body: Center(
        child: isLoading
            ? SpinKitDoubleBounce(
                color: Colors.orange,
                size: 100.0,
                duration: const Duration(milliseconds: 1),
              )
            : Scaffold(
                body: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          '${n.temperature} ${n.condition} ${n.name}',
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
