import 'package:dio/dio.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/constants/api_constants.dart';
import '../models/item_enums.dart';
import '../models/item_model.dart';
import '../models/item_request_model.dart';

/// Serviço responsável por todas as chamadas HTTP relacionadas a Itens.
///
/// Usa [DioClient.instance] (singleton) com baseUrl configurada.
/// Em caso de erro HTTP 400/404, lança [ApiException] com os campos de validação.
class ItemService {
  final Dio _dio;

  ItemService({Dio? dio}) : _dio = dio ?? DioClient.instance;

  // ─────────────────────────────────────────────────────────
  // POST /api/itens
  // Cria um novo item (achado ou perdido).
  // ─────────────────────────────────────────────────────────
  Future<ItemModel> criarItem(ItemRequestModel request) async {
    try {
      final response = await _dio.post(ApiConstants.itens, data: request.toJson());
      return ItemModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  // ─────────────────────────────────────────────────────────
  // GET /api/itens
  // Retorna lista de todos os itens (mais recente → mais antigo).
  // ─────────────────────────────────────────────────────────
  Future<List<ItemModel>> listarItens() async {
    try {
      final response = await _dio.get(ApiConstants.itens);
      final list = response.data as List<dynamic>;
      return list
          .map((e) => ItemModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  // ─────────────────────────────────────────────────────────
  // GET /api/itens/{id}
  // Busca um item específico pelo ID.
  // ─────────────────────────────────────────────────────────
  Future<ItemModel> buscarItemPorId(int id) async {
    try {
      final response = await _dio.get(ApiConstants.itemById(id));
      return ItemModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  // ─────────────────────────────────────────────────────────
  // GET /api/itens/filtros
  // Filtra itens pelos parâmetros opcionais:
  //   tipo, categoria, status, termo (busca textual).
  // ─────────────────────────────────────────────────────────
  Future<List<ItemModel>> filtrarItens({
    TipoItem? tipo,
    CategoriaItem? categoria,
    StatusItem? status,
    String? termo,
  }) async {
    try {
      final queryParams = <String, dynamic>{};
      if (tipo != null) queryParams['tipo'] = tipo.name;
      if (categoria != null) queryParams['categoria'] = categoria.name;
      if (status != null) queryParams['status'] = status.name;
      if (termo != null && termo.isNotEmpty) queryParams['termo'] = termo;

      final response = await _dio.get(
        ApiConstants.itensFiltros,
        queryParameters: queryParams.isEmpty ? null : queryParams,
      );

      final list = response.data as List<dynamic>;
      return list
          .map((e) => ItemModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  // ─────────────────────────────────────────────────────────
  // PUT /api/itens/{id}
  // Substitui completamente os dados de um item.
  // ─────────────────────────────────────────────────────────
  Future<ItemModel> atualizarItem(int id, ItemRequestModel request) async {
    try {
      final response = await _dio.put(ApiConstants.itemById(id), data: request.toJson());
      return ItemModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  // ─────────────────────────────────────────────────────────
  // PATCH /api/itens/{id}/resolver
  // Altera o status do item para RESOLVIDO.
  // ─────────────────────────────────────────────────────────
  Future<ItemModel> resolverItem(int id) async {
    try {
      final response = await _dio.patch(ApiConstants.itemResolver(id));
      return ItemModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  // ─────────────────────────────────────────────────────────
  // PATCH /api/itens/{id}/reabrir
  // Altera o status do item para ABERTO.
  // ─────────────────────────────────────────────────────────
  Future<ItemModel> reabrirItem(int id) async {
    try {
      final response = await _dio.patch(ApiConstants.itemReabrir(id));
      return ItemModel.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  // ─────────────────────────────────────────────────────────
  // DELETE /api/itens/{id}
  // Exclui um item pelo ID.
  // ─────────────────────────────────────────────────────────
  Future<void> excluirItem(int id) async {
    try {
      await _dio.delete(ApiConstants.itemById(id));
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  // ─────────────────────────────────────────────────────────
  // Tratamento centralizado de erros do Dio.
  // O interceptor em DioClient já converte 400/404 em ApiException
  // que fica armazenada em DioException.error.
  // ─────────────────────────────────────────────────────────
  Never _handleDioError(DioException e) {
    if (e.error is ApiException) {
      throw e.error as ApiException;
    }
    // Erros de rede, timeout, etc.
    throw ApiException(
      statusCode: e.response?.statusCode,
      erro: 'NETWORK_ERROR',
      mensagem: e.message ?? 'Erro de conexão com o servidor.',
    );
  }
}
