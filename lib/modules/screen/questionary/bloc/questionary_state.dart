import 'package:marca_spb/models/brand.dart';
import 'package:meta/meta.dart';

@immutable
abstract class QuestionaryState {
  const QuestionaryState();
}

class EmptyState extends QuestionaryState {}

class InitialState extends QuestionaryState {
  const InitialState();
}

class LoadingState extends QuestionaryState {
  const LoadingState();
}

class LoadedSucessState extends QuestionaryState {
  final Brand qualities;
  const LoadedSucessState(this.qualities);
}

class ErrorState extends QuestionaryState {
  final String message;
  ErrorState(this.message);
}
