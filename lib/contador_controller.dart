import 'package:mobx/mobx.dart';

class ContadorController {
  //! Controller com exemplo feito ' na mao '
  final _valor = Observable(0);

  ContadorController() {
    increment = Action(_increment);
  }

  int get valor => _valor.value;
  set valor(novoValor) => _valor.value = novoValor;
  Action increment;
  Computed<String> _mensagemMultiplicacao;

  String get mensagemMultiplicacao {
    _mensagemMultiplicacao ??= Computed<String>(
        () => 'O valor multiplicado por 2 é ${_valor.value * 2}');
    return _mensagemMultiplicacao.value;
  }

  void _increment() {
    _valor.value++;
  }
}
