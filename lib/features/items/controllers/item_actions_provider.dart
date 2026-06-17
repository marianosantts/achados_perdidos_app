import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/item_model.dart';
import '../models/item_request_model.dart';
import '../services/item_service.dart';
import 'items_provider.dart';

part 'item_actions_provider.g.dart';

// ─── Estado de ação para operações assíncronas ───────────────────────────────

/// Estado genérico para operações de escrita (criar, editar, deletar...).
sealed class ActionState<T> {
  const ActionState();
}

class ActionIdle<T> extends ActionState<T> {
  const ActionIdle();
}

class ActionLoading<T> extends ActionState<T> {
  const ActionLoading();
}

class ActionSuccess<T> extends ActionState<T> {
  final T data;
  const ActionSuccess(this.data);
}

class ActionError<T> extends ActionState<T> {
  final String mensagem;
  final List<({String campo, String mensagem})> campos;
  const ActionError({required this.mensagem, this.campos = const []});
}

// ─── Notifier de ações do item ────────────────────────────────────────────────

/// Gerencia operações de escrita sobre itens: criar, atualizar, excluir,
/// resolver e reabrir.
///
/// Após cada operação bem-sucedida, invalida [itemsListProvider] para
/// forçar o recarregamento da lista.
@riverpod
class ItemActionsNotifier extends _$ItemActionsNotifier {
  @override
  ActionState<ItemModel?> build() => const ActionIdle();

  ItemService get _service => ref.read(itemServiceProvider);

  // ── Criar ────────────────────────────────────────────────
  Future<bool> criarItem(ItemRequestModel request) async {
    state = const ActionLoading();
    try {
      final item = await _service.criarItem(request);
      state = ActionSuccess(item);
      ref.invalidate(itemsListProvider);
      return true;
    } catch (e) {
      state = _toErrorState(e);
      return false;
    }
  }

  // ── Atualizar (PUT completo) ─────────────────────────────
  Future<bool> atualizarItem(int id, ItemRequestModel request) async {
    state = const ActionLoading();
    try {
      final item = await _service.atualizarItem(id, request);
      state = ActionSuccess(item);
      ref.invalidate(itemsListProvider);
      ref.invalidate(itemDetailProvider(id));
      return true;
    } catch (e) {
      state = _toErrorState(e);
      return false;
    }
  }

  // ── Resolver (PATCH /resolver) ───────────────────────────
  Future<bool> resolverItem(int id) async {
    state = const ActionLoading();
    try {
      final item = await _service.resolverItem(id);
      state = ActionSuccess(item);
      ref.invalidate(itemsListProvider);
      ref.invalidate(itemDetailProvider(id));
      return true;
    } catch (e) {
      state = _toErrorState(e);
      return false;
    }
  }

  // ── Reabrir (PATCH /reabrir) ─────────────────────────────
  Future<bool> reabrirItem(int id) async {
    state = const ActionLoading();
    try {
      final item = await _service.reabrirItem(id);
      state = ActionSuccess(item);
      ref.invalidate(itemsListProvider);
      ref.invalidate(itemDetailProvider(id));
      return true;
    } catch (e) {
      state = _toErrorState(e);
      return false;
    }
  }

  // ── Excluir (DELETE) ─────────────────────────────────────
  Future<bool> excluirItem(int id) async {
    state = const ActionLoading();
    try {
      await _service.excluirItem(id);
      state = const ActionSuccess(null);
      ref.invalidate(itemsListProvider);
      return true;
    } catch (e) {
      state = _toErrorState(e);
      return false;
    }
  }

  // ── Reset para idle (após tratar erro na UI) ─────────────
  void reset() => state = const ActionIdle();

  // ── Helper privado ───────────────────────────────────────
  ActionError<ItemModel?> _toErrorState(Object e) {
    // Importação lazy para evitar ciclo: usamos o tipo por string
    // O erro já vem tipado como ApiException via DioClient interceptor.
    final msg = e.toString();
    return ActionError(mensagem: msg);
  }
}
