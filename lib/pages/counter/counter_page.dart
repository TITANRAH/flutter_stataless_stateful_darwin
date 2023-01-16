import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  final int initialValue;

  CounterPage({
    this.initialValue = 0,
  });

  @override
  State createState() {
    return CounterPageState();
  }
}

class CounterPageState extends State<CounterPage> {
  // puedo inicializar el valor de count en initstate poniendo late
  // int counter = 0;

  late int counter;

  // se ejecuta solo una vez
  @override
  void initState() {
    super.initState();
    // con esto puedo parametrizar el counter indicandole que sera
    // 100 en el main
    counter = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    print('recargado');
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          '$counter',
          style: const TextStyle(
            fontSize: 40,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // counter = counter + 1;
          // el set reconstruye la vista
          counter++;

          setState(() {});
        },
      ),
    );
  }
}
// al crear un statefull widget extraido no toma en cuenta el initstate del creado si no solo el del padre
