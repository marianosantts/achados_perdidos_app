import 'package:flutter/material.dart';
import '../models/item_enums.dart';
import '../../../core/theme/app_theme.dart';

/// Badge colorido que exibe o [TipoItem] (ACHADO / PERDIDO).
class TipoBadge extends StatelessWidget {
  const TipoBadge({super.key, required this.tipo});

  final TipoItem tipo;

  @override
  Widget build(BuildContext context) {
    final isAchado = tipo == TipoItem.ACHADO;
    final color = isAchado ? AppColors.achado : AppColors.perdido;
    final label = isAchado ? 'Achado' : 'Perdido';
    final icon = isAchado ? Icons.search_rounded : Icons.help_outline_rounded;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: Colors.white),
          const SizedBox(width: 5),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
