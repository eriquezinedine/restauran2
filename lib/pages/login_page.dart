import 'package:flutter/material.dart';
import 'package:restaurapp2/components/mytextfield.dart';

import 'home_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  //controllers de los textfields
  final userController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0cb7f2),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              //logo
              const Padding(
                padding: EdgeInsets.all(60.0),
                child: Icon(
                  Icons.restaurant,
                  size: 200,
                ),
              ),
              const Text("Por favor ingrese su usuario y contraseña."),
              const SizedBox(height: 50),
              //campo user
              MyTextField(
                controller: userController,
                hintText: "Usuario",
                obscureText: false,
              ),
              const SizedBox(height: 20),
              // campo pass
              MyTextField(
                controller: passController,
                hintText: "Password",
                obscureText: true,
              ),
              const Spacer(),
              //boton ingresar
              GestureDetector(
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const HomePage();
                    },
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(25),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  child: const Text(
                    "Ingresar",
                    style: TextStyle(
                      color: Color(0xffdef7ff),
                    ),
                  ),
                ),
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }
}
