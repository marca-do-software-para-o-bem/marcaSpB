part of 'signup_bloc.dart';

@immutable
abstract class UserEvent extends Equatable {
  const UserEvent();
}

class LoadingSucessUserEvent extends UserEvent {
  @override
  List<Object> get props => [];
}

class CreateUserEvent extends UserEvent {
  final User user;
  const CreateUserEvent(this.user);

  @override
  List<Object> get props => [user];
}

class NetworkErrorEvent extends Error {}
