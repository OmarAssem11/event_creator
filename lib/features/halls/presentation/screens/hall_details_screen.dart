import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_creator/features/halls/domain/entities/hall.dart';
import 'package:event_creator/features/halls/presentation/cubit/halls_cubit.dart';
import 'package:event_creator/features/halls/presentation/widgets/hall_rating_bar.dart';
import 'package:event_creator/generated/l10n.dart';
import 'package:event_creator/route_manager.dart';
import 'package:event_creator/ui/resources/theme_manager.dart';
import 'package:event_creator/ui/resources/values_manager.dart';
import 'package:event_creator/ui/widgets/default_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HallDetailsScreen extends StatelessWidget {
  const HallDetailsScreen(this.hall);

  final Hall hall;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.hallDetails),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Insets.l),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            const SizedBox(height: Sizes.s12),
            Text('${S.current.price}: ${hall.price} ${S.current.egp}'),
            const SizedBox(height: Sizes.s12),
            Row(
              children: [
                Expanded(
                  child: DefaultElevatedButton(
                    label: S.current.book,
                    onPressed: () {
                      BlocProvider.of<HallsCubit>(context)
                          .hallBookingData
                          .hallId = hall.id;
                      context.pushNamed(Routes.hallBooking);
                    },
                  ),
                ),
                const SizedBox(width: Sizes.s8),
                ElevatedButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (_) => HallRatingBar(hallId: hall.id),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(
                      double.infinity,
                      MediaQuery.of(context).size.height * 0.06,
                    ),
                    backgroundColor: ColorPalette.grey,
                  ),
                  child: Row(
                    children: [
                      Text(S.current.rate),
                      const SizedBox(width: Sizes.s4),
                      const Icon(
                        Icons.rate_review_outlined,
                        size: Sizes.s20,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
