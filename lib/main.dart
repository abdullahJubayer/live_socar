import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:live_score/screen/dashboard/bloc/dashboard_bloc.dart';
import 'package:live_score/screen/dashboard/bloc/dashboard_event.dart';
import 'package:live_score/screen/dashboard/data/model/fixtures_request.dart';
import 'package:live_score/screen/dashboard/ui/dashboard_screen.dart';
import 'package:live_score/screen/login/bloc/login_bloc.dart';
import 'package:live_score/screen/point_table/bloc/standing_bloc.dart';
import 'package:live_score/screen/point_table/ui/standing_screen.dart';
import 'package:live_score/screen/registration/bloc/signup_bloc.dart';
import 'package:live_score/utils/di/inject_module.dart' as di;
import 'package:live_score/utils/firebase/firebase_options.dart';
import 'package:live_score/utils/route/app_route.dart';
import 'package:live_score/utils/theme/custom_themes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:live_score/utils/theme/theme_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.setup();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        BlocProvider(
          create: (_) => SignupBloc(),
        ),
        BlocProvider(
          create: (_) => LoginBloc(),
        ),
        BlocProvider(
          create: (_) => DashboardBloc(),
        ),
        BlocProvider(
          create: (_) => StandingBloc(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, AppTheme>(
        builder: (context, state) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Live Score',
          theme: AppThemes.appThemeData[state],
          onGenerateRoute: onGenerateRoute,
          home: const StandingScreen(),
        ),
      ),
    );
  }
}
