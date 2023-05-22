import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tugas_flutter_bootcamp_2/data/datasource/book_remote_datasource_http.dart';
import 'package:tugas_flutter_bootcamp_2/data/model/book/book_model.dart';
import 'package:tugas_flutter_bootcamp_2/data/repository/book_repository_imp.dart';
import 'package:tugas_flutter_bootcamp_2/domain/use_case/get_book_use_case.dart';
import 'package:tugas_flutter_bootcamp_2/presentation/screens/detail/page/detail_page.dart';
import 'package:tugas_flutter_bootcamp_2/presentation/screens/home/controller/home_controller.dart';
import 'package:tugas_flutter_bootcamp_2/presentation/screens/search/page/search_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _controller = HomeController(
    GetBookUseCase(
      BookRepositoryImpl(
        // BookRemoteDataSourceDio(Dio()),
        BookRemoteDataSourceHttp(),
      ),
    ),
  );

  void navigateToSearch(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchPage(
          query: _controller.searchController.value.text,
        ),
      ),
    );
  }

  void navigateToDetail(BuildContext context, Book book) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(book: book),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GetBuilder<HomeController>(
            init: _controller,
            initState: (state) => _controller.getBook(),
            builder: (cont) {
              return Column(
                children: [
                  TextField(
                    controller: _controller.searchController.value,
                    onChanged: (value) => _controller.getSearchQuery(),
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        onPressed: () => navigateToSearch(context),
                        icon: const Icon(Icons.search),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Expanded(
                    child: ListView.separated(
                      itemCount: _controller.books.value.length,
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 8,
                      ),
                      itemBuilder: (context, index) {
                        final book = _controller.books.value[index];

                        return InkWell(
                          onTap: () => navigateToDetail(context, book),
                          child: Row(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                color: Colors.red,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      book.title,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      book.subtitle,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
