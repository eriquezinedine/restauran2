import 'package:flutter/material.dart';
import 'package:restaurapp2/core/data/data.dart';
import 'package:restaurapp2/pages/search_page.dart';
import 'package:restaurapp2/view/shopping_count.dart';
import 'package:restaurapp2/widgets/grid_expanded.dart';
import 'package:restaurapp2/widgets/list_tab_category.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: Data.dataCategory.length,
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 223, 242, 248),
          floatingActionButton: const ShoppingCount(),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            iconTheme: const IconThemeData(color: Colors.black),
            title: const Text(
              "Arma tu pedido",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const SearchPage();
                        },
                      ),
                    );
                  },
                  icon: const Icon(Icons.search))
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: ListTabCategory(),
              ),
              Expanded(
                  child: ColoredBox(
                color: const Color.fromARGB(255, 255, 255, 255),
                child: TabBarView(
                  children: List.generate(
                    Data.dataCategory.length,
                    (index) => GridExpanded(
                      products: Data.dataProduct[index],
                    ),
                  ),
                ),
              ))
            ],
          )),
    );
  }
}
