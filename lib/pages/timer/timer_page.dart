import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// Mi timer view widget es un widget hijo de homepage,
// en este timer view tengo la logica en el init de comenzar
// un timer cada un segundo, ademas le paso el parametro color

// en home page defino una variable _color privada, y digo que es igual
// al primer color primario, luego creo un boolleano para esconder
// o mostrar el timerView,

// defino un list view builder donde defino que item count es igual a
// colors.primaries.lenght y luego en itemcount creo una variable local del list
// llamada color y digo que es igual a coolor.primaries[index]
// a su vez como este list view builder retorna un container con
// colores lo encierro en un gesture y digo que la variable privada
// _color es igual al color seleccionado, por lo que le paso al parametro
// del timerview esta variable de color, luego declaro un set state
// y el color del numero se pinta segun el color selecionado

class _HomePageState extends State<HomePage> {
  bool _showTimer = true;
  Color _color = Colors.primaries.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showTimer = !_showTimer;
          setState(() {});
        },
      ),
      body: SafeArea(
          child: Column(
        children: [
          if (_showTimer)
            TimerView(
              color: _color,
            ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (_, index) {
              final color = Colors.primaries[index];
              return GestureDetector(
                onTap: () {
                  _color = color;
                  setState(() {});
                },
                child: Container(
                  color: color,
                  height: 50,
                ),
              );
            },
            itemCount: Colors.primaries.length,
          ))
        ],
      )),
    );
  }
}

class TimerView extends StatefulWidget {
  const TimerView({
    Key? key,
    required this.color,
  }) : super(key: key);
  final Color color;

  @override
  State<TimerView> createState() => TimerViewState();
}

class TimerViewState extends State<TimerView> {
  int _time = 0;
  Timer? _timer;
  @override
  void initState() {
    super.initState();
    // declaramos una variable de tipo Timer que sera nuestro Timer
    // por el proposito de cerrar su continuidad con dispose
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      // reemplazamos la propiedad de Timer timer por un guion bajo
      (_) {
        _time++;
        setState(() {});
        // if (_time >= 10) {
        //   timer.cancel();
        // }
      },
    );
  }

// puede mostrar informacion del widget antes de actualizarlo
  @override
  void didUpdateWidget(covariant TimerView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.color != widget.color) {
      print('si es distinto el color anterior del nuevo por lo que resetea a 0 el timer');
      _time = 0;
    }
    print('old : ${oldWidget.color}');
    print('current : ${widget.color}');
  }

  @override
  void dispose() {
    print('timmer dispose');
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('timer build');
    return Text(
      '$_time',
      style: TextStyle(fontSize: 50, color: widget.color),
    );
  }
}
