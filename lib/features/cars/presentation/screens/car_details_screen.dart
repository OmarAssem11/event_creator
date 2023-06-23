import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_creator/features/cars/domain/entities/car.dart';
import 'package:event_creator/features/cars/presentation/cubit/cars_cubit.dart';
import 'package:event_creator/features/cars/presentation/widgets/car_rating_bar.dart';
import 'package:event_creator/generated/l10n.dart';
import 'package:event_creator/route_manager.dart';
import 'package:event_creator/ui/resources/theme_manager.dart';
import 'package:event_creator/ui/resources/values_manager.dart';
import 'package:event_creator/ui/widgets/default_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CarDetailsScreen extends StatelessWidget {
  const CarDetailsScreen(this.car);

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.carDetails),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Insets.l),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(Sizes.s16)),
              child: CachedNetworkImage(
                imageUrl: car.imageUrl,
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
            const SizedBox(height: Sizes.s12),
            Row(
              children: [
                Expanded(
                  child: DefaultElevatedButton(
                    label: S.current.book,
                    onPressed: () {
                      BlocProvider.of<CarsCubit>(context).carBookingData.carId =
                          car.id;
                      context.pushNamed(Routes.carBooking);
                    },
                  ),
                ),
                const SizedBox(width: Sizes.s8),
                ElevatedButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (_) => CarRatingBar(car: car),
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
