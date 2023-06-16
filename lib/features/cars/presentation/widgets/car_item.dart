import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_creator/features/cars/domain/entities/car.dart';
import 'package:event_creator/generated/l10n.dart';
import 'package:event_creator/route_manager.dart';
import 'package:event_creator/ui/resources/theme_manager.dart';
import 'package:event_creator/ui/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CarItem extends StatelessWidget {
  const CarItem(this.car);

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Insets.l),
      child: InkWell(
        onTap: () => context.pushNamed(Routes.carDetails, extra: car),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(Sizes.s16)),
              child: CachedNetworkImage(
                imageUrl: car.imageUrl,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: Sizes.s12),
            Text(
              car.description,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: Sizes.s12),
            Row(
              children: [
                Text('${S.current.model}: ${car.brand} ${car.model}'),
                const Spacer(),
                Text('${car.rating}'),
                const Icon(
                  Icons.star_rounded,
                  color: ColorPalette.gold,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
