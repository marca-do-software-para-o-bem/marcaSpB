import 'package:bloc/bloc.dart';
import 'package:marca_spb/models/user.dart';
import 'package:marca_spb/utils/services/user/user_services.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfilePageBloc extends Bloc<ProfilePageEvent, ProfileState> {
  ProfilePageBloc(ProfileState initialState) : super(initialState);
  UserServices services = UserServices();
  ProfileState state = ProfileState();

  Stream<ProfileState> mapEventToState(event) async* {
    if (event is ProfilePageStart) {
      try {
        User user = await services.getUser(6);
        yield state.copy(user: user);
      } catch (error) {
        yield state;
      }
    }
  }
}
