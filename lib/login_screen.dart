import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_fonts/google_fonts.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool isObscureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Form(
            key: _formKey,
            child: Expanded(
              child: Stack(
                  clipBehavior: Clip.none,
                children:[

                  Positioned(
                    left: 0,bottom: 0,top:0,
                      child: Image.asset("images/pexels41.jpg"),
                  ) ,
                  Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Log IN", style: GoogleFonts.akronim(color: Colors.white, fontSize: 60),
                    ),
                    //Email
                    Container(
                      margin: EdgeInsets.all(12),
                      child: TextFormField(
                        controller: emailController,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          fillColor: Colors.white70.withOpacity(0.6),
                          filled: true,
                          prefixIcon: Icon(Icons.email, color: Colors.black,),
                          hintText: "Email",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Please Enter your Email";
                          }
                          if(!value.contains("@")){
                            return "You should Enter valid Email ";
                          }
                          return null;
                        },
                      ),
                    ),
                    //Password
                    Container(
                      margin: EdgeInsets.all(12),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: isObscureText,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          fillColor: Colors.white70.withOpacity(0.6),
                          filled: true,
                          prefixIcon: Icon(Icons.lock_outlined, color: Colors.black,),
                          hintText: "Password",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                          suffixIcon: IconButton(
                            color: Colors.black,
                            onPressed: () {
                              setState(() {
                                isObscureText = !isObscureText;
                              });
                            },
                            icon: isObscureText
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility), // false
                          ),
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Please Enter your password";
                          }
                          if(value.length<6){
                            return "Weak Password";
                          }
                          return null;
                        },
                      ),
                    ),
                    Container(
                        width: 350,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: (){
                            setState(() {
                              if(_formKey.currentState!.validate()){
                               Navigator.of(context).pushReplacementNamed("HomePage");
                               ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                 backgroundColor: Colors.green,
                                 content: Text("Welcome"),
                               ));
                              }
                            });

                          },
                          child: Text('Log In',style: GoogleFonts.actor(),),
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.indigo),
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            primary: Colors.indigo,
                          ),
                        )
                    ),
                    SizedBox(height: 10,),
                    //Divider
                    Row(
                      children: [
                        SizedBox(
                          width: 50,
                        ),
                        Container(
                          width: 150,
                          child: Divider(
                            height: 25,
                            thickness: 1,
                            color: Colors.white,
                            indent: 10,
                            endIndent: 10,
                          ),
                        ),
                        Text(
                          "OR",
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          width: 150,
                          child: Divider(
                            height: 25,
                            thickness: 1,
                            color: Colors.white,
                            indent: 10,
                            endIndent: 10,
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 10,),
                    //Login with Google
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SignInButton(
                          shape: CircleBorder(),
                          Buttons.Facebook,
                          mini: true,
                          onPressed: () {},
                        ),
                        SignInButton(
                          shape: CircleBorder(),
                          Buttons.LinkedIn,
                          mini: true,
                          onPressed: () {},
                        ),
                        SignInButton(
                          shape: CircleBorder(),
                          Buttons.Email,
                          mini: true,
                          onPressed: () {},
                        ),
                        SignInButton(
                          shape: CircleBorder(),
                          Buttons.Twitter,
                          mini: true,
                          onPressed: () {},
                        ),

                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have account ?",style: TextStyle(color: Colors.grey),),
                          TextButton(onPressed: (){
                            Navigator.of(context).pushReplacementNamed("Signup");
                          },
                            child: Text("Sign Up",
                            style: TextStyle(color: Colors.indigo,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                        ),
                      ],
                    ),
                  ],
                ),
                ]
              ),
            ),
          )
      ),
    );
  }
}
