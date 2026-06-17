import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/item_model.dart';
import '../models/item_enums.dart';
import '../../../core/theme/app_theme.dart';
import 'status_badge.dart';
import 'tipo_badge.dart';

/// Card de item para a lista principal de Achados & Perdidos.
///
/// Ao tocar, navega para `/items/:id` (detalhe do item).
class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.item});

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    final isAchado = item.tipo == TipoItem.ACHADO;
    final borderColor = isAchado
        ? AppColors.achado.withAlpha(80)
        : AppColors.perdido.withAlpha(80);

    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: BorderSide(color: borderColor, width: 1.2),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: () => context.push('/items/${item.id}'),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Ícone da categoria ───────────────────────
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: isAchado
                      ? AppColors.achado.withAlpha(20)
                      : AppColors.perdido.withAlpha(20),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  _categoriaIcon(item.categoria),
                  color: isAchado ? AppColors.achado : AppColors.perdido,
                  size: 26,
                ),
              ),
              const SizedBox(width: 12),
              // ── Conteúdo ─────────────────────────────────
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Linha 1: badges
                    Row(
                      children: [
                        TipoBadge(tipo: item.tipo),
                        const SizedBox(width: 6),
                        StatusBadge(status: item.status),
                        const Spacer(),
                        Text(
                          item.dataOcorrido,
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    // Linha 2: título
                    Text(
                      item.titulo,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 2),
                    // Linha 3: local + categoria
                    Text(
                      '${_categoriaLabel(item.categoria)} · ${item.local}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
              // ── Seta ─────────────────────────────────────
              const SizedBox(width: 4),
              Icon(Icons.chevron_right_rounded,
                  color: Colors.grey.shade400, size: 22),
            ],
          ),
        ),
      ),
    );
  }

  IconData _categoriaIcon(CategoriaItem cat) {
    return switch (cat) {
      CategoriaItem.DOCUMENTOS => Icons.badge_outlined,
      CategoriaItem.ELETRONICOS => Icons.devices_other_outlined,
      CategoriaItem.ROUPAS => Icons.checkroom_outlined,
      CategoriaItem.MATERIAL_ESCOLAR => Icons.menu_book_outlined,
      CategoriaItem.CHAVES => Icons.key_outlined,
      CategoriaItem.ACESSORIOS => Icons.watch_outlined,
      CategoriaItem.OUTROS => Icons.category_outlined,
    };
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
}
