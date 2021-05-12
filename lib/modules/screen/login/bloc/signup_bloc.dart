library signup_bloc.dart;

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:marca_spb/utils/services/user/user_repository.dart';
import 'package:marca_spb/models/user.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepository repository;

  UserBloc(this.repository) : super(EmptyState());

  @override
  UserState get InitialState => LoadingState();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    LoadingState();
    if (event is LoadingSucessUserEvent) {
      yield* _mapUsersLoadedToState();
    } else if (event is CreateUserEvent) {
      yield* _mapUserAddedToState(event);
    }
  }

  Stream<UserState> _mapUsersLoadedToState() async* {
    try {
      var users = await this.repository.getAllUsers();
      yield LoadedSucessState(users);
    } catch (e) {
      yield ErrorState("error loading users");
    }
  }

  Stream<UserState> _mapUserAddedToState(CreateUserEvent event) async* {
    try {
      var newUser = (await this.repository.createUser(event.user));
      print('new: ');
      print(newUser);
      List<User> updatedUsers;
      if (newUser != null) {
        updatedUsers = List.from((state as LoadedSucessState).users)
          ..add(newUser);
      }

      //yield LoadedSucessState(updatedUsers.reversed.toList());
    } catch (e) {
      yield ErrorState("error Add user");
    }
  }
}
