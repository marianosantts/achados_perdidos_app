// Smoke test básico do app Achados & Perdidos.
//
// Verifica que o widget raiz inicializa sem erros.
// Testes de feature devem ser adicionados em test/features/.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:achados_perdidos_app/main.dart';

void main() {
  testWidgets('App inicializa sem erros', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: AchadosPerdidosApp(),
      ),
    );
    // Verifica que o MaterialApp foi montado
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
