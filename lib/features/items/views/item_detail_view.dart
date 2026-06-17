import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../controllers/items_provider.dart';
import '../controllers/item_actions_provider.dart';
import '../models/item_enums.dart';
import '../widgets/status_badge.dart';
import '../widgets/tipo_badge.dart';
import '../../../core/theme/app_theme.dart';

/// Tela de detalhe de um item de Achados & Perdidos.
///
/// Recebe o [id] via go_router e observa [itemDetailProvider].
/// Permite resolver, reabrir, editar e excluir o item.
class ItemDetailView extends ConsumerWidget {
  const ItemDetailView({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncItem = ref.watch(itemDetailProvider(id));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhes'),
        actions: asyncItem.whenOrNull(
          data: (item) => [
            PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert_rounded),
              onSelected: (value) async {
                if (value == 'editar') {
                  context.push('/items/${item.id}/editar', extra: item);
                } else if (value == 'excluir') {
                  final confirm = await _confirmarExclusao(context);
                  if (confirm == true && context.mounted) {
                    final ok = await ref
                        .read(itemActionsNotifierProvider.notifier)
                        .excluirItem(item.id);
                    if (ok && context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Item excluído.')),
                      );
                      context.pop();
                    }
                  }
                }
              },
              itemBuilder: (_) => const [
                PopupMenuItem(value: 'editar', child: Text('Editar')),
                PopupMenuItem(
                  value: 'excluir',
                  child: Text('Excluir',
                      style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          ],
        ),
      ),
      body: asyncItem.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.error_outline, size: 60, color: Colors.red),
                const SizedBox(height: 12),
                Text(
                  e.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.red),
                ),
                const SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: () => ref.invalidate(itemDetailProvider(id)),
                  icon: const Icon(Icons.refresh_rounded),
                  label: const Text('Tentar novamente'),
                ),
              ],
            ),
          ),
        ),
        data: (item) {
          final isAchado = item.tipo == TipoItem.ACHADO;
          final headerColor =
              isAchado ? AppColors.achado : AppColors.perdido;

          return SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ── Header colorido ──────────────────────────
                Container(
                  color: headerColor.withAlpha(15),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          TipoBadge(tipo: item.tipo),
                          const SizedBox(width: 8),
                          StatusBadge(status: item.status),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        item.titulo,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.descricao,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ],
                  ),
                ),

                // ── Informações principais ───────────────────
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _SectionTitle('Informações'),
                      const SizedBox(height: 12),
                      _InfoRow(
                        icon: Icons.category_outlined,
                        label: 'Categoria',
                        value: _categoriaLabel(item.categoria),
                      ),
                      _InfoRow(
                        icon: Icons.location_on_outlined,
                        label: 'Local',
                        value: item.local,
                      ),
                      _InfoRow(
                        icon: Icons.calendar_today_outlined,
                        label: 'Data ocorrido',
                        value: item.dataOcorrido,
                      ),
                      if (item.observacao != null &&
                          item.observacao!.isNotEmpty) ...[
                        const SizedBox(height: 4),
                        _InfoRow(
                          icon: Icons.notes_rounded,
                          label: 'Observação',
                          value: item.observacao!,
                        ),
                      ],
                      const SizedBox(height: 20),
                      _SectionTitle('Contato'),
                      const SizedBox(height: 12),
                      _InfoRow(
                        icon: Icons.person_outlined,
                        label: 'Nome',
                        value: item.nomeContato,
                      ),
                      _InfoRow(
                        icon: Icons.phone_outlined,
                        label: 'Telefone',
                        value: item.telefoneContato,
                      ),
                      const SizedBox(height: 20),
                      _SectionTitle('Auditoria'),
                      const SizedBox(height: 12),
                      _InfoRow(
                        icon: Icons.access_time_outlined,
                        label: 'Criado em',
                        value: item.createdAt,
                      ),
                      _InfoRow(
                        icon: Icons.update_rounded,
                        label: 'Atualizado em',
                        value: item.updatedAt,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      // ── Botão de ação principal ──────────────────────────
      bottomNavigationBar: asyncItem.whenOrNull(
        data: (item) {
          final isAberto = item.status == StatusItem.ABERTO;
          final notifier =
              ref.read(itemActionsNotifierProvider.notifier);

          return Padding(
            padding: EdgeInsets.fromLTRB(
                20,
                12,
                20,
                12 + MediaQuery.of(context).viewPadding.bottom),
            child: Consumer(
              builder: (ctx, r, _) {
                final actionState = r.watch(itemActionsNotifierProvider);
                final isLoading = actionState is ActionLoading;

                return FilledButton.icon(
                  onPressed: isLoading
                      ? null
                      : () async {
                          final ok = isAberto
                              ? await notifier.resolverItem(item.id)
                              : await notifier.reabrirItem(item.id);

                          if (ok && ctx.mounted) {
                            ScaffoldMessenger.of(ctx).showSnackBar(
                              SnackBar(
                                content: Text(
                                  isAberto
                                      ? 'Item marcado como Resolvido!'
                                      : 'Item reaberto com sucesso!',
                                ),
                              ),
                            );
                            r.invalidate(itemDetailProvider(item.id));
                          }
                        },
                  style: FilledButton.styleFrom(
                    minimumSize: const Size.fromHeight(50),
                    backgroundColor:
                        isAberto ? AppColors.resolvido : AppColors.perdido,
                  ),
                  icon: isLoading
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : Icon(isAberto
                          ? Icons.check_circle_outline
                          : Icons.replay_rounded),
                  label: Text(isAberto ? 'Marcar como Resolvido' : 'Reabrir'),
                );
              },
            ),
          );
        },
      ),
    );
  }

  String _categoriaLabel(CategoriaItem cat) {
    return switch (cat) {
      CategoriaItem.DOCUMENTOS => 'Documentos',
      CategoriaItem.ELETRONICOS => 'Eletrônicos',
      CategoriaItem.ROUPAS => 'Roupas',
      CategoriaItem.MATERIAL_ESCOLAR => 'Material Escolar',
      CategoriaItem.CHAVES => 'Chaves',
      CategoriaItem.ACESSORIOS => 'Acessórios',
      CategoriaItem.OUTROS => 'Outros',
    };
  }

  Future<bool?> _confirmarExclusao(BuildContext context) =>
      showDialog<bool>(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Excluir item'),
          content: const Text(
              'Tem certeza que deseja excluir este item? Esta ação não pode ser desfeita.'),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: const Text('Cancelar')),
            FilledButton(
              style: FilledButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () => Navigator.pop(context, true),
              child: const Text('Excluir'),
            ),
          ],
        ),
      );
}

// ── Widgets auxiliares ─────────────────────────────────────────────────────────

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toUpperCase(),
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.2,
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: Colors.grey.shade500),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
