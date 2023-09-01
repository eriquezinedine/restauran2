import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PlatoTile extends StatelessWidget {
  final String nombre;
  final String precio;
  final String descripcion;
  final String imgPath;
  void Function()? onPressed;

  PlatoTile(
      {super.key,
      required this.onPressed,
      required this.nombre,
      required this.precio,
      required this.descripcion,
      required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xffdef7ff),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imgPath,
              height: 86,
              width: 86,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 2,
            ),
            //nombre
            Text(
              nombre,
              maxLines: 2,
              textAlign: TextAlign.center,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
              ),
            ),
            //precio
            MaterialButton(
              onPressed: onPressed,
              color: Colors.black,
              child: Text(
                "\$$precio",
                style: const TextStyle(
                  color: Color(0xffdef7ff),
                ),
              ),
            ),
            //desc
            Text(
              descripcion,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
