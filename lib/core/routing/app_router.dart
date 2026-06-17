import 'package:go_router/go_router.dart';
import '../../features/items/models/item_model.dart';
import '../../features/items/views/items_list_view.dart';
import '../../features/items/views/item_detail_view.dart';
import '../../features/items/views/item_form_view.dart';

/// Roteador principal do app usando go_router.
///
/// Rotas da feature Items:
///   /                    → ItemsListView     (lista de achados e perdidos)
///   /items/:id           → ItemDetailView    (detalhe de um item)
///   /items/novo          → ItemFormView      (criação de item)
///   /items/:id/editar    → ItemFormView      (edição de item — extra: ItemModel)
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    // ── Lista principal ──────────────────────────────────
    GoRoute(
      path: '/',
      builder: (context, state) => const ItemsListView(),
    ),

    // ── Formulário de criação ────────────────────────────
    GoRoute(
      path: '/items/novo',
      builder: (context, state) => const ItemFormView(),
    ),

    // ── Detalhe do item ──────────────────────────────────
    GoRoute(
      path: '/items/:id',
      builder: (context, state) {
        final id = int.parse(state.pathParameters['id']!);
        return ItemDetailView(id: id);
      },

      // ── Edição do item (sub-rota) ────────────────────
      routes: [
        GoRoute(
          path: 'editar',
          builder: (context, state) {
            final item = state.extra as ItemModel?;
            return ItemFormView(itemParaEditar: item);
          },
        ),
      ],
    ),
  ],
);
