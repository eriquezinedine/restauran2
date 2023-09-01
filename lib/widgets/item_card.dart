import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurapp2/core/utils/deboncer.dart';
import 'package:restaurapp2/model/carro_model.dart';
import 'package:restaurapp2/view/counter.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    super.key,
    required this.index,
    this.onChanged,
  });

  final int index;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    final debouncer = Debouncer(milliseconds: 300);

    return Consumer<CarroModel>(
      builder: (context, value, __) {
        final itemProduct = value.listadoCarro[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xffdef7ff),
              borderRadius: BorderRadius.circular(8),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                    color: Color.fromARGB(79, 12, 65, 67),
                    blurRadius: 5,
                    offset: Offset(4, 3))
              ],
            ),
            child: ListTile(
              leading: Image.asset(
                itemProduct.img,
                height: 64,
                width: 64,
                fit: BoxFit.cover,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemProduct.nombre,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Counter(itemProduct: itemProduct),
                      Text('\$ ${itemProduct.price * itemProduct.count}')
                    ],
                  ),
                  TextFormField(
                    initialValue: itemProduct.note,
                    maxLines: 1,
                    obscureText: false,
                    onChanged: (value) {
                      debouncer.run(() {
                        if (onChanged != null) onChanged!(value);
                      });
                    },
                    decoration: const InputDecoration(
                      isDense: true,
                    ),
                  ),
                ],
              ),
              trailing: IconButton(
                icon: const Icon(Icons.cancel),
                color: Colors.black,
                onPressed: () => Provider.of<CarroModel>(context, listen: false)
                    .borrarDelCarro(itemProduct),
              ),
            ),
          ),
        );
      },
    );
  }
}
