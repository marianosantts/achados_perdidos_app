// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_actions_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$itemActionsNotifierHash() =>
    r'e70278c0b9d14c17b12b55161723c6855a85b3bd';

/// Gerencia operações de escrita sobre itens: criar, atualizar, excluir,
/// resolver e reabrir.
///
/// Após cada operação bem-sucedida, invalida [itemsListProvider] para
/// forçar o recarregamento da lista.
///
/// Copied from [ItemActionsNotifier].
@ProviderFor(ItemActionsNotifier)
final itemActionsNotifierProvider =
    AutoDisposeNotifierProvider<
      ItemActionsNotifier,
      ActionState<ItemModel?>
    >.internal(
      ItemActionsNotifier.new,
      name: r'itemActionsNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$itemActionsNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ItemActionsNotifier = AutoDisposeNotifier<ActionState<ItemModel?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
