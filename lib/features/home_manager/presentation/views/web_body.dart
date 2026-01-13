import 'package:flutter/material.dart';

import '../widgets/employee_cards.dart';

class WebBody extends StatelessWidget {
  const WebBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        MeetingCard(),
        SizedBox(height: 8,),
        MeetingCard(),
        SizedBox(height: 8,),

        MeetingCard(),

      ],
    );
  }
}