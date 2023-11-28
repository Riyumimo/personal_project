import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<bool?> {
  ThemeCubit() : super(null);
  void chnageTheme() {
    if (state != null) {
      if (state!) {
        emit(false);
      } else {
        emit(true);
      }
    }
    emit(false);
  }
}
