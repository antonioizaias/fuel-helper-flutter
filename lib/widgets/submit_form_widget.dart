import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:fuel_helper_flutter/widgets/input_widget.dart';
import 'package:fuel_helper_flutter/widgets/loading_button_widget.dart';

class SubmitForm extends StatelessWidget {
  var fuelCtrl = MoneyMaskedTextController();
  var alcoholCtrl = MoneyMaskedTextController();
  var busy = false;
  Function func;

  SubmitForm({
    @required this.fuelCtrl,
    @required this.alcoholCtrl,
    @required this.busy,
    @required this.func,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 30.0,
            right: 30.0,
          ),
          child: Input(
            label: "Gasolina: ",
            ctrl: fuelCtrl,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 30.0,
            right: 30.0,
          ),
          child: Input(
            label: "Álcool: ",
            ctrl: alcoholCtrl,
          ),
        ),
        LoadingButton(
          busy: busy,
          invert: false,
          func: func,
          text: "CALCULAR",
        ),
      ],
    );
  }
}
