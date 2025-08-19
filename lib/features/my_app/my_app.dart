import 'package:flutter/material.dart';

import '/../core/responsive/responsive_config.dart';
import '/../core/routing/router_generation_config.dart';
import '/../core/theme/app_themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return GestureDetector(
      onTap: () => unfocusScope(context),
      child: MaterialApp.router(
        title: 'My App',
        debugShowCheckedModeBanner: false,
        routerConfig: RouterGenerationConfig.goRouter,
        theme: Appthemes.lightTheme(),
      ),
    );
  }
}

void unfocusScope(BuildContext context) {
  final currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    currentFocus.unfocus();
  }
}
