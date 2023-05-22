import 'dart:convert';
import 'dart:developer';
import 'package:tugas_flutter_bootcamp_2/data/constants/constants.dart';
import 'package:tugas_flutter_bootcamp_2/data/datasource/book_remote_datasource.dart';
import '../model/book_responses/book_responses_model.dart';
import 'package:http/http.dart' as _client;

class BookRemoteDataSourceHttp implements BookRemoteDatasource {
  @override
  Future<BookResponse?> getBook() async {
    try {
      final Url = Constants.allBookUrl;
      final result = await _client.get(Uri.parse(Url));
      if (result.statusCode == 200) {
        return BookResponse.fromJson(json.decode(result.body));
      }

      return null;
    } catch (error, stacktrace) {
      log('Error on GetBook $error', stackTrace: stacktrace);
      return null;
    }
  }
}
