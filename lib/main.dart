import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/routing/app_router.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(
    // ProviderScope é obrigatório para Riverpod funcionar
    const ProviderScope(
      child: AchadosPerdidosApp(),
    ),
  );
}

class AchadosPerdidosApp extends StatelessWidget {
  const AchadosPerdidosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Achados e Perdidos',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme.light,
    );
  }
}
