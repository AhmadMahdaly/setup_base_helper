// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:.../core/di.dart';
import 'package:go_router/go_router.dart';
import '../routing/app_routes.dart';
// import '../views/splash_view.dart';

class RouterGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.splashScreen,
    routes: [
      GoRoute(
        path: AppRoutes.splashScreen,
        name: AppRoutes.splashScreen,
        // builder: (context, state) => const SplashView(),
      ),
     // GoRoute(
     // path: AppRoutes.editTransactionScreen,
     // name: AppRoutes.editTransactionScreen,
     // builder: (context, state) {
     //   final transaction = state.extra! as Transaction;
     //   return BlocProvider.value(
     //     value: sl<TransactionCubit>(),
     //     child: EditTransactionScreen(
     //       transaction: transaction,
     //     ),
     //   );
     // },
     //),
    ],
  );
}
