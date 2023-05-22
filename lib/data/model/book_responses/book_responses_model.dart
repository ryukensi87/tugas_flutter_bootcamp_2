import 'package:tugas_flutter_bootcamp_2/data/model/book/book_model.dart';

class BookResponse {
  String error;
  String total;
  List<Book> books;

  BookResponse({
    required this.error,
    required this.total,
    required this.books,
  });

  factory BookResponse.fromJson(Map<String, dynamic> json) => BookResponse(
        error: json["error"],
        total: json["total"],
        books: List<Book>.from(json["books"].map((x) => Book.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "total": total,
        "books": List<dynamic>.from(books.map((x) => x.toJson())),
      };
}
