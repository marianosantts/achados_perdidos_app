import 'package:go_router/go_router.dart';
import '../../features/items/views/items_list_view.dart';

/// Roteador principal do app usando go_router.
///
/// Rotas iniciais da feature Items:
///   /         → ItemsListView  (lista de achados e perdidos)
///
/// Novas rotas devem ser adicionadas aqui conforme as views forem criadas.
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const ItemsListView(),
    ),
  ],
);
