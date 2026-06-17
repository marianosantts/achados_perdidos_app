import 'package:flutter/material.dart';
import '../models/item_enums.dart';
import '../../../core/theme/app_theme.dart';

/// Badge colorido que exibe o [StatusItem] de forma visual.
class StatusBadge extends StatelessWidget {
  const StatusBadge({super.key, required this.status});

  final StatusItem status;

  @override
  Widget build(BuildContext context) {
    final isAberto = status == StatusItem.ABERTO;
    final color = isAberto ? AppColors.aberto : AppColors.resolvido;
    final label = isAberto ? 'Aberto' : 'Resolvido';
    final icon = isAberto ? Icons.radio_button_unchecked : Icons.check_circle_outline;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withAlpha(30),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withAlpha(150), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
