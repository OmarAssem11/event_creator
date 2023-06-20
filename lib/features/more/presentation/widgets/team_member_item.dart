import 'package:event_creator/features/more/domain/entities/team_member.dart';
import 'package:event_creator/ui/resources/theme_manager.dart';
import 'package:event_creator/ui/resources/values_manager.dart';
import 'package:flutter/material.dart';

class TeamMemberItem extends StatefulWidget {
  const TeamMemberItem(this.teamMember);

  final TeamMember teamMember;

  @override
  State<TeamMemberItem> createState() => _TeamMemberItemState();
}

class _TeamMemberItemState extends State<TeamMemberItem> {
  late TextTheme _textTheme;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _textTheme = Theme.of(context).textTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Insets.xxs,
        horizontal: Insets.s,
      ),
      child: Card(
        elevation: Sizes.s20,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(Sizes.s16)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(Insets.s),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.teamMember.name,
                    style: _textTheme.titleMedium,
                  ),
                  const SizedBox(width: Sizes.s4),
                  Text(
                    '(${widget.teamMember.title})',
                    style: _textTheme.bodyMedium
                        ?.copyWith(color: ColorPalette.darkGrey),
                  ),
                ],
              ),
              const SizedBox(height: Sizes.s12),
              ClipRRect(
                borderRadius:
                    const BorderRadius.all(Radius.circular(Sizes.s16)),
                child: Image.asset(
                  widget.teamMember.imagePath,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: double.infinity,
                ),
              ),
              const SizedBox(height: Sizes.s12),
              Text(widget.teamMember.description),
            ],
          ),
        ),
      ),
    );
  }
}
