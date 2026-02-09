import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  bool isEditingName = false;
  TextEditingController nameController =
  TextEditingController(text: "Mohamed Mostafa");

  Future<void> pickImage() async {
    final XFile? image =
    await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _selectedImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 20),

              // Title
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Profile Details",
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.grey.shade300,
                    backgroundImage:
                    _selectedImage != null ? FileImage(_selectedImage!) : null,
                    child: _selectedImage == null
                        ? const Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.grey,
                    )
                        : null,
                  ),

                  GestureDetector(
                    onTap: pickImage,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.edit,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  isEditingName
                      ? SizedBox(
                    width: 180,
                    child: TextField(
                      controller: nameController,
                      autofocus: true,
                      decoration: const InputDecoration(
                        isDense: true,
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  )
                      : Text(
                    nameController.text,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(width: 8),

                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isEditingName = !isEditingName;
                      });
                    },
                    child: Icon(
                      isEditingName ? Icons.check : Icons.edit,
                      size: 18,
                      color: isEditingName ? Colors.green : Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text(
                "Flutter Developer",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 220),

              SizedBox(
                width: 180,
                height: 48,
                child: OutlinedButton(
                  onPressed: () {
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.red.withOpacity(0.08),
                    side: const BorderSide(
                      color: Colors.red,
                      width: 1.5,
                    ),

                  ),
                  child: Text(
                    "Reset Password",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.red,
                    ),
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
