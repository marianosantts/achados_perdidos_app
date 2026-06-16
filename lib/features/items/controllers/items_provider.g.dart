// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$itemServiceHash() => r'53e9c4951986f60ac61d99ca2c0e1c26c7aa528a';

/// Provê a instância de [ItemService] para a feature.
///
/// Copied from [itemService].
@ProviderFor(itemService)
final itemServiceProvider = AutoDisposeProvider<ItemService>.internal(
  itemService,
  name: r'itemServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$itemServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ItemServiceRef = AutoDisposeProviderRef<ItemService>;
String _$itemsListHash() => r'494ca4854914843232ab3af904a22db47288234f';

/// Busca itens aplicando os filtros ativos.
///
/// É invalidado automaticamente quando [filtrosNotifierProvider] muda.
///
/// Copied from [itemsList].
@ProviderFor(itemsList)
final itemsListProvider = AutoDisposeFutureProvider<List<ItemModel>>.internal(
  itemsList,
  name: r'itemsListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$itemsListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ItemsListRef = AutoDisposeFutureProviderRef<List<ItemModel>>;
String _$itemDetailHash() => r'5e64c58f7dcf7b9e56e31eccd2dc8641b7308151';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Busca um único item pelo [id].
///
/// Copied from [itemDetail].
@ProviderFor(itemDetail)
const itemDetailProvider = ItemDetailFamily();

/// Busca um único item pelo [id].
///
/// Copied from [itemDetail].
class ItemDetailFamily extends Family<AsyncValue<ItemModel>> {
  /// Busca um único item pelo [id].
  ///
  /// Copied from [itemDetail].
  const ItemDetailFamily();

  /// Busca um único item pelo [id].
  ///
  /// Copied from [itemDetail].
  ItemDetailProvider call(int id) {
    return ItemDetailProvider(id);
  }

  @override
  ItemDetailProvider getProviderOverride(
    covariant ItemDetailProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'itemDetailProvider';
}

/// Busca um único item pelo [id].
///
/// Copied from [itemDetail].
class ItemDetailProvider extends AutoDisposeFutureProvider<ItemModel> {
  /// Busca um único item pelo [id].
  ///
  /// Copied from [itemDetail].
  ItemDetailProvider(int id)
    : this._internal(
        (ref) => itemDetail(ref as ItemDetailRef, id),
        from: itemDetailProvider,
        name: r'itemDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$itemDetailHash,
        dependencies: ItemDetailFamily._dependencies,
        allTransitiveDependencies: ItemDetailFamily._allTransitiveDependencies,
        id: id,
      );

  ItemDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<ItemModel> Function(ItemDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ItemDetailProvider._internal(
        (ref) => create(ref as ItemDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ItemModel> createElement() {
    return _ItemDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ItemDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ItemDetailRef on AutoDisposeFutureProviderRef<ItemModel> {
  /// The parameter `id` of this provider.
  int get id;
}

class _ItemDetailProviderElement
    extends AutoDisposeFutureProviderElement<ItemModel>
    with ItemDetailRef {
  _ItemDetailProviderElement(super.provider);

  @override
  int get id => (origin as ItemDetailProvider).id;
}

String _$filtrosNotifierHash() => r'b5f64f05fcad31b4aa75ae2fb0b2b6e62a502305';

/// Controla os filtros ativos da lista de itens.
///
/// Copied from [FiltrosNotifier].
@ProviderFor(FiltrosNotifier)
final filtrosNotifierProvider =
    AutoDisposeNotifierProvider<FiltrosNotifier, FiltroState>.internal(
      FiltrosNotifier.new,
      name: r'filtrosNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$filtrosNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$FiltrosNotifier = AutoDisposeNotifier<FiltroState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
