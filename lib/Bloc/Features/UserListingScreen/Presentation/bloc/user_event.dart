part of 'user_bloc.dart';

abstract class UserEvent extends BaseEvent {
  UserEvent();

  @override
  List<Object> get props => [];
}

class GetUserlistEvent extends UserEvent {
  GetUserlistEvent();
  @override
  List<Object> get props => [];
}

class AddUserEvent extends UserEvent {
  final UserModel user;
  AddUserEvent(this.user);
  @override
  List<Object> get props => [user];
}

class UserListLoadedEvent extends UserEvent {
  final List<UserEntities> userList;
  UserListLoadedEvent(this.userList);
  @override
  List<Object> get props => [userList];
}

class AppendnewUserEvent extends UserEvent {
  final UserModel user;
  AppendnewUserEvent(this.user);

  @override
  List<Object> get props => [user];
}

class UserAddedEvent extends UserEvent {
  final UserModel user;
  UserAddedEvent(this.user);

  @override
  List<Object> get props => [user];
}
