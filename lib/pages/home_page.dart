import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:fuel_helper_flutter/widgets/logo_widget.dart';
import 'package:fuel_helper_flutter/widgets/submit_form_widget.dart';
import 'package:fuel_helper_flutter/widgets/sucess_widget.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _color = Colors.deepPurple;
  var _fuelCtrl = MoneyMaskedTextController();
  var _alcoholCtrl = MoneyMaskedTextController();
  var _busy = false;
  var _completed = false;
  String _resultText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: AnimatedContainer(
        duration: Duration(
          milliseconds: 1200,
        ),
        color: _color,
        child: ListView(
          children: [
            Logo(),
            _completed
                ? Sucess(
                    result: _resultText,
                    func: reset,
                  )
                : SubmitForm(
                    fuelCtrl: _fuelCtrl,
                    alcoholCtrl: _alcoholCtrl,
                    busy: _busy,
                    func: calculate,
                  ),
          ],
        ),
      ),
    );
  }

  Future calculate() {
    double alcohol =
        double.parse(_alcoholCtrl.text.replaceAll(RegExp(r'[,.]'), '')) / 100;
    double fuel =
        double.parse(_fuelCtrl.text.replaceAll(RegExp(r'[,.]'), '')) / 100;
    double res = alcohol / fuel;
    setState(() {
      _color = Colors.deepPurpleAccent;
      _completed = false;
      _busy = true;
    });
    return Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        if (res >= 0.7) {
          _resultText = "Compensa utilizar gasolina.";
        } else {
          _resultText = "Compensa utilizar álcool.";
        }
        _completed = true;
        _busy = false;
      });
    });
  }

  reset() {
    setState(() {
      _fuelCtrl = MoneyMaskedTextController();
      _alcoholCtrl = MoneyMaskedTextController();
      _completed = false;
      _busy = false;
      _color = Colors.deepPurple;
    });
  }
}
