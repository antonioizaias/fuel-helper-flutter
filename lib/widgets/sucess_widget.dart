import 'package:flutter/material.dart';
import 'package:fuel_helper_flutter/widgets/loading_button_widget.dart';

class Sucess extends StatelessWidget {
  String result;
  Function func;

  Sucess({
    @required this.result,
    @required this.func,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 50.0,
          ),
          Text(
            result,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: 40.0,
              fontFamily: "Big Shoulders Display",
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.0,
          ),
          LoadingButton(
            busy: false,
            invert: true,
            func: func,
            text: "CALCULAR NOVAMENTE",
          ),
        ],
      ),
    );
  }
}
