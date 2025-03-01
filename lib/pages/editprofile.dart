import 'package:TakeIt/widgets/CustomTextfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileScreen extends StatefulWidget {
  final String currentUsername;
  final String? currentEmail;
  final String? currentPhone;

  EditProfileScreen({
    required this.currentUsername,
    required this.currentEmail,
    this.currentPhone,
  });

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController(text: widget.currentUsername);
    _emailController = TextEditingController(text: widget.currentEmail ?? "");
    _phoneController = TextEditingController(text: widget.currentPhone ?? "");
  }

  Future<void> updateUserProfile() async {
    if (_formKey.currentState!.validate()) {
      User? user = _auth.currentUser;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).update({
          'username': _usernameController.text.trim(),
          'email': _emailController.text.trim().isEmpty ? null : _emailController.text.trim(),
          'phoneNumber': _phoneController.text.trim().isEmpty ? null : _phoneController.text.trim(),
        });

        Get.snackbar("Success", "Profile updated successfully!",
            backgroundColor: Colors.green, colorText: Colors.white);

        Navigator.pop(context); 
      }
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile", style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white)),
        backgroundColor: Color.fromRGBO(0, 113, 220, 1.0),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              CustomTextField("Username", _usernameController, Icons.person, (value) {
                if (value!.isEmpty) return "Enter username";
                return null;
              }),
              SizedBox(height: 16),
              CustomTextField("Email", _emailController, Icons.email, (value) {
                if (value != null && value.isNotEmpty && !RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}").hasMatch(value)) {
                  return "Enter a valid email";
                }
                return null;
              }, keyboardType: TextInputType.emailAddress),
              SizedBox(height: 16),
              CustomTextField("Phone Number", _phoneController, Icons.phone, (value) {
                if (value != null && value.isNotEmpty && !RegExp(r"^\d{10}$").hasMatch(value)) {
                  return "Enter a valid 10-digit number";
                }
                return null;
              }, keyboardType: TextInputType.phone),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  onPressed: updateUserProfile,
                  child: Text("Save Changes", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 5,
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
