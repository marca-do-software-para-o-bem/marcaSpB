import 'package:flutter/material.dart';

abstract class GeneratedImagePageEvent {
  const GeneratedImagePageEvent();
}

@immutable
class GeneratedImagePageStart extends GeneratedImagePageEvent {
  const GeneratedImagePageStart();
}

@immutable
class GeneratedImagePageUpdate extends GeneratedImagePageEvent {
  const GeneratedImagePageUpdate();
}

@immutable
class GeneratedImagePageError extends GeneratedImagePageEvent {
  final String message;
  const GeneratedImagePageError(this.message);
}
