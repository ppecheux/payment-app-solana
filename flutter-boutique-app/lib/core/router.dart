import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sollet/models/wallet_provider.dart';
import 'package:sollet/pages/error_page.dart';
import 'package:sollet/pages/loading_page.dart';
import 'package:sollet/pages/main_page.dart';
import 'package:sollet/pages/wallet_connect_page.dart';

enum Routes {
  connect,
  home,
  loading,
}

final router = GoRouter(
  routes: [
    GoRoute(
      name: Routes.connect.name,
      path: "/connect",
      builder: (context, state) => const WalletConnectPage(),
    ),
    GoRoute(
      name: Routes.home.name,
      path: "/",
      builder: (context, state) {
        return const MainPage();
      },
      redirect: (context, state) {
        if (Provider.of<WalletModel>(context, listen: false).wallet == null) {
          return "/connect";
        }
        if (state.queryParams['firstConnection'] == "true") {
          return "/loading";
        }
        return null;
      },
    ),
    GoRoute(
      name: Routes.loading.name,
      path: "/loading",
      builder: (context, state) => const LoadingPage(),
    ),
    // GoRoute(
    //   path: "/dynamic/:dynamic",
    //   name: Routes.paths.name,
    //   builder: (context, state) => Page(state.params["dynamic"]!),
    // ),
  ],
  errorBuilder: (context, state) => const ErrorPage(),
);
