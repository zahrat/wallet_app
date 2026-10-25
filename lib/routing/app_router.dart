import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_app/routing/app_routes.dart';
import 'package:wallet_app/ui/core/ui/scaffold_with_nav_bar.dart';
import 'package:wallet_app/ui/index.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.home.path,
  navigatorKey: _rootNavigatorKey,
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          ScaffoldWithNavBar(navigationShell: navigationShell),
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              builder: (context, state) => const HomeScreen(),
              path: AppRoutes.home.path,
              name: AppRoutes.home.name,
              routes: [
                GoRoute(
                  path: 'transactions',
                  name: 'transactions',
                  builder: (context, state) => TransactionsScreen(),
                ),
                GoRoute(
                  path: 'assetDetail',
                  name: 'assetDetail',
                  builder: (context, state) => AssetDetailScreen(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              builder: (context, state) => const ProfileScreen(),
              path: AppRoutes.profile.path,
              name: AppRoutes.profile.name,
            ),
          ],
        ),
      ],
    ),
  ],
);
