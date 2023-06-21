import 'package:event_creator/features/more/domain/entities/team_member.dart';
import 'package:event_creator/features/more/presentation/widgets/team_member_item.dart';
import 'package:event_creator/generated/assets.gen.dart';
import 'package:event_creator/generated/l10n.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen();

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  final _teamMembers = [
    TeamMember(
      name: 'Abelrahman Shoukry',
      title: 'Team Leader - Web Developer',
      description: 'description ' * 20,
      imagePath: Assets.images.abdelrahman.path,
    ),
    TeamMember(
      name: 'Eslam Khedr',
      title: 'Web Developer',
      description: 'description ' * 20,
      imagePath: Assets.images.eslam.path,
    ),
    TeamMember(
      name: 'Mohamed Ezzat',
      title: 'Flutter Developer',
      description: 'description ' * 20,
      imagePath: Assets.images.mohamed.path,
    ),
    TeamMember(
      name: 'Arsany',
      title: 'Flutter Developer',
      description: 'description ' * 20,
      imagePath: Assets.images.arsany.path,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.aboutUs),
      ),
      body: ListView(
        children: _teamMembers
            .map((teamMember) => TeamMemberItem(teamMember))
            .toList(),
      ),
    );
  }
}
