import 'package:restaurapp2/core/model/category.dart';
import 'package:restaurapp2/core/model/product.dart';

class Data {
  Data._();

  static final dataCategory = [
    Category(id: 'CAT-1', nombre: 'Ensalada'),
    Category(id: 'CAT-2', nombre: 'Italiana'),
    Category(id: 'CAT-3', nombre: 'Postres'),
    Category(id: 'CAT-4', nombre: 'Arrozes'),
    Category(id: 'CAT-5', nombre: 'Bebidas'),
    Category(id: 'CAT-6', nombre: 'Pizza'),
  ];

  static final dataEnsaladas = [
    Product(
      id: 'PROD-1',
      nombre: 'Ensalada de lechuga y tomate. Ademas de amor mucho amor',
      category: dataCategory[0],
      price: 8000,
      img: 'assets/img/lechuga_tomate.jpg',
    ),
    Product(
      id: 'PROD-2',
      nombre: 'Ensalada de pollo',
      category: dataCategory[0],
      price: 7000,
      img: 'assets/img/ensalada_pollo.jpg',
    ),
    Product(
      id: 'PROD-3',
      nombre: 'Ensalada rusa',
      category: dataCategory[0],
      price: 7000,
      img: 'assets/img/ensalada_rusa.png',
    ),
    Product(
      id: 'PROD-A1',
      nombre: 'Ensalada fria mixta de vegetales',
      category: dataCategory[0],
      price: 7000,
      img: 'assets/img/ensalada_mixta.jpg',
    ),
    Product(
      id: 'PROD-A2',
      nombre: 'Poke de atun y algas con palta',
      category: dataCategory[0],
      price: 7000,
      img: 'assets/img/ensalada_poke.jpeg',
    ),
  ];

  static final dataItaliana = [
    Product(
      id: 'PROD-7',
      nombre: 'Pizza Margarita',
      category: dataCategory[5],
      price: 12000,
      img: 'assets/img/r1.png',
    ),
    Product(
      id: 'PROD-8',
      nombre: 'Pasta Carbonara',
      category: dataCategory[1],
      price: 10000,
      img: 'assets/img/r2.jpg',
    ),
  ];

  static final dataPostres = [
    Product(
      id: 'PROD-13',
      nombre: 'Tiramisú',
      category: dataCategory[2],
      price: 6000,
      img: 'assets/img/t1.jpeg',
    ),
    Product(
      id: 'PROD-14',
      nombre: 'Pastel de Chocolate',
      category: dataCategory[2],
      price: 5000,
      img: 'assets/img/t2.jpeg',
    ),
  ];

  static final dataArrozes = [
    Product(
      id: 'PROD-19',
      nombre: 'Paella Valenciana',
      category: dataCategory[3],
      price: 14000,
      img: 'assets/img/p1.jpg',
    ),
    Product(
      id: 'PROD-20',
      nombre: 'Arroz con Pollo',
      category: dataCategory[3],
      price: 10000,
      img: 'assets/img/p2.jpg',
    ),
  ];

  static final dataBebidas = [
    Product(
      id: 'PROD-25',
      nombre: 'Refresco de Limón',
      category: dataCategory[4],
      price: 1000,
      img: 'assets/img/l1.jpg',
    ),
    Product(
      id: 'PROD-26',
      nombre: 'Cerveza Artesanal',
      category: dataCategory[4],
      price: 3000,
      img: 'assets/img/l2.png',
    ),
  ];

  static final dataPizza = [
    Product(
      id: 'PROD-31',
      nombre: 'Pizza Hawaiana',
      category: dataCategory[5],
      price: 11000,
      img: 'assets/img/hs1.jpg',
    ),
    Product(
      id: 'PROD-32',
      nombre: 'Pizza Pepperoni',
      category: dataCategory[5],
      price: 10000,
      img: 'assets/img/hs2.jpg',
    ),
  ];

  static final dataProduct = [
    dataEnsaladas,
    dataItaliana,
    dataPostres,
    dataArrozes,
    dataBebidas,
    dataPizza
  ];

  static final dataSearch = [
    ...dataEnsaladas,
    ...dataItaliana,
    ...dataPostres,
    ...dataArrozes,
    ...dataBebidas,
    ...dataPizza
  ];
}
