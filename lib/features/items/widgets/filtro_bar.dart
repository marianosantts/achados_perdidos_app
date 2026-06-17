import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../controllers/items_provider.dart';
import '../models/item_enums.dart';

/// Barra de busca + chips de filtro rápido para a lista de itens.
///
/// Observa e modifica [filtrosNotifierProvider].
class FiltroBar extends ConsumerStatefulWidget {
  const FiltroBar({super.key});

  @override
  ConsumerState<FiltroBar> createState() => _FiltroBarState();
}

class _FiltroBarState extends ConsumerState<FiltroBar> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filtros = ref.watch(filtrosNotifierProvider);
    final notifier = ref.read(filtrosNotifierProvider.notifier);
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // ── Campo de busca textual ───────────────────────────
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Buscar por título, local ou descrição…',
              prefixIcon: const Icon(Icons.search_rounded),
              suffixIcon: filtros.termo != null && filtros.termo!.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear_rounded),
                      onPressed: () {
                        _searchController.clear();
                        notifier.setTermo(null);
                      },
                    )
                  : null,
              filled: true,
              fillColor: colorScheme.surfaceContainerHighest.withAlpha(120),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
            onChanged: (v) => notifier.setTermo(v.trim().isEmpty ? null : v.trim()),
          ),
        ),

        // ── Chips de filtro rápido ────────────────────────────
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Row(
            children: [
              // Tipo
              _TipoChip(
                label: 'Achados',
                tipo: TipoItem.ACHADO,
                selecionado: filtros.tipo == TipoItem.ACHADO,
                onTap: () => notifier.setTipo(
                  filtros.tipo == TipoItem.ACHADO ? null : TipoItem.ACHADO,
                ),
              ),
              const SizedBox(width: 6),
              _TipoChip(
                label: 'Perdidos',
                tipo: TipoItem.PERDIDO,
                selecionado: filtros.tipo == TipoItem.PERDIDO,
                onTap: () => notifier.setTipo(
                  filtros.tipo == TipoItem.PERDIDO ? null : TipoItem.PERDIDO,
                ),
              ),
              const SizedBox(width: 10),
              const VerticalDivider(thickness: 1, width: 1),
              const SizedBox(width: 10),
              // Status
              _StatusChip(
                label: 'Abertos',
                status: StatusItem.ABERTO,
                selecionado: filtros.status == StatusItem.ABERTO,
                onTap: () => notifier.setStatus(
                  filtros.status == StatusItem.ABERTO ? null : StatusItem.ABERTO,
                ),
              ),
              const SizedBox(width: 6),
              _StatusChip(
                label: 'Resolvidos',
                status: StatusItem.RESOLVIDO,
                selecionado: filtros.status == StatusItem.RESOLVIDO,
                onTap: () => notifier.setStatus(
                  filtros.status == StatusItem.RESOLVIDO
                      ? null
                      : StatusItem.RESOLVIDO,
                ),
              ),
              const SizedBox(width: 10),
              const VerticalDivider(thickness: 1, width: 1),
              const SizedBox(width: 10),
              // Limpar filtros
              if (!filtros.isEmpty)
                ActionChip(
                  avatar: const Icon(Icons.filter_alt_off_rounded, size: 16),
                  label: const Text('Limpar'),
                  onPressed: () {
                    _searchController.clear();
                    notifier.limparFiltros();
                  },
                ),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Chips auxiliares ───────────────────────────────────────────────────────────

class _TipoChip extends StatelessWidget {
  const _TipoChip({
    required this.label,
    required this.tipo,
    required this.selecionado,
    required this.onTap,
  });

  final String label;
  final TipoItem tipo;
  final bool selecionado;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isAchado = tipo == TipoItem.ACHADO;
    final color = isAchado ? const Color(0xFF2E7D32) : const Color(0xFFC62828);

    return FilterChip(
      label: Text(label),
      selected: selecionado,
      onSelected: (_) => onTap(),
      selectedColor: color.withAlpha(40),
      checkmarkColor: color,
      labelStyle: TextStyle(
        color: selecionado ? color : null,
        fontWeight: selecionado ? FontWeight.w600 : FontWeight.normal,
      ),
      side: BorderSide(
        color: selecionado ? color : Colors.grey.shade300,
      ),
      showCheckmark: true,
      avatar: selecionado
          ? null
          : Icon(
              isAchado ? Icons.search_rounded : Icons.help_outline_rounded,
              size: 16,
              color: Colors.grey.shade600,
            ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({
    required this.label,
    required this.status,
    required this.selecionado,
    required this.onTap,
  });

  final String label;
  final StatusItem status;
  final bool selecionado;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isAberto = status == StatusItem.ABERTO;
    final color = isAberto ? const Color(0xFFF9A825) : const Color(0xFF388E3C);

    return FilterChip(
      label: Text(label),
      selected: selecionado,
      onSelected: (_) => onTap(),
      selectedColor: color.withAlpha(40),
      checkmarkColor: color,
      labelStyle: TextStyle(
        color: selecionado ? color : null,
        fontWeight: selecionado ? FontWeight.w600 : FontWeight.normal,
      ),
      side: BorderSide(
        color: selecionado ? color : Colors.grey.shade300,
      ),
      showCheckmark: true,
    );
  }
}
