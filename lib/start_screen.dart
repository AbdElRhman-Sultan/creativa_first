import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:[
          Center(
          child: Lottie.asset("images/78126-secure-login.json"),
        ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: 50,
                  width: 120,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).pushNamed("/login");
                    },
                    child: Text('Log In',style: GoogleFonts.actor(fontWeight: FontWeight.bold),),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                      ),
                      primary:  Colors.indigo,
                    ),
                  )
              ),
              SizedBox(width: 20,),
              Container(
                  height: 50,
                  width: 120,
                  child: ElevatedButton(
                    onPressed: (){
                      Navigator.of(context).pushNamed("Signup");
                    },
                    child: Text('Sign Up',style: GoogleFonts.actor(fontWeight: FontWeight.bold,color:Colors.indigo ),),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.indigo),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                       primary: Colors.white,
                    ),
                  )
              ),
            ],
          )
    ]
      ),
    );
  }
}
