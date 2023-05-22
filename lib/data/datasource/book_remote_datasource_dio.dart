import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:tugas_flutter_bootcamp_2/data/constants/constants.dart';
import 'package:tugas_flutter_bootcamp_2/data/datasource/book_remote_datasource.dart';
import 'package:tugas_flutter_bootcamp_2/data/model/book_responses/book_responses_model.dart';

class BookRemoteDataSourceDio implements BookRemoteDatasource {
  final Dio _client;

  const BookRemoteDataSourceDio(this._client);

  get error => null;

  get stacktrace => null;

  @override
  Future<BookResponse?> getBook() async {
    try {
      final url = Constants.allBookUrl;

      final result = await _client.get(url);

      if (result.statusCode == 200) {
        return BookResponse.fromJson(result.data);
      }
      return null;
    } catch (error, stacktrace) {
      log('Error on GetBook $error', stackTrace: stacktrace);
      return null;
    }
  }
}
