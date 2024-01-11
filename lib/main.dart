import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:live_score/screen/registration/ui/registration_screen.dart';
import 'package:live_score/utils/di/inject_module.dart' as di;
import 'package:live_score/utils/firebase/firebase_options.dart';
import 'package:live_score/utils/route/app_route.dart';
import 'package:live_score/utils/theme/custom_themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score/utils/theme/theme_cubit.dart';

void main() async {
  di.setup();
  //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ThemeCubit()..getCurrentTheme(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, AppTheme>(
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Live Score',
          theme: AppThemes.appThemeData[state],
          onGenerateRoute: onGenerateRoute,
          home: const RegistrationScreen(),
        ),
      ),
    );
  }
}