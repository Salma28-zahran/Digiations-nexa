import 'package:digiations_nexa/features/home_manager/presentation/widgets/employee_details.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmployeeCard1 extends StatelessWidget {
  const EmployeeCard1({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const EmployeeDetails(),
          ),
        );
      },
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              blurRadius: 10,
              offset:  Offset(0, 4),
            )
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(
                    "https://i.pravatar.cc/150?img=3",
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [  Text(
                        "User Name",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                        SizedBox(height: 8,),

                        Container(
                          padding:  EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration:  BoxDecoration(
                            color: Color(0xFF2FA4FF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child:  Text(
                            "Check in",
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ]
                  ),
                ),

                Container(
                  padding:  EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:  Text(
                    "On time",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                SizedBox(width: 12),

                Text(
                  "9:00 am",
                  style: GoogleFonts.inter(
                    color: Colors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Break Details",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF7A5CFF),

                  ),
                ),

                SizedBox(width: 4),

                PopupMenuButton<String>(
                  offset:  Offset(0, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  icon:  Icon(
                    Icons.keyboard_arrow_down,
                    size: 22,
                    color: Color(0xFF7A5CFF),

                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem<String>(
                      value: "start",
                      child: Text(
                        "Break started at 9:00 am",
                        style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w500),
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: "duration",
                      child: Text(
                        "Finished at 10:00 am",
                        style: GoogleFonts.inter(fontSize: 16,fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ],
            )

          ],
        )
      ),
    );
  }
}
class EmployeeCard2 extends StatelessWidget {
  const EmployeeCard2({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const EmployeeDetails(),
          ),
        );
      },
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              blurRadius: 10,
              offset:  Offset(0, 4),
            )
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(
                    "https://i.pravatar.cc/150?img=3",
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [  Text(
                        "User Name",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                        SizedBox(height: 8,),
                        Container(
                          padding:  EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration:  BoxDecoration(
                            color: Color(0xFF2C3E50),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child:  Text(
                            "Check Out",
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ]
                  ),
                ),

                Container(
                  padding:  EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:  Text(
                    " Late ",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                SizedBox(width: 12),

                Text(
                  "9:00 am",
                  style: GoogleFonts.inter(
                    color: Colors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Break Details",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF7A5CFF),

                  ),
                ),

                SizedBox(width: 4),

                PopupMenuButton<String>(
                  offset:  Offset(0, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  icon:  Icon(
                    Icons.keyboard_arrow_down,
                    size: 22,
                    color: Color(0xFF7A5CFF),

                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem<String>(
                      value: "start",
                      child: Text(
                        "Break started at 9:00 am",
                        style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w500),
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: "duration",
                      child: Text(
                        "Finished at 10:00 am",
                        style: GoogleFonts.inter(fontSize: 16,fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ],
            )

          ],
        )
      ),
    );
  }
}
class EmployeeCard3 extends StatelessWidget {
  const EmployeeCard3({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const EmployeeDetails(),
          ),
        );
      },
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              blurRadius: 10,
              offset:  Offset(0, 4),
            )
          ],
        ),
        child:Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(
                    "https://i.pravatar.cc/150?img=3",
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [  Text(
                        "User Name",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                        SizedBox(height: 8,),
                        Container(
                          padding:  EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration:  BoxDecoration(
                            color: Color(0xFF7A5CFF),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child:  Text(
                            "Break",
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ]
                  ),
                ),

                Container(
                  padding:  EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:  Text(
                    " Late ",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                SizedBox(width: 12),

                Text(
                  "9:00 am",
                  style: GoogleFonts.inter(
                    color: Colors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Break Details",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF7A5CFF),

                  ),
                ),

                 SizedBox(width: 4),

                PopupMenuButton<String>(
                  offset:  Offset(0, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  icon:  Icon(
                    Icons.keyboard_arrow_down,
                    size: 22,
                    color: Color(0xFF7A5CFF),

                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem<String>(
                      value: "start",
                      child: Text(
                        "Break started at 9:00 am",
                        style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w500),
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: "duration",
                      child: Text(
                        "Finished at 10:00 am",
                        style: GoogleFonts.inter(fontSize: 16,fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ],
            )

          ],
        )

      ),
    );
  }
}
class EmployeeCard4 extends StatelessWidget {
  const EmployeeCard4({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const EmployeeDetails(),
          ),
        );
      },
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.05),
              blurRadius: 10,
              offset:  Offset(0, 4),
            )
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 22,
                  backgroundImage: NetworkImage(
                    "https://i.pravatar.cc/150?img=3",
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [  Text(
                        "User Name",
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                        SizedBox(height: 8,),
                        Container(
                          padding:  EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration:  BoxDecoration(
                            color: Color(0xFFE74C3C),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child:  Text(
                            "Absent",
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ]
                  ),
                ),

                Container(
                  padding:  EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:  Text(
                    "On Time",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                SizedBox(width: 12),

                Text(
                  "9:00 am",
                  style: GoogleFonts.inter(
                    color: Colors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Break Details",
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF7A5CFF),

                  ),
                ),

                SizedBox(width: 4),

                PopupMenuButton<String>(
                  offset:  Offset(0, 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  icon:  Icon(
                    Icons.keyboard_arrow_down,
                    size: 22,
                    color: Color(0xFF7A5CFF),

                  ),
                  itemBuilder: (context) => [
                    PopupMenuItem<String>(
                      value: "start",
                      child: Text(
                        "Break started at 9:00 am",
                        style: GoogleFonts.inter(fontSize: 14,fontWeight: FontWeight.w500),
                      ),
                    ),
                    PopupMenuItem<String>(
                      value: "duration",
                      child: Text(
                        "Finished at 10:00 am",
                        style: GoogleFonts.inter(fontSize: 16,fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}