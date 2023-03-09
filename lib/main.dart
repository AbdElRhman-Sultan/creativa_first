import 'package:creativa_second/Cubit/cubit_product_cubit.dart';
import 'package:creativa_second/Home_page.dart';
import 'package:creativa_second/Splash_screen.dart';
import 'package:creativa_second/login_screen.dart';
import 'package:creativa_second/signup_screen.dart';
import 'package:creativa_second/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => ProductCubit(),
      child: MaterialApp(
        routes: {
          "SplashScreen": (context) {
            return SplashScreen();
          },
          "StartScreen": (context) {
            return Start();
          },
          "/login": (context) {
            return LoginPage();
          },
          "Signup": (context) {
            return SignUp();
          },
          "HomePage": (context) {
            return HomePage();
          },
        },
        debugShowCheckedModeBanner: false,
        initialRoute: "SplashScreen",
      ),
    );
  }
}
