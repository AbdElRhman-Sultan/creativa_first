import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  bool isObscureText = true;
  bool isObscureTextTwo = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmController = TextEditingController();
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
                        Text("Sign Up", style: GoogleFonts.akronim(color: Colors.white, fontSize: 60),
                        ),
                        // UserName
                        Container(
                          margin: EdgeInsets.all(12),
                          child: TextFormField(
                            controller: nameController,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              fillColor: Colors.white70.withOpacity(0.6),
                              filled: true,
                              prefixIcon: Icon(Icons.person, color: Colors.black,),
                              hintText: "UserName",
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                            ),
                            validator: (value){
                              if(value!.isEmpty){
                                return "Please Enter your Name";
                              }
                              if(value.length<3){
                                return "Invalid Name";
                              }
                              return null;
                            },
                          ),
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
                                return "You should Enter valid email ";
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
                        //Confirm Password
                        Container(
                          margin: EdgeInsets.all(12),
                          child: TextFormField(
                            controller: confirmController,
                            obscureText: isObscureTextTwo,
                            textInputAction: TextInputAction.next,
                            decoration: InputDecoration(
                              fillColor: Colors.white70.withOpacity(0.6),
                              filled: true,
                              prefixIcon: Icon(Icons.lock_outlined, color: Colors.black,),
                              hintText: "Confirm Password",
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                              suffixIcon: IconButton(
                                color: Colors.black,
                                onPressed: () {
                                  setState(() {
                                    isObscureTextTwo = !isObscureTextTwo;
                                  });
                                },
                                icon: isObscureTextTwo
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
                                    if (passwordController.text == confirmController.text){
                                      Navigator.of(context).pushReplacementNamed("HomePage");
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        backgroundColor: Colors.green,
                                        content: Text("Welcome"),
                                      ));
                                    }else {
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                        backgroundColor: Colors.red,
                                        content: Text("password don't match!!"),
                                      ));
                                    }
                                  }
                                });

                              },
                              child: Text('Submit',style: GoogleFonts.actor(),),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have account ?",style: TextStyle(color: Colors.grey),),
                            TextButton(onPressed: (){
                              Navigator.of(context).pushReplacementNamed("/login");
                            },
                              child: Text("Log In",
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
