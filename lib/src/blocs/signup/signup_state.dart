part of 'signup_bloc.dart';

@immutable
abstract class UserState extends Equatable {
  const UserState();
}

class EmptyState extends UserState {
  @override
  List<Object> get props => null;
}

class InitialState extends UserState {
  const InitialState();
  @override
  List<Object> get props => [];
}

class LoadingState extends UserState {
  const LoadingState();
  @override
  List<Object> get props => [];
}

class LoadedSucessState extends UserState {
  final List<User> user;
  const LoadedSucessState(this.user);
  @override
  List<Object> get props => [user];
}

class ErrorState extends UserState {
  final String message;
  const ErrorState(this.message);
  @override
  List<Object> get props => [message];
}
