import 'package:TakeIt/auth/auth_login.dart';
import 'package:TakeIt/pages/auth/login.dart';
import 'package:TakeIt/pages/dashboard.dart';
import 'package:TakeIt/widgets/bottomnavbar2.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import '../../auth/auth_google.dart';
import '../../widgets/utils.dart';
//for ios gotta download and place the file similar to googleservices.json for android
class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final usernameController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool isChecked = false;

  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  final FirebaseAuth _auth = FirebaseAuth.instance ;

  final GoogleSignInProvider _googleSignInProvider = GoogleSignInProvider();
bool loading = false;


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
    try {
      await _auth
          .createUserWithEmailAndPassword(
          email: emailController.text.toString(),
          password: passwordController.text.toString()).then((value)
      {
        setState(() {
          loading=false;
        });
      }).onError((error, stackTrace) {
        Utils().toastMessage(error.toString());
        setState(() {
          loading=false;
        });
      },);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('User registered successfully')),
      );
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => LoginScreen()),
      // );
      //Todo make this navigator such that if success then navigates back to login screen else remains on signup just add flag if else
    }
    catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Positioned(
                top: Get.width*0.2,
                right: Get.width*0.05,
                child: Image.asset('assets/images/auth/drone.png',height: 150,width: 200,)),
            Positioned(
                top: Get.width*0.5,
                right: Get.width*0.48,
                child: Hero(transitionOnUserGestures: true,

                  tag: 'takeit',
                  child: Text("TakeIt",
                    style: GoogleFonts.poppins(
                      fontSize: Get.width*0.1,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(0,113,220,1.0,),
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.none,
                    ),),
                )),



            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:  EdgeInsets.only(top: Get.width*0.1),
                    child: Text("Create",
                        style: GoogleFonts.interTight(
                          fontSize: Get.width*0.1,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                          height: 1
                        ),),
                  ),
                  Text("Your",
                    style: GoogleFonts.interTight(
                      fontSize: Get.width*0.1,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                      height: 1
                    ),),
                  Text("Account",
                    style: GoogleFonts.interTight(
                      fontSize: Get.width*0.1,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                      height: 1
                    ),),
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


                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding:  EdgeInsets.only(top: Get.height*0.05),
                            child: _UsernameField("Username".tr, Icons.person),
                          ),




                  SizedBox(height: 12),
                  _EmailField("Email".tr, Icons.email),
                  SizedBox(height: 12),
                  _PasswordField("Password".tr, true),
                  SizedBox(height: 12),
                  _ConfirmPasswordField("Confirm Password".tr, false),
                        ],
                      ),
                    ),


                  Row(
                    children: [
                      Checkbox(
                  fillColor: WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
                      if (states.contains(WidgetState.selected)) {
                      return Color.fromRGBO(255, 179, 0, 1); // Checked color
                      }
                      return Color.fromRGBO(255, 179, 0, 1);}),
                        value: isChecked,
                        activeColor:Color.fromRGBO(255, 179, 0, 1),
                        checkColor: Colors.black,

                        onChanged: (value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      Text(
                        "I agree to the Terms & Conditions".tr,
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),
                  Center(
                    child: SizedBox(
                      width: Get.width*0.65,
                      height: Get.width*0.101,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            login();

                          }

                          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DashboardScreen(),));
                          Get.offAll(Homepage(),transition: Transition.fadeIn,duration: Duration(milliseconds: 600));
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 8,
                          backgroundColor: Color.fromRGBO(0,113,220,1.0,),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: loading? CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor:AlwaysStoppedAnimation<Color>(Colors.white) ,): Text(
                          "Sign Up",
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
                      Text("or", style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey)),

                    ],
                  ),


                  SizedBox(height: 16),
                  Hero(
                    tag: 'google',
                    child: SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Get.to(LoginScreen());
                        },
                        icon: Image.asset('assets/images/auth/google.png',height: 32,),
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

                  // SizedBox(height: 30),
                  Padding(
                    padding:  EdgeInsets.only(top: Get.width*0.07),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: "Already have an account? ",
                              style: GoogleFonts.poppins(fontSize: 14),
                              children: [
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Get.to(LoginScreen());
                            },
                            child: Text("Login",
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


  Widget _UsernameField(String hintText, IconData icon) {
    return TextFormField(
      controller: usernameController,
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
  Widget _EmailField(String hintText, IconData icon) {
    return TextFormField(
      controller: emailController,
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

  Widget _PasswordField(String hintText, bool isPassword) {
    return TextFormField(
      controller: passwordController,
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
  Widget _ConfirmPasswordField(String hintText, bool isPassword) {
    return TextFormField(
      controller: confirmpasswordController,
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

