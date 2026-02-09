import 'package:flutter/material.dart';

class ManagementCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onArrowTap;
  const ManagementCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onArrowTap,

  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding:  EdgeInsets.all(14),
        decoration: BoxDecoration(
            color: isDark ? Colors.transparent : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1.5,
          )
        ),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color:  Color(0xFF4A90E2).withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color:  Color(0xFF4A90E2),
                size: 22,
              ),
            ),
      
             SizedBox(width: 12),
      
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style:  TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                   SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
      
            GestureDetector(
              onTap: onArrowTap,
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: const Color(0xFF4A90E2).withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                child:  Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Color(0xFF4A90E2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
