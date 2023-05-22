import 'package:tugas_flutter_bootcamp_2/data/model/book_responses/book_responses_model.dart';

abstract class BookRepository {
  Future<BookResponse?> getBook();
  Future<void> addBook();
}
