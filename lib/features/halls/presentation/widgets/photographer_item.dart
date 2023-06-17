import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_creator/features/halls/domain/entities/photographer.dart';
import 'package:event_creator/features/halls/presentation/cubit/halls_cubit.dart';
import 'package:event_creator/generated/l10n.dart';
import 'package:event_creator/ui/resources/theme_manager.dart';
import 'package:event_creator/ui/resources/values_manager.dart';
import 'package:event_creator/ui/widgets/default_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotographerItem extends StatelessWidget {
  const PhotographerItem(this.photographer);

  final Photographer photographer;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Insets.xxs,
        horizontal: Insets.m,
      ),
      child: Card(
        elevation: Sizes.s20,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(Sizes.s16)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(Insets.m),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.all(Radius.circular(Sizes.s16)),
                child: CachedNetworkImage(
                  imageUrl: photographer.imageUrl,
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
              Text('${S.current.price} ${photographer.price} ${S.current.egp}'),
              const SizedBox(height: Sizes.s12),
              Text(photographer.description),
              const SizedBox(height: Sizes.s12),
              DefaultOutlinedButton(
                label: S.current.select,
                onPressed: () {
                  final hallsCubit = BlocProvider.of<HallsCubit>(context);
                  hallsCubit.hallBookingData.photographerId = photographer.id;
                  hallsCubit.bookHall();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
