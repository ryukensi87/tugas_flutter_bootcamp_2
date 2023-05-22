import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_flutter_bootcamp_2/domain/use_case/get_book_use_case.dart';

import '../../../../data/model/book/book_model.dart';

class HomeController extends GetxController {
  final GetBookUseCase _getBookUseCase;

  HomeController(this._getBookUseCase);

  Rx<List<Book>> books = Rx([]);
  Rx<TextEditingController> searchController = Rx(TextEditingController());

  void getBook() async {
    final result = await _getBookUseCase.call();

    if (result != null) {
      books(result.books);
      update();
    }
  }

  void getSearchQuery() {
    update();
  }

  void getBookByQuery() {
    final query = searchController.value.text;
    print(query);
  }
}
