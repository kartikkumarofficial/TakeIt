import 'package:TakeIt/pages/auth/signup.dart';
import 'package:TakeIt/widgets/bottomnavbar2.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../auth/auth_google.dart';
import '../../widgets/utils.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isChecked = false;
  bool passwordVisible = false;
  bool confirmPasswordVisible = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool loading = false;
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  // final FirebaseAuth _auth = FirebaseAuth.instance ;
  final GoogleSignInProvider _googleSignInProvider = GoogleSignInProvider();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  void login() async{
    setState(() {
      loading=true;

    });
    try{
      await _auth.signInWithEmailAndPassword(
          email: emailController.text.toString(),
          password: passwordController.text.toString()).then((value) {
        Utils().gtoastMessage("Welcome ${value.user!.email.toString()}");
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Homepage(),));
        setState(() {
          loading = false;
        });


      },).onError((error,stackTrace){
        Utils().toastMessage(error.toString());
        setState(() {
          loading=false;

        });
      });
    }catch(e){
      Fluttertoast.showToast(msg: e.toString());
    }}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
                top: Get.width*0.4,
                right: Get.width*0.1,
                child: Transform.rotate(angle: 0.2,
                    child: Image.asset('assets/images/onboardingscreen/box.png',
                      height: 150,
                      width: 150,))),
            Positioned(
                top: Get.width*0.4,
                right: Get.width*0.48,
                child: Hero(transitionOnUserGestures: false,
        
                  tag: 'takeit',
                  child: Text("TakeIt",
                    style: GoogleFonts.poppins(
                      fontSize: Get.width*0.1,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(0,113,220,1.0,),
                      fontStyle: FontStyle.italic,
                    ),),
                )),
        
        
        
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: Get.width*0.2),
                    child: Text("Login",
                        style: GoogleFonts.interTight(
                          fontSize: Get.width*0.1,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                          height: 1
                        ),),
                  ),
        
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text("  And",
                      style: GoogleFonts.interTight(
                        fontSize: Get.width*0.05,
                        fontWeight: FontWeight.w800,
                        color: Color.fromRGBO(255, 179, 0, 1),
                        // height: 1
                      ),),
                  ),
        
        
                  SizedBox(height: 20),
        
                  Padding(
                    padding:  EdgeInsets.only(top: Get.height*0.18),
                    child: _buildTextField("Email".tr, Icons.email),
                  ),
                  SizedBox(height: 12),
        
                  _buildPasswordField("Password".tr, true),
        
        
        
        
        
                  SizedBox(height: 30),
                  Center(
                    child: SizedBox(
                      width: Get.width*0.6,
                      height: Get.width*0.095,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 8,
                          backgroundColor: Color.fromRGBO(0,113,220,1.0,),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          "Login",
                          style: GoogleFonts.poppins(
                            fontSize: Get.width*0.045,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
        
        
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
        
                      // SizedBox(width: 8),
                      Text("or", style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.grey)),
        
                    ],
                  ),
        
        
                  SizedBox(height: 16),
                  Center(
                    child: Hero(
                      tag: 'google',
                      child: SizedBox(
                        width: Get.width*0.82,
                        height: 44,
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: Image.asset('assets/images/auth/google.png',height: 30,),
                          label: Text(
                            "Continue with Google",
                            style: GoogleFonts.poppins(fontSize: 16, color: Colors.black),
                          ),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: Colors.grey,width: 1.5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
        
                  // SizedBox(height: 30),
                  Padding(
                    padding:  EdgeInsets.only(top: Get.width*0.30),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: "Don't have an account? ",
                              style: GoogleFonts.poppins(fontSize: 14),
                              children: [
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Get.to(SignUpScreen());
                            },
                            child: Text("Sign Up",
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(255,179,0,1),
                              ),),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget _buildTextField(String hintText, IconData icon) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.black),
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }

  Widget _buildPasswordField(String hintText, bool isPassword) {
    return TextField(
      obscureText: isPassword ? !passwordVisible : !confirmPasswordVisible,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.lock, color: Colors.black),
        suffixIcon: IconButton(
          icon: Icon(
            isPassword
                ? (passwordVisible ? Icons.visibility : Icons.visibility_off)
                : (confirmPasswordVisible ? Icons.visibility : Icons.visibility_off),
            color: Colors.black,
          ),
          onPressed: () {
            setState(() {
              if (isPassword) {
                passwordVisible = !passwordVisible;
              } else {
                confirmPasswordVisible = !confirmPasswordVisible;
              }
            });
          },
        ),
        hintText: hintText,
        hintStyle: GoogleFonts.poppins(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue),
        ),
      ),
    );
  }
}
