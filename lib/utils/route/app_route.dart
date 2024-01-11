import 'package:flutter/material.dart';

class RouteName {
  static String home = "/home";
  static String login = "/login";
  static String loginVerification = "/login_verification";
  static String loginSuccess = "/login_success";
  static String registration = "/registration";
}

Map<String, WidgetBuilder> routes({Object? arg}) => {
      // RouteName.login: (context) => ProductDetailsScreen(id: arg != null ? arg as int : 0),
    };

Route<dynamic> onGenerateRoute(RouteSettings routeSettings) {
  final Function? builder = routes(arg: routeSettings.arguments)[routeSettings.name];
  if (builder != null) {
    final Route route = MaterialPageRoute(settings: routeSettings, builder: (context) => builder(context));
    return route;
  } else {
    return MaterialPageRoute(builder: (_) => Scaffold(appBar: AppBar(title: const Text('Error'),),
              body: Center(
                child: Text('Page not found for ${routeSettings.name}'),
              ),
            ));
  }
}
