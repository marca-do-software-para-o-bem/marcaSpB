import 'package:marca_spb/models/brand.dart';
import 'package:meta/meta.dart';

@immutable
abstract class GeneratedImageState {
  const GeneratedImageState();
}

class EmptyState extends GeneratedImageState {}

class LoadingState extends GeneratedImageState {
  const LoadingState();
}

class LoadedSucessState extends GeneratedImageState {
  final Brand qualities;
  const LoadedSucessState(this.qualities);
}

class ErrorState extends GeneratedImageState {
  final String message;
  ErrorState(this.message);
}
