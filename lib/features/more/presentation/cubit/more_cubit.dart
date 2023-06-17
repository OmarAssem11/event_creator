import 'package:event_creator/features/more/domain/entities/contact_us_data.dart';
import 'package:event_creator/features/more/domain/usecases/contact_us.dart';
import 'package:event_creator/features/more/presentation/cubit/more_state.dart';
import 'package:event_creator/utils/exception/app_exception.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class MoreCubit extends Cubit<MoreState> {
  final ContactUs _contactUs;

  MoreCubit(
    this._contactUs,
  ) : super(MoreInitial());

  Future<void> contactUs(ContactUsData contactUsData) async {
    emit(MoreLoading());
    try {
      await _contactUs(contactUsData);
      emit(ContactUsSuccess());
    } on AppException catch (exception) {
      emit(MoreError(exception.message));
    }
  }
}
