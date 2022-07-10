part of 'user_cubit.dart';

class UserState extends BaseState {
  UserState();

  @override
  List<Object> get props => [];
}

class UserListLoadedState extends UserState {
  final List<UserEntities> userList;
  UserListLoadedState(this.userList);

  @override
  List<Object> get props => [userList];
}

class UserAddedState extends UserState {
  final UserModel user;
  UserAddedState(this.user);

  @override
  List<Object> get props => [user];
}
