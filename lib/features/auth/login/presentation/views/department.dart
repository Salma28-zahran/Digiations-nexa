import 'package:digiations_nexa/core/route/routes.dart';
import 'package:digiations_nexa/core/widgets/constants/user_role.dart';
import 'package:digiations_nexa/core/widgets/storage/UserRoleStorage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Department extends StatelessWidget {
  const Department({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.2),

            Center(
              child: SizedBox(
                width: screenWidth * 0.75,
                child: Image.asset(
                  "assets/images/auth_logo.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.08),

            Padding(
              padding:
              EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
              child: GestureDetector(
                onTap: () async {
                  await UserRoleStorage.saveRole(UserRole.employee);
                  Navigator.pushNamed(context, PageRouteName.login);
                },
                child: Container(
                  height: screenHeight * 0.07,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                      color: Color(0xFF4A90E2)
                  ),
                  child: Center(
                    child: Text(
                      "web",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: screenHeight * 0.02,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: screenHeight * 0.035),

            Padding(
              padding:
              EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
              child: GestureDetector(
                onTap: () async {
                  await UserRoleStorage.saveRole(UserRole.employee);
                  Navigator.pushNamed(context, PageRouteName.login);
                },
                child: Container(
                  height: screenHeight * 0.07,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                      color: Color(0xFF4A90E2)
                  ),
                  child: Center(
                    child: Text(
                      "mobile",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: screenHeight * 0.02,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
