import 'package:flutter/material.dart';

class SwitchQualityState extends StatelessWidget {
  final bool value;
  final String quality;
  final MaterialColor color;

  const SwitchQualityState({Key key, this.value, this.quality, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Switch(
          value: value,
          onChanged: (value) {
            // this.value = !value;
          },
          activeColor: Colors.green,
        ),
        Text(
          quality,
          style: TextStyle(color: color, fontSize: 16),
        )
      ],
    );
  }
}
