import 'package:flutter/material.dart';

import '../../widgets/employee_cards.dart';

class MobileBody extends StatelessWidget {
  const MobileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        EmployeeCard1(),
        SizedBox(height: 8,),
        EmployeeCard2(),
        SizedBox(height: 8,),
        EmployeeCard4(),
        SizedBox(height: 8,),
        EmployeeCard3(),


      ],
    );
  }
}