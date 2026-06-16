/// Constantes globais da API.
class ApiConstants {
  ApiConstants._();

  /// URL base da API. Ajuste conforme seu ambiente.
  static const String baseUrl = 'http://localhost:8080';

  // ─── Itens ───────────────────────────────────────────────
  static const String itens = '/api/itens';
  static String itemById(int id) => '/api/itens/$id';
  static String itemResolver(int id) => '/api/itens/$id/resolver';
  static String itemReabrir(int id) => '/api/itens/$id/reabrir';
  static const String itensFiltros = '/api/itens/filtros';
}
