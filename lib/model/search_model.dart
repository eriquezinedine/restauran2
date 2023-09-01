import 'package:flutter/material.dart';
import 'package:restaurapp2/core/data/data.dart';
import 'package:restaurapp2/core/model/product.dart';


enum SttusSearch{
  init,
  loading,
  loaded,
  error
}


class SearchModel extends ChangeNotifier {
  //lista de ítems en el carro
  List<Product> resultado = [ ];
  SttusSearch sttusSearch = SttusSearch.init;
  final _controller = TextEditingController();


  List<Product> get resultadoSearch => resultado;
  TextEditingController get searchController => _controller;

  //agregar elemento al carro
  void buscarProducto(String value) {
    
    if(Data.dataSearch.isEmpty){
      resultado = [];
     notifyListeners();
     return;
    }

   final searchList = Data.dataSearch.where(
      (product) => product.nombre.toUpperCase().contains(value.toUpperCase())
    ).toList();  

    sttusSearch = SttusSearch.loaded;
    resultado = searchList;
    notifyListeners();

  }

  void loading(){
    sttusSearch = SttusSearch.loading;
    resultado = [];
    notifyListeners();
  }

  void vaciar(){
    resultado = [];
    _controller.clear();
    notifyListeners();
  }

  //borrar elelmento del carro
  void borrarDelCarro(int index) {
    // _listadoCarro.removeAt(index);
    notifyListeners();
  }

  //calcular precio total del carro
  String calculaTotal() {
    return '';
    // int total = 0;
    // for (int i = 0; i < _listadoCarro.length; i++) {
    //   total += int.parse(_listadoCarro[i][1]);
    // }
    // return total.toString();
  }
}
