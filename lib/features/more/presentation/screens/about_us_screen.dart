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
      name: 'Name Name',
      title: 'Title',
      description: 'description ' * 20,
      imagePath: Assets.images.person1.path,
    ),
    TeamMember(
      name: 'Name Name',
      title: 'Title',
      description: 'description ' * 20,
      imagePath: Assets.images.person2.path,
    ),
    TeamMember(
      name: 'Name Name',
      title: 'Title',
      description: 'description ' * 20,
      imagePath: Assets.images.person3.path,
    ),
    TeamMember(
      name: 'Name Name',
      title: 'Title',
      description: 'description ' * 20,
      imagePath: Assets.images.person4.path,
    ),
    TeamMember(
      name: 'Name Name',
      title: 'Title',
      description: 'description ' * 20,
      imagePath: Assets.images.person5.path,
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
