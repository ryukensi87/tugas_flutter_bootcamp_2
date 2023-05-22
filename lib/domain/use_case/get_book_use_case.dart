import 'package:tugas_flutter_bootcamp_2/data/model/book_responses/book_responses_model.dart';
import 'package:tugas_flutter_bootcamp_2/domain/repository/book_repository.dart';

class GetBookUseCase {
  final BookRepository _repository;

  const GetBookUseCase(this._repository);

  Future<BookResponse?> call() async => await _repository.getBook();
}
