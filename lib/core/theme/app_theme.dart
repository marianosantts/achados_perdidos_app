import 'package:flutter/material.dart';

/// Tema central do aplicativo Achados & Perdidos.
///
/// Use [AppTheme.light] no [MaterialApp.theme].
/// Cores semânticas de negócio ficam em [AppColors].
abstract class AppTheme {
  AppTheme._();

  static ThemeData get light {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: _textTheme,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        backgroundColor: colorScheme.surface,
        foregroundColor: colorScheme.onSurface,
      ),
      cardTheme: CardThemeData(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.zero,
      ),
      chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }

  static const _textTheme = TextTheme(
    headlineMedium: TextStyle(fontWeight: FontWeight.bold),
    titleLarge: TextStyle(fontWeight: FontWeight.w600),
    titleMedium: TextStyle(fontWeight: FontWeight.w500),
    labelSmall: TextStyle(letterSpacing: 0.5),
  );
}

/// Paleta de cores global do app.
abstract class AppColors {
  AppColors._();

  static const primary = Color(0xFF1565C0); // Azul institucional

  // ── Semântica de negócio ──────────────────────────────────
  /// Cor para itens do tipo ACHADO.
  static const achado = Color(0xFF2E7D32); // Verde

  /// Cor para itens do tipo PERDIDO.
  static const perdido = Color(0xFFC62828); // Vermelho

  /// Cor para status ABERTO.
  static const aberto = Color(0xFFF9A825); // Âmbar

  /// Cor para status RESOLVIDO.
  static const resolvido = Color(0xFF388E3C); // Verde escuro
}
