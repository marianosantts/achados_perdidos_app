import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/items_provider.dart';
import '../models/item_model.dart';

/// Tela principal: lista todos os itens de Achados e Perdidos.
///
/// Observa [itemsListProvider] que já aplica filtros automaticamente.
class ItemsListView extends ConsumerWidget {
  const ItemsListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncItems = ref.watch(itemsListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Achados & Perdidos'),
      ),
      body: asyncItems.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Erro ao carregar itens:\n$error',
              textAlign: TextAlign.center,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        ),
        data: (items) {
          if (items.isEmpty) {
            return const Center(child: Text('Nenhum item encontrado.'));
          }
          return ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: items.length,
            separatorBuilder: (context, _) => const SizedBox(height: 8),
            itemBuilder: (context, index) => _ItemCard(item: items[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // TODO: navegar para a tela de criação de item
        },
        icon: const Icon(Icons.add),
        label: const Text('Novo Item'),
      ),
    );
  }
}

// ─── Widget auxiliar ─────────────────────────────────────────────────────────

class _ItemCard extends StatelessWidget {
  const _ItemCard({required this.item});

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isAchado = item.tipo.name == 'ACHADO';

    return Card(
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
              isAchado ? colorScheme.primaryContainer : colorScheme.errorContainer,
          child: Icon(
            isAchado ? Icons.search_rounded : Icons.report_problem_rounded,
            color: isAchado
                ? colorScheme.onPrimaryContainer
                : colorScheme.onErrorContainer,
          ),
        ),
        title: Text(
          item.titulo,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '${item.categoria.name} • ${item.local}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Chip(
          label: Text(
            item.status.name,
            style: const TextStyle(fontSize: 11),
          ),
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
        ),
        onTap: () {
          // TODO: navegar para os detalhes do item
        },
      ),
    );
  }
}
