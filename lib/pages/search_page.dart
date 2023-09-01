import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurapp2/components/mytextfield.dart';
import 'package:restaurapp2/core/utils/deboncer.dart';
import 'package:restaurapp2/model/search_model.dart';
import 'package:restaurapp2/widgets/grid_expanded.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final debouncer =
        Debouncer(milliseconds: 300); // Ajusta el tiempo según tu necesidad

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 223, 242, 248),
        leading: GestureDetector(
          onTap: () {
            Provider.of<SearchModel>(context, listen: false).vaciar();
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        title: const Text(
          "Buscar Productos",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 8,
          ),
          Consumer<SearchModel>(
            builder: (context, value, _) {
              return MyTextField(
                  controller: value.searchController,
                  onChanged: (value) {
                    Provider.of<SearchModel>(context, listen: false).loading();
                    debouncer.run(() {
                      Provider.of<SearchModel>(context, listen: false)
                          .buscarProducto(value);
                    });
                  },
                  hintText: 'Buscar producto',
                  obscureText: false);
            },
          ),
          const SizedBox(
            height: 8,
          ),
          Consumer<SearchModel>(
            builder: (context, value, __) => Expanded(
              child: value.sttusSearch == SttusSearch.loading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : value.resultadoSearch.isEmpty
                      ? const Center(
                          child: Text('No hay data'),
                        )
                      : GridExpanded(
                          products: value.resultadoSearch,
                          isRemoveMsg: false,
                        ),
            ),
          )
        ],
      ),
    );
  }
}
