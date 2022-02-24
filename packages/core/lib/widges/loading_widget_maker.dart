import 'package:flutter/material.dart';

class LoadingWidgetMaker extends StatelessWidget {
  const LoadingWidgetMaker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 50,
        padding: const EdgeInsets.all(10),
        child: const CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
