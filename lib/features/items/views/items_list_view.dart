import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../controllers/items_provider.dart';
import '../widgets/item_card.dart';
import '../widgets/filtro_bar.dart';

/// Tela principal: lista de Achados & Perdidos com busca e filtros.
///
/// Observa [itemsListProvider] — que já aplica os filtros ativos —
/// e renderiza [ItemCard] para cada item retornado.
class ItemsListView extends ConsumerWidget {
  const ItemsListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncItems = ref.watch(itemsListProvider);
    final filtros = ref.watch(filtrosNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Achados & Perdidos'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            tooltip: 'Recarregar',
            onPressed: () => ref.invalidate(itemsListProvider),
          ),
        ],
      ),
      body: Column(
        children: [
          // ── Barra de busca e filtros ──────────────────────
          const FiltroBar(),
          const Divider(height: 1),

          // ── Contador de resultados ────────────────────────
          asyncItems.when(
            loading: () => const SizedBox.shrink(),
            error: (err, st) => const SizedBox.shrink(),
            data: (items) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              child: Row(
                children: [
                  Text(
                    '${items.length} item(s) encontrado(s)',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  if (!filtros.isEmpty) ...[
                    const SizedBox(width: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 2),
                      decoration: BoxDecoration(
                        color:
                            Theme.of(context).colorScheme.primary.withAlpha(30),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        'filtrado',
                        style: TextStyle(
                          fontSize: 10,
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),

          // ── Lista ─────────────────────────────────────────
          Expanded(
            child: asyncItems.when(
              loading: () =>
                  const Center(child: CircularProgressIndicator()),
              error: (error, _) => _ErroView(
                mensagem: error.toString(),
                onRetry: () => ref.invalidate(itemsListProvider),
              ),
              data: (items) {
                if (items.isEmpty) {
                  return const _EmptyView();
                }
                return RefreshIndicator(
                  onRefresh: () async =>
                      ref.invalidate(itemsListProvider),
                  child: ListView.separated(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 100),
                    itemCount: items.length,
                    separatorBuilder: (ctx, idx) =>
                        const SizedBox(height: 10),
                    itemBuilder: (_, i) => ItemCard(item: items[i]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/items/novo'),
        icon: const Icon(Icons.add_rounded),
        label: const Text('Novo Item'),
      ),
    );
  }
}

// ── Views auxiliares ───────────────────────────────────────────────────────────

class _EmptyView extends StatelessWidget {
  const _EmptyView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.inventory_2_outlined,
              size: 72, color: Colors.grey.shade300),
          const SizedBox(height: 16),
          Text(
            'Nenhum item encontrado',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade500,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Tente ajustar os filtros ou cadastre um novo item.',
            style: TextStyle(fontSize: 13, color: Colors.grey.shade400),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _ErroView extends StatelessWidget {
  const _ErroView({required this.mensagem, required this.onRetry});

  final String mensagem;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.wifi_off_rounded,
                size: 64, color: Colors.grey.shade400),
            const SizedBox(height: 16),
            Text(
              'Erro ao carregar itens',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.error,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              mensagem,
              style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh_rounded),
              label: const Text('Tentar novamente'),
            ),
          ],
        ),
      ),
    );
  }
}
