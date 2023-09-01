import 'package:flutter/material.dart';
import 'package:restaurapp2/core/data/data.dart';

class ListTabCategory extends StatefulWidget {
  const ListTabCategory({
    super.key,
  });

  @override
  State<ListTabCategory> createState() => _ListTabCategoryState();
}

class _ListTabCategoryState extends State<ListTabCategory> {
  int selection = 0;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      unselectedLabelColor: const Color.fromARGB(133, 110, 107, 107),
      labelColor: Colors.black,
      indicator: BoxDecoration(
        color: const Color.fromARGB(255, 179, 222, 235),
        borderRadius: BorderRadius.circular(8),
      ),
      tabs: List.generate(
        Data.dataCategory.length,
        (index) => Tab(
          text: Data.dataCategory[index].nombre,
        ),
      ),
    );
  }
}
