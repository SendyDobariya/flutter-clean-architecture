import 'package:bloc/bloc.dart';
import 'package:clean_demo/Bloc/Core/Base/base_event.dart';
import 'package:clean_demo/Bloc/Core/Base/base_state.dart';
import 'package:clean_demo/Bloc/Core/Usecases/use_case.dart';
import 'package:clean_demo/Bloc/Features/UserListingScreen/Data/Models/user_model.dart';
import 'package:clean_demo/Bloc/Features/UserListingScreen/Domain/Entities/user_entities.dart';
import 'package:clean_demo/Bloc/Features/UserListingScreen/Domain/Usecases/add_user_case.dart';
import 'package:clean_demo/Bloc/Features/UserListingScreen/Domain/Usecases/user_list_case.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<BaseEvent, BaseState> {
  AddUserCase _addUserCase;
  UserListUseCase _userListUseCase;

  UserBloc(this._addUserCase, this._userListUseCase) : super(LoadingState()) {
    on<BaseEvent>((event, emit) {
      print("USER BLOC EVENT $event || USER BLOC STATE $state");

      if (event is GetUserlistEvent) {
        _userListUseCase(NoParams()).listen((result) {
          //fail
          result.fold((fail) {
            print("Get event fail in bloc ${fail}");

            add(NoDataEvent());
          },
              //success
              (List<UserEntities> success) {
            if (success.isNotEmpty) {
              add(UserListLoadedEvent(success));
            } else {
              add(NoDataEvent());
            }
          });
        });
      }

      if (event is UserListLoadedEvent) {
        emit(UserListLoadedState(event.userList));
      }

      if (event is NoDataEvent) {
        emit(Nodata());
      }

      if (event is AddUserEvent) {
        _addUserCase.call(event.user).listen((event) {
          event.fold((fail) {
            print('Add user to hive op fail ${fail.toString()}');
          }, (UserModel user) {
            print("User added succ => ${user.userName}");
          });
        });
      }

      if (event is AppendnewUserEvent) {
        print(" append new user event call  $event");
        if (state is UserListLoadedState) {
          List<UserEntities> _userlist =
              (state as UserListLoadedState).userList;

          _userlist.add(event.user);

          add(UserListLoadedEvent(_userlist));
        } else {
          add(GetUserlistEvent());
        }
      }
    });
  }

  // @override
  // Stream<BaseState> mapEventToState(
  //   BaseEvent event,
  // ) async* {
  //   print("EVENTS AT USER BLOC =>$event");
  //   if (event is GetUserlistEvent) {
  //     await Future.delayed(const Duration(seconds: 1));
  //     _userListUseCase(NoParams()).listen((event) {
  //       event.fold((fail) {
  //         print("Get event fail in bloc ${fail}");

  //         // yield Nodata();
  //         add(NoDataEvent());
  //       },
  //           // ignore: void_checks
  //           (List<UserEntities> success) {
  //         print("Hive list length =>${success.length} ");
  //         if (success.isNotEmpty) {
  //           //   yield UserListLoadedState(success);
  //           add(UserListLoadedEvent(success));
  //         } else {
  //           add(NoDataEvent());
  //         }
  //       });
  //     });
  //   }

  //   if (event is NoDataEvent) {
  //     yield Nodata();
  //   }

  //   if (event is UserListLoadedEvent) {
  //     yield UserListLoadedState(event.userList);
  //   }

  //   if (event is AddUserEvent) {
  //     _addUserCase.call(event.user).listen((event) {
  //       event.fold((fail) {
  //         print('Add user to hive op fail ${fail.toString()}');
  //       }, (UserModel user) {
  //         print("User added succ => ${user.userName}");
  //         // add(UserAddedEvent(user));
  //         add(GetUserlistEvent());
  //       });
  //     });
  //   }

  //   if (event is UserAddedEvent) {
  //     yield UserAddedState(event.user);
  //   }
  // }
}
