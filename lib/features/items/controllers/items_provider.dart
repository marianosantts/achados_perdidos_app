import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/item_enums.dart';
import '../models/item_model.dart';
import '../services/item_service.dart';

part 'items_provider.g.dart';

// ─── Provider do Serviço ──────────────────────────────────────────────────────

/// Provê a instância de [ItemService] para a feature.
@riverpod
ItemService itemService(Ref ref) => ItemService();

// ─── Estado de Filtros ────────────────────────────────────────────────────────

/// Parâmetros de busca/filtro atualmente aplicados.
class FiltroState {
  final TipoItem? tipo;
  final CategoriaItem? categoria;
  final StatusItem? status;
  final String? termo;

  const FiltroState({
    this.tipo,
    this.categoria,
    this.status,
    this.termo,
  });

  FiltroState copyWith({
    TipoItem? tipo,
    CategoriaItem? categoria,
    StatusItem? status,
    String? termo,
    bool clearTipo = false,
    bool clearCategoria = false,
    bool clearStatus = false,
    bool clearTermo = false,
  }) {
    return FiltroState(
      tipo: clearTipo ? null : tipo ?? this.tipo,
      categoria: clearCategoria ? null : categoria ?? this.categoria,
      status: clearStatus ? null : status ?? this.status,
      termo: clearTermo ? null : termo ?? this.termo,
    );
  }

  bool get isEmpty =>
      tipo == null && categoria == null && status == null && (termo?.isEmpty ?? true);
}

// ─── Provider de Filtros (StateNotifier) ─────────────────────────────────────

/// Controla os filtros ativos da lista de itens.
@riverpod
class FiltrosNotifier extends _$FiltrosNotifier {
  @override
  FiltroState build() => const FiltroState();

  void setTipo(TipoItem? tipo) =>
      state = state.copyWith(tipo: tipo, clearTipo: tipo == null);

  void setCategoria(CategoriaItem? categoria) =>
      state = state.copyWith(categoria: categoria, clearCategoria: categoria == null);

  void setStatus(StatusItem? status) =>
      state = state.copyWith(status: status, clearStatus: status == null);

  void setTermo(String? termo) =>
      state = state.copyWith(termo: termo, clearTermo: termo == null || termo.isEmpty);

  void limparFiltros() => state = const FiltroState();
}

// ─── Provider Assíncrono da Lista de Itens ───────────────────────────────────

/// Busca itens aplicando os filtros ativos.
///
/// É invalidado automaticamente quando [filtrosNotifierProvider] muda.
@riverpod
Future<List<ItemModel>> itemsList(Ref ref) async {
  final service = ref.watch(itemServiceProvider);
  final filtros = ref.watch(filtrosNotifierProvider);

  if (filtros.isEmpty) {
    return service.listarItens();
  }
  return service.filtrarItens(
    tipo: filtros.tipo,
    categoria: filtros.categoria,
    status: filtros.status,
    termo: filtros.termo,
  );
}

// ─── Provider de Item Único ───────────────────────────────────────────────────

/// Busca um único item pelo [id].
@riverpod
Future<ItemModel> itemDetail(Ref ref, int id) async {
  final service = ref.watch(itemServiceProvider);
  return service.buscarItemPorId(id);
}
