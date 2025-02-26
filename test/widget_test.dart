import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UploadImageScreen extends StatefulWidget {
  @override
  _UploadImageScreenState createState() => _UploadImageScreenState();
}

class _UploadImageScreenState extends State<UploadImageScreen> {
  final ImagePicker _picker = ImagePicker();
  File? _selectedImage;
  bool _isUploading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _pickAndUploadImage() async {
    try {
      // Pick an image
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image == null) return;

      setState(() {
        _selectedImage = File(image.path);
        _isUploading = true;
      });

      // Upload to Cloudinary
      String imageUrl = await _uploadToCloudinary(_selectedImage!);

      if (imageUrl.isNotEmpty) {
        await _saveToFirestore(imageUrl);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Profile image updated successfully!")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to upload image")),
        );
      }
    } catch (e) {
      print("Error: $e");
    } finally {
      setState(() {
        _isUploading = false;
      });
    }
  }

  // Upload image to Cloudinary
  Future<String> _uploadToCloudinary(File imageFile) async {
    try {
      String cloudinaryUrl = "https://api.cloudinary.com/v1_1/YOUR_CLOUD_NAME/image/upload";
      String uploadPreset = "YOUR_UPLOAD_PRESET"; // Set this in Cloudinary settings

      var request = http.MultipartRequest("POST", Uri.parse(cloudinaryUrl))
        ..fields['upload_preset'] = uploadPreset
        ..files.add(await http.MultipartFile.fromPath('file', imageFile.path));

      var response = await request.send();
      var responseData = await response.stream.bytesToString();
      var jsonResponse = json.decode(responseData);

      if (response.statusCode == 200) {
        return jsonResponse["secure_url"];
      } else {
        print("Upload failed: ${jsonResponse['error']['message']}");
        return "";
      }
    } catch (e) {
      print("Cloudinary Error: $e");
      return "";
    }
  }

  // Save the image URL to Firestore under "profileImage"
  Future<void> _saveToFirestore(String imageUrl) async {
    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await _firestore.collection('users').doc(user.uid).update({
          'profileImage': imageUrl,
        });
        print("Profile image updated in Firestore: $imageUrl");
      }
    } catch (e) {
      print("Firestore Error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Upload Profile Image")),
      body: Center(
        child: GestureDetector(
          onTap: _pickAndUploadImage,
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.blue, width: 2),
            ),
            child: _isUploading
                ? Center(child: CircularProgressIndicator())
                : _selectedImage != null
                ? Image.file(_selectedImage!, fit: BoxFit.cover)
                : Icon(Icons.cloud_upload, size: 50, color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
