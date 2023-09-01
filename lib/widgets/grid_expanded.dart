import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurapp2/components/plato_tile.dart';
import 'package:restaurapp2/core/model/product.dart';
import 'package:restaurapp2/model/carro_model.dart';

class GridExpanded extends StatelessWidget {
  const GridExpanded({
    super.key,
    required this.products,
    this.isRemoveMsg = true,
  });

  final bool isRemoveMsg;
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return Consumer<CarroModel>(
      builder: (context, value, child) {
        return DynamicHeightGridView(
          itemCount: products.length,
          crossAxisCount: 2,
          builder: (context, index) {
            return PlatoTile(
              nombre: products[index].nombre,
              precio: products[index].price.toString(),
              descripcion: products[index].description,
              imgPath: products[index].img,
              onPressed: () {
                Provider.of<CarroModel>(context, listen: false)
                    .agregarAlCarro(products[index]);
                if (!isRemoveMsg) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Producto agregado'),
                      duration: Duration(milliseconds: 500),
                    ),
                  );
                }
              },
            );
          },
        );
      },
    );
  }
}
