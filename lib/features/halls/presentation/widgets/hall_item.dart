import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_creator/features/halls/domain/entities/hall.dart';
import 'package:event_creator/generated/l10n.dart';
import 'package:event_creator/ui/resources/theme_manager.dart';
import 'package:event_creator/ui/resources/values_manager.dart';
import 'package:flutter/material.dart';

class HallItem extends StatelessWidget {
  const HallItem(this.hall);

  final Hall hall;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Insets.l),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(Sizes.s16)),
            child: CachedNetworkImage(
              imageUrl: hall.imageUrl,
              errorWidget: (_, __, ___) => const Icon(
                Icons.image_outlined,
                size: Sizes.s80,
                color: ColorPalette.grey,
              ),
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
            ),
          ),
          const SizedBox(height: Sizes.s12),
          Text(
            hall.description,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: Sizes.s12),
          Row(
            children: [
              Text(
                '${S.current.capacity}: ${hall.numOfPeople} ${S.current.peoples}',
              ),
              const Spacer(),
              if (hall.rating != null) ...[
                Text('${hall.rating}'),
                const Icon(
                  Icons.star_rounded,
                  color: ColorPalette.gold,
                ),
              ]
            ],
          ),
        ],
      ),
    );
  }
}
