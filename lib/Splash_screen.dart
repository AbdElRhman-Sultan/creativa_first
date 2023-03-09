import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 4), AfterPage);
  }
  void AfterPage(){
    Navigator.of(context).pushNamed("StartScreen");
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Lottie.asset("images/31548-robot-says-hello (1).json"),
      ),
    );
  }
}
