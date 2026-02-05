import 'package:digiations_nexa/features/home_manager/presentation/widgets/employee_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmployeeCard1 extends StatefulWidget {
  const EmployeeCard1({super.key});

  @override
  State<EmployeeCard1> createState() => _EmployeeCard1State();
}

class _EmployeeCard1State extends State<EmployeeCard1> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const EmployeeDetails()),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1F1F1F) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color:  Colors.grey,
            width: 2,
          ),
        ),
        child: AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage(
                      "https://i.pravatar.cc/150?img=3",
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "User Name",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Colors.green,
                                      width: 2,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.green.withOpacity(0.1),
                                        blurRadius: 6,
                                        spreadRadius: -2,
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    "On time",
                                    style: GoogleFonts.poppins(
                                      color: Colors.green,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  "9:00 am",
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                         SizedBox(height: 6),

                        Row(
                          children: [
                            Container(
                              padding:  EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color:  Color(0xFF2FA4FF),
                                  width: 2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color:  Color(0xFF2FA4FF).withOpacity(0.1),
                                    blurRadius: 6,
                                    spreadRadius: -2,
                                  ),
                                ],
                              ),
                              child: Text(
                                "Check in",
                                style: GoogleFonts.poppins(
                                  color:  Color(0xFF2FA4FF),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                             Spacer(),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isExpanded = !isExpanded;
                                });
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "Break Details",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color:  Color(0xFF4A90E2),
                                    ),
                                  ),
                                   SizedBox(width: 4),
                                  AnimatedRotation(
                                    turns: isExpanded ? 0.5 : 0,
                                    duration:  Duration(milliseconds: 300),
                                    child:  Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 22,
                                      color: Color(0xFF4A90E2),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              if (isExpanded) ...[
                 SizedBox(height: 12),
               SizedBox(
                 width: double.infinity,
                 child: Column(
                   children: [
                     Text(
                       "Break started at 9:00 am",
                       textAlign: TextAlign.center,
                       style: GoogleFonts.poppins(
                         fontSize: 14,
                         fontWeight: FontWeight.w500,

                       ),
                     ),
                     SizedBox(height: 6),
                     Text(
                       "Finished at 10:00 am",
                       textAlign: TextAlign.center,
                       style: GoogleFonts.poppins(
                         fontSize: 14,
                         fontWeight: FontWeight.w500,
                       ),
                     ),
                     SizedBox(height: 6),
                     Text(
                       "Total break: 1 hour",
                       textAlign: TextAlign.center,
                       style: GoogleFonts.poppins(
                         fontSize: 14,
                         fontWeight: FontWeight.w500,
                       ),
                     )
                   ],
                 ),
               )
              ],
            ],
          ),
        ),
      ),
    );

  }
}

class EmployeeCard2 extends StatefulWidget {
  const EmployeeCard2({super.key});

  @override
  State<EmployeeCard2> createState() => _EmployeeCard2State();
}

class _EmployeeCard2State extends State<EmployeeCard2> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const EmployeeDetails()),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1F1F1F) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color:  Colors.grey,
            width: 2,
          ),
        ),
        child: AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage(
                      "https://i.pravatar.cc/150?img=3",
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "User Name",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Colors.orangeAccent,
                                      width: 2,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.orangeAccent.withOpacity(0.1),
                                        blurRadius: 6,
                                        spreadRadius: -2,
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    "late",
                                    style: GoogleFonts.poppins(
                                      color: Colors.orangeAccent,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  "9:00 am",
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 6),

                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color:  Color(0xFF2C3E50),
                                  width: 2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color:  Color(0xFF2C3E50).withOpacity(0.1),
                                    blurRadius: 6,
                                    spreadRadius: -2,
                                  ),
                                ],
                              ),
                              child: Text(
                                "Check Out",
                                style: GoogleFonts.poppins(
                                  color:  Color(0xFF2C3E50),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isExpanded = !isExpanded;
                                });
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "Break Details",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF4A90E2),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  AnimatedRotation(
                                    turns: isExpanded ? 0.5 : 0,
                                    duration: const Duration(milliseconds: 300),
                                    child: const Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 22,
                                      color: Color(0xFF4A90E2),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              if (isExpanded) ...[
                SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        "Break started at 9:00 am",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,

                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Finished at 10:00 am",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Total break: 1 hour",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ],
          ),
        ),
      ),
    );

  }
}

class EmployeeCard3 extends StatefulWidget {
  const EmployeeCard3({super.key});

  @override
  State<EmployeeCard3> createState() => _EmployeeCard3State();
}

class _EmployeeCard3State extends State<EmployeeCard3> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const EmployeeDetails()),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1F1F1F) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color:  Colors.grey,
            width: 2,
          ),
        ),
        child: AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage(
                      "https://i.pravatar.cc/150?img=3",
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "User Name",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Colors.orangeAccent,
                                      width: 2,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.orangeAccent.withOpacity(0.1),
                                        blurRadius: 6,
                                        spreadRadius: -2,
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    "late",
                                    style: GoogleFonts.poppins(
                                      color: Colors.orangeAccent,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  "9:00 am",
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        const SizedBox(height: 6),

                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color:  Color(0xFF7A5CFF),
                                  width: 2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color:  Color(0xFF7A5CFF).withOpacity(0.1),
                                    blurRadius: 6,
                                    spreadRadius: -2,
                                  ),
                                ],
                              ),
                              child: Text(
                                "Break",
                                style: GoogleFonts.poppins(
                                  color:  Color(0xFF7A5CFF),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isExpanded = !isExpanded;
                                });
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "Break Details",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xFF4A90E2),
                                    ),
                                  ),
                                  const SizedBox(width: 4),
                                  AnimatedRotation(
                                    turns: isExpanded ? 0.5 : 0,
                                    duration: const Duration(milliseconds: 300),
                                    child: const Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 22,
                                      color: Color(0xFF4A90E2),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              if (isExpanded) ...[
                SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        "Break started at 9:00 am",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,

                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Finished at 10:00 am",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Total break: 1 hour",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ],
          ),
        ),
      ),
    );

  }
}

class EmployeeCard4 extends StatefulWidget {
  const EmployeeCard4({super.key});

  @override
  State<EmployeeCard4> createState() => _EmployeeCard4State();
}

class _EmployeeCard4State extends State<EmployeeCard4> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const EmployeeDetails()),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: isDark ? const Color(0xFF1F1F1F) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color:  Colors.grey,
            width: 2,
          ),
        ),
        child: AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage(
                      "https://i.pravatar.cc/150?img=3",
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "User Name",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: Colors.green,
                                      width: 2,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.green.withOpacity(0.1),
                                        blurRadius: 6,
                                        spreadRadius: -2,
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    "On time",
                                    style: GoogleFonts.poppins(
                                      color: Colors.green,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  "9:00 am",
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        SizedBox(height: 6),

                        Row(
                          children: [
                            Container(
                              padding:  EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: Color(0xFFE74C3C),
                                  width: 2,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color:  Color(0xFFE74C3C).withOpacity(0.1),
                                    blurRadius: 6,
                                    spreadRadius: -2,
                                  ),
                                ],
                              ),
                              child: Text(
                                "Absent",
                                style: GoogleFonts.poppins(
                                  color:  Color(0xFFE74C3C),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Spacer(),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isExpanded = !isExpanded;
                                });
                              },
                              child: Row(
                                children: [
                                  Text(
                                    "Break Details",
                                    style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color:  Color(0xFF4A90E2),
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  AnimatedRotation(
                                    turns: isExpanded ? 0.5 : 0,
                                    duration:  Duration(milliseconds: 300),
                                    child:  Icon(
                                      Icons.keyboard_arrow_down,
                                      size: 22,
                                      color: Color(0xFF4A90E2),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              if (isExpanded) ...[
                SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        "Break started at 9:00 am",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,

                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Finished at 10:00 am",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Total break: 1 hour",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ],
          ),
        ),
      ),
    );

  }
}
