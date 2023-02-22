import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_route_guard/pages/first_page.dart';
import 'package:go_router_route_guard/pages/second_page.dart';

import 'editing_provider.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final editing = ref.watch(editingProvider);
  return GoRouter(
    routes: [
      GoRoute(
        redirect: (context, state) {
          if (editing) {
            return '/';
          } else {
            return null;
          }
        },
        path: '/',
        builder: (context, state) => const FirstPage(),
        routes: [
          GoRoute(
            path: 'second',
            builder: (context, state) => const SecondPage(),
          ),
        ],
      ),
    ],
  );
});
