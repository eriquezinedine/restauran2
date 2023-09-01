import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurapp2/model/carro_model.dart';
import 'package:restaurapp2/pages/carro_page.dart';

class ShoppingCount extends StatelessWidget {
  const ShoppingCount({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CarroModel>(
      builder: (context, value, child) {
        return Stack(
          clipBehavior: Clip.none,
          children: [
            FloatingActionButton(
              foregroundColor: const Color(0xffdef7ff),
              backgroundColor: Colors.black,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const CarroPage();
                  },
                ),
              ),
              child: const Icon(Icons.shopping_cart),
            ),
            Positioned(
              top: -7,
              right: -2,
              child: CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 223, 242, 248),
                radius: 14,
                child: Text(
                  value.itemCount(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
