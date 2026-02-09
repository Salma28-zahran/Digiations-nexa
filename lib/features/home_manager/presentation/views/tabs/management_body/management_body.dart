import 'package:digiations_nexa/features/home_manager/presentation/views/tabs/management_body/widgets/management_card.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/route/routes.dart';

class ManagementBody extends StatelessWidget {
  const ManagementBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        ManagementCard(
          title: 'Projects',
          subtitle: 'View & manage projects',
          icon: Icons.folder,
          onArrowTap: (){
            Navigator.pushNamed(
                context, PageRouteName.projects);
          },
        ),
        SizedBox(height: 12),
        ManagementCard(
          title: 'Tasks',
          subtitle: 'View & manage tasks',
          icon: Icons.check_circle,
          onArrowTap:(){
            Navigator.pushNamed(
                context, PageRouteName.tasks);
          },
        ),
      ],
    );
  }
}
