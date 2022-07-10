import 'package:bloc/bloc.dart';
import 'package:clean_demo/Cubit/Core/Base/base_state.dart';
import 'package:clean_demo/Cubit/Core/Failure/failures.dart';
import 'package:clean_demo/Cubit/Core/Usecases/use_case.dart';
import 'package:clean_demo/Cubit/Features/UserListingScreen/Data/Models/user_model.dart';
import 'package:clean_demo/Cubit/Features/UserListingScreen/Domain/Entities/user_entities.dart';
import 'package:clean_demo/Cubit/Features/UserListingScreen/Domain/Usecases/add_user_case.dart';
import 'package:clean_demo/Cubit/Features/UserListingScreen/Domain/Usecases/user_list_case.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<BaseState> {
  final UserListUseCase _userListCase;
  final AddUserCase _addUserCase;
  UserCubit(this._userListCase, this._addUserCase) : super(LoadingState());

  Future<void> getUserListing() async {
    emit(LoadingState());
    //Fake loading for state change
    await Future.delayed(const Duration(seconds: 1));
    _userListCase.call(NoParams()).listen((event) {
      event.fold((fail) {
        print(
            "Fail at cubit while getting the list of the users => ${fail.toString()}");
        emit(Nodata());
      }, (List<UserEntities> success) {
        if (success.isEmpty) {
          emit(Nodata());
        } else {
          emit(UserListLoadedState(success));
        }
      });
    });
  }

  Future<void> addUser({required UserModel newUser}) async {
    _addUserCase(newUser).listen((event) {
      event.fold(
          (fail) => print(
              "Fail at cubit while adding new user => ${fail.toString()}"),
          (UserModel user) => print("New added user is => ${user.userName}"));
    });
  }

  appendNewUser({required UserModel addedUser}) {
    if (state is UserListLoadedState) {
      UserEntities user = UserEntities(
          age: addedUser.age,
          emailId: addedUser.emailId,
          userName: addedUser.userName);

      (state as UserListLoadedState).userList.add(user);
      emit(UserListLoadedState((state as UserListLoadedState).userList));
    } else {
      getUserListing();
    }
  }
}
