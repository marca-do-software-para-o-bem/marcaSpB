import 'package:flutter/material.dart';

class CircularLoading extends StatelessWidget {
  final Widget _appBar;

  CircularLoading(this._appBar);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
