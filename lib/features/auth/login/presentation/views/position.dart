import 'package:digiations_nexa/core/route/routes.dart';
import 'package:digiations_nexa/core/widgets/constants/user_role.dart';
import 'package:digiations_nexa/core/widgets/storage/UserRoleStorage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Position extends StatelessWidget {
  const Position({super.key});

  @override
  Widget build(BuildContext context) {
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
                  "assets/images/logo2.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
              child: GestureDetector(

                  onTap: () async {
                    await UserRoleStorage.saveRole(UserRole.manager);
                    Navigator.pushNamed(context, PageRouteName.login);
                  },


                child: Container(
                  height: screenHeight * 0.07,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
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
                      "manager",
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
            SizedBox(height: screenHeight * 0.035),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
              child: GestureDetector(
                onTap: () async {
                  await UserRoleStorage.saveRole(UserRole.employee);
                  Navigator.pushNamed(context, PageRouteName.department);
                },

                child: Container(
                  height: screenHeight * 0.07,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
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
                      "emloyee",
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
          ],
        ),
      ),
    );
  }
}
