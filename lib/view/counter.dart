import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurapp2/core/model/product.dart';
import 'package:restaurapp2/model/carro_model.dart';

class Counter extends StatelessWidget {
  const Counter({super.key, required this.itemProduct});

  final Product itemProduct;
  @override
  Widget build(BuildContext context) {
                    
    return 
    Consumer<CarroModel>(
builder: (context, value, child) {
  return Row(
      children: [
        GestureDetector(
          onTap: (){
            value.addProduct(itemProduct);
          },
          child: const Icon(Icons.add_circle_rounded,size: 24, color: Colors.black,)),
        const SizedBox(width: 4,),
        Text(itemProduct.count.toString()),
        const SizedBox(width: 4,),
        GestureDetector(
          onTap: ()=> value.removeProduct(itemProduct),
          child: const Icon(Icons.remove_circle,size: 24,color: Colors.black)),
      ],
    );
    },
    );
  }
}