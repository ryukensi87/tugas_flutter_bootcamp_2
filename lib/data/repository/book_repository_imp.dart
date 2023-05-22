import 'package:tugas_flutter_bootcamp_2/data/datasource/book_remote_datasource.dart';
import 'package:tugas_flutter_bootcamp_2/data/model/book_responses/book_responses_model.dart';
import 'package:tugas_flutter_bootcamp_2/domain/repository/book_repository.dart';

class BookRepositoryImpl implements BookRepository {
  final BookRemoteDatasource _remoteDataSource;

  const BookRepositoryImpl(this._remoteDataSource);
  @override
  Future<BookResponse?> getBook() async => await _remoteDataSource.getBook();

  @override
  Future<void> addBook() {
    // TODO: implement addBook
    throw UnimplementedError();
  }
}
