import 'package:dio/dio.dart';
import '../constants/api_constants.dart';

/// Exceção tipada que representa um erro da API.
class ApiException implements Exception {
  final int? statusCode;
  final String erro;
  final String mensagem;
  final List<CampoErro> campos;

  const ApiException({
    this.statusCode,
    required this.erro,
    required this.mensagem,
    this.campos = const [],
  });

  @override
  String toString() => 'ApiException($statusCode): $mensagem';
}

/// Representa um campo com erro de validação retornado pela API.
class CampoErro {
  final String campo;
  final String mensagem;

  const CampoErro({required this.campo, required this.mensagem});

  factory CampoErro.fromJson(Map<String, dynamic> json) => CampoErro(
        campo: json['campo'] as String? ?? '',
        mensagem: json['mensagem'] as String? ?? '',
      );
}

/// Instância singleton do Dio com configuração base e interceptors.
class DioClient {
  DioClient._();

  static Dio? _instance;

  static Dio get instance {
    _instance ??= _build();
    return _instance!;
  }

  static Dio _build() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    dio.interceptors.add(_ErrorInterceptor());

    return dio;
  }
}

/// Interceptor que converte erros HTTP em [ApiException].
class _ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final response = err.response;

    if (response != null &&
        (response.statusCode == 400 || response.statusCode == 404)) {
      final data = response.data;
      if (data is Map<String, dynamic>) {
        final campos = <CampoErro>[];
        final rawCampos = data['campos'];
        if (rawCampos is List) {
          for (final c in rawCampos) {
            if (c is Map<String, dynamic>) {
              campos.add(CampoErro.fromJson(c));
            }
          }
        }

        return handler.reject(
          DioException(
            requestOptions: err.requestOptions,
            error: ApiException(
              statusCode: response.statusCode,
              erro: data['erro'] as String? ?? 'ERRO',
              mensagem: data['mensagem'] as String? ?? err.message ?? 'Erro desconhecido',
              campos: campos,
            ),
            response: response,
            type: err.type,
          ),
        );
      }
    }

    handler.next(err);
  }
}
