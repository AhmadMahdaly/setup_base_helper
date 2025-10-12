// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:.../core/di.dart';
import 'package:go_router/go_router.dart';
import '/../core/constants.dart';
import '/../core/routing/app_routes.dart';
// import '../views/splash_view.dart';

class RouterGenerationConfig {
  static GoRouter goRouter = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: AppRoutes.splashScreen,
    routes: [
      GoRoute(
        path: AppRoutes.splashScreen,
        name: AppRoutes.splashScreen,
        // builder: (context, state) => const SplashView(),
      ),

      /// ------------- < >  -------------
      // GoRoute(
      //     path: AppRoutes.allCoursesScreen,
      //     name: AppRoutes.allCoursesScreen,
      //     builder: (context, state) {
      //       final args = state.extra! as Map<String, dynamic>;
      //       final title = args['title'] as String;
      //       final subject = args['items'] as List<Course>;
      //       final subscriptions = args['subscriptions'] as List<Subscription>;
      //       final currencySymbol = args['currencySymbol'] as String?;
      //       return BlocProvider<CartBloc>.value(
      //         value: getIt<CartBloc>(),
      //         child: AllContentScreen(
      //           items: subject,
      //           title: title,
      //           subscriptions: subscriptions,
      //           currencySymbol: currencySymbol,
      //         ),
      //       );
      //     },
      //   ),
    ],
  );
}
