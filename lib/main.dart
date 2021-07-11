import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_examples/contador_controller.dart';

import 'contador2_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // var controller = ContadorController();
  var controller = Contador2Controller();

  @override
  void initState() {
    super.initState();

    //* Executa a primeira vez, depois somente se tiver um observable dentro dele
    // autorun((_) {
    //   print('Autorun executando');
    //   print(controller.valor);
    // });

    //* Escuta as alteracoes na instancia indicada
    // reaction((_) => controller.valor, (valor) => print(valor));

    //* Escuta as alteracoes com uma condicao
    //* When só executa uma UNICA vez
    // when((_) => controller.valor == 20, () => print('Valor é igual a 20'));

    //* whenAsync() executa em funcoes assincronas
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Observer(builder: (context) {
              return Text(
                controller.mensagemMultiplicacao,
              );
            }),
            Observer(builder: (context) {
              return Text(
                '${controller.valor}',
                style: Theme.of(context).textTheme.headline4,
              );
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.increment(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
