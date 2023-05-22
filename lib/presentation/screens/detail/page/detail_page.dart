import 'package:flutter/material.dart'
    show AppBar, BuildContext, Center, Scaffold, StatelessWidget, Text, Widget;
import 'package:flutter/src/widgets/basic.dart';
import 'package:get/get.dart';
import 'package:tugas_flutter_bootcamp_2/data/model/book/book_model.dart';
import 'package:tugas_flutter_bootcamp_2/presentation/screens/detail/controller/detail_controller.dart';

class DetailPage extends StatelessWidget {
  final Book book;
  DetailPage({super.key, required this.book});

  final _controller = DetailController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GetBuilder<DetailController>(
          init: _controller,
          initState: (state) => _controller.getDetailBook(book.isbn13),
          builder: (context) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(book.title),
                  Text(book.isbn13),
                ],
              ),
            );
          }),
    );
  }
}
