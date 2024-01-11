import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score/utils/storage/shared_pref/shared_pref.dart';

import '../di/inject_module.dart';
import 'custom_themes.dart';

class ThemeCubit extends Cubit<AppTheme> {
  ThemeCubit() : super(AppTheme.light);

  final _sharePref = di.get<SharedPreference>();

  void getCurrentTheme() {
    final theme = _sharePref.getTheme();
    if (theme != null) {
      if (theme == AppTheme.light.name) {
        emit(AppTheme.light);
      } else {
        emit(AppTheme.dark);
      }
    } else {
      emit(AppTheme.light);
    }
  }

  void switchTheme() {
    if (state == AppTheme.dark) {
      _sharePref.setTheme(AppTheme.light.name);
    } else {
      _sharePref.setTheme(AppTheme.dark.name);
    }
    getCurrentTheme();
  }
}
