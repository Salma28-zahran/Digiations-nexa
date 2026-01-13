import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../../../../../core/route/routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscurePassword = true;
  File? _profileImage;
  final ImagePicker _picker = ImagePicker();
  OutlineInputBorder _border(double radius) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(18),
      borderSide: const BorderSide(
        color: Color(0xFFB9C0FF),
      ),
    );
  }
  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );

    if (image != null) {
      setState(() {
        _profileImage = File(image.path);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: screenWidth * 0.75,
                child: Image.asset(
                  "assets/images/logo2.png",
                  fit: BoxFit.contain,
                ),
              ),
              GestureDetector(
                onTap: _pickImage,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color:  Color(0xFFB9C0FF),
                      width: 3,
                    ),
                    gradient:  LinearGradient(
                      colors: [
                        Color(0xFFEAF2FF),
                        Color(0xFFF1EDFF),
                      ],
                    ),
                  ),
                  child: CircleAvatar(
                    radius: screenWidth * 0.15,
                    backgroundColor: Colors.transparent,
                    backgroundImage:
                    _profileImage != null ? FileImage(_profileImage!) : null,
                    child: _profileImage == null
                        ? Icon(
                      Icons.camera_alt,
                      size: screenWidth * 0.08,
                      color: const Color(0xFF7A5CFF),
                    )
                        : null,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                "Profile Image",
                style: GoogleFonts.inter(
                  fontSize: screenHeight * 0.02,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF7A5CFF),
                  letterSpacing: 0.3,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: TextField(
                  style: GoogleFonts.inter(fontSize: screenHeight * 0.02),
                  decoration: InputDecoration(
                    hintText: "Full Name",
                    hintStyle: GoogleFonts.inter(
                      color: Colors.grey,
                      fontSize: screenHeight * 0.02,
                    ),
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Color(0xFF7A5CFF),
                    ),
                    enabledBorder: _border(screenHeight * 0.04),
                    focusedBorder: _border(screenHeight * 0.04),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.022,
                      horizontal: screenWidth * 0.05,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: TextField(
                  style: GoogleFonts.inter(fontSize: screenHeight * 0.02),
                  decoration: InputDecoration(
                    hintText: "Email",
                    hintStyle: GoogleFonts.inter(
                      color: Colors.grey,
                      fontSize: screenHeight * 0.02,
                    ),
                    prefixIcon: const Icon(
                      Icons.email_outlined,
                      color: Color(0xFF7A5CFF),
                    ),
                    enabledBorder: _border(screenHeight * 0.04),
                    focusedBorder: _border(screenHeight * 0.04),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.022,
                      horizontal: screenWidth * 0.05,
                    ),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.02),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: TextField(
                  obscureText: _obscurePassword,
                  style: GoogleFonts.inter(fontSize: screenHeight * 0.02),
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: GoogleFonts.inter(
                      color: Colors.grey,
                      fontSize: screenHeight * 0.02,
                    ),
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                      color: Color(0xFF7A5CFF),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: const Color(0xFF7A5CFF),
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    enabledBorder: _border(screenHeight * 0.04),
                    focusedBorder: _border(screenHeight * 0.04),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.025,
                      horizontal: screenWidth * 0.05,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.015),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, PageRouteName.login);
                  },
                  child: Container(
                    height: screenHeight * 0.07,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(screenHeight * 0.018),
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF2FA4FF),
                          Color(0xFF7A5CFF),
                          Color(0xFFFF4FD8),
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Register",
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: screenHeight * 0.02,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.012),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "already have an account? ",
                    style: GoogleFonts.inter(
                      color: Colors.grey,
                      fontSize: screenHeight * 0.016,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, PageRouteName.login);

                    },
                    child: Text(
                      "login",
                      style: GoogleFonts.inter(
                        color: const Color(0xFF7A5CFF),
                        fontSize: screenHeight * 0.016,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
