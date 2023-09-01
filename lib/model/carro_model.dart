import 'package:flutter/material.dart';
import 'package:restaurapp2/core/model/product.dart';
import 'package:url_launcher/url_launcher.dart';

class CarroModel extends ChangeNotifier {
  //lista de ítems en el carro

  //listado inicial de elementos en el carro
  List<Product> _listadoCarro = [];

  // get carrito => _carrito;

  List<Product> get listadoCarro => _listadoCarro;

  //agregar elemento al carro
  void agregarAlCarro(Product product) {
    final index = _listadoCarro.indexWhere((item) => product.id == item.id);

    if (index == -1) {
      _listadoCarro.add(product);
    } else {
      _listadoCarro[index] =
          _listadoCarro[index].copyWith(count: _listadoCarro[index].count += 1);
    }
    notifyListeners();
  }

  void agregarComentario({
    required Product product,
    required String comment,
    required int index,
  }) {
    _listadoCarro[index] = _listadoCarro[index].copyWith(comment: comment);
    notifyListeners();
  }

  //borrar elelmento del carro
  void borrarDelCarro(Product product) {
    if (_listadoCarro.isNotEmpty) {
      final index = _listadoCarro.indexWhere((prod) => prod.id == product.id);
      if (index != -1) {
        _listadoCarro.removeAt(index);
        notifyListeners();
      }
    }
  }

  void addProduct(Product product) {
    int count = product.count;
    int result = count += 1;
    final pr = product.copyWith(count: result);

    List<Product> newList = _listadoCarro.map((pro) {
      return pro.id == product.id ? pr : pro;
    }).toList();

    _listadoCarro = newList;
    notifyListeners();
  }

  void removeProduct(Product product) {
    int count = product.count;
    int result = count -= 1;
    List<Product> newList = _listadoCarro
        .map((pro) => pro.id == product.id
            ? product.copyWith(count: (result) < 1 ? 1 : result)
            : pro)
        .toList();

    _listadoCarro = newList;
    notifyListeners();
  }

  String calculaTotal() {
    int total = 0;
    for (int i = 0; i < _listadoCarro.length; i++) {
      total += (_listadoCarro[i].price * _listadoCarro[i].count);
    }
    return total.toString();
  }

  String itemCount() {
    int total = 0;
    for (Product product in _listadoCarro) {
      total += product.count;
    }

    return total.toString();
  }

  Future<void> enviarMsg() async {
    if (_listadoCarro.isEmpty) return;
    const String phoneNumber = '+51952542211';
    String message = '*Mi pedido:*\n';

    for (Product product in _listadoCarro) {
      final productTotal = product.price * product.count;

      final comment =
          product.note != null ? '*Nota:* ${product.note} \n\n' : '\n\n';

      message +=
          '- *${product.nombre}* x${product.count} - \$$productTotal\n $comment';
    }

    message += '\n\n Total: \$${calculaTotal()}';

    final whatsappUrl = 'https://wa.me/$phoneNumber?text=$message';

    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      print('No se pudo abrir WhatsApp.');
    }
  }
}
