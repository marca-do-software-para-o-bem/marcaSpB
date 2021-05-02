import 'package:flutter/material.dart';

class SwitchQuality extends StatefulWidget {
  bool value;
  final MaterialColor color;
  final String quality;

  SwitchQuality({Key key, this.color, this.quality, this.value})
      : super(key: key);

  @override
  _SwitchQualityState createState() => _SwitchQualityState();
}

class _SwitchQualityState extends State<SwitchQuality> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Switch(
          value: widget.value,
          onChanged: (value) {
            setState(() {
              widget.value = value;
            });
          },
          activeColor: Colors.green,
        ),
        Text(
          widget.quality,
          style: TextStyle(color: widget.color, fontSize: 16),
        )
      ],
    );
  }
}
