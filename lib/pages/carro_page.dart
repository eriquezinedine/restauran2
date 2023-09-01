import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurapp2/model/carro_model.dart';
import 'package:restaurapp2/widgets/item_card.dart';

class CarroPage extends StatelessWidget {
  const CarroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Pedido en curso",
          style: TextStyle(
              fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Consumer<CarroModel>(
        builder: (context, value, child) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: value.listadoCarro.length,
                    padding: const EdgeInsets.all(12),
                    itemBuilder: (context, index) {
                      return ItemCard(
                        index: index,
                        onChanged: (p) {
                          value.agregarComentario(
                              product: value.listadoCarro[index],
                              comment: p,
                              index: index);
                        },
                      );
                    }),
              ),

              //boton de imprimir
              Padding(
                padding: const EdgeInsets.all(36.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "Total a pagar",
                            style: TextStyle(color: Color(0xffdef7ff)),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "\$${value.calculaTotal()}",
                            style: const TextStyle(
                                color: Color(0xffdef7ff),
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ],
                      ),
                      //botón imprimir
                      GestureDetector(
                        onTap: value.enviarMsg,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(
                                color: const Color(0xffdef7ff), width: 4),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: const Row(
                            children: [
                              Text(
                                "Imprimir ",
                                style: TextStyle(
                                    color: Color(0xffdef7ff),
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.print,
                                size: 20,
                                color: Color(0xffdef7ff),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
