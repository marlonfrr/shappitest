import 'dart:io';

import 'package:http/http.dart';

class Repository {
  Repository._();

  static final Repository instance = Repository._();
  static final Client clientInstance = Client();

  Future<Response> get({
    required String path,
    String? queryParams,
    int? page = 0,
  }) async {
    try {
      return (await clientInstance.get(
        Uri.parse(
            'https://rickandmortyapi.com$path?page=$page${queryParams != null ? '&$queryParams' : ''}'),
      ));
    } on Exception catch (_) {
      rethrow;
    }
  }
}
