import 'package:marca_spb/models/user.dart';

class ProfileState {
  final User user;

  ProfileState({
    this.user,
  });

  ProfileState copy({User user}) {
    return ProfileState(user: user ?? this.user);
  }
}
