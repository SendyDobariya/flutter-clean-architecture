import 'package:clean_demo/GetX/Core/Failure/failures.dart';
import 'package:clean_demo/GetX/Features/UserListingScreen/Data/DataSource/local_source_imp.dart';
import 'package:clean_demo/GetX/Features/UserListingScreen/Data/Models/user_model.dart';
import 'package:clean_demo/GetX/Features/UserListingScreen/Domain/Entities/user_entities.dart';
import 'package:clean_demo/GetX/Features/UserListingScreen/Domain/Repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

//Here we can actual imp the repository methods
class UserRepositoryImp extends UserRepository {
  final UserListLocalSourceImp userListLocalSource;

  UserRepositoryImp(this.userListLocalSource);

  @override
  Stream<Either<Failure, UserModel>> addNewUser(UserModel user) async* {
    // TODO: implement addNewUser
    try {
      var response = await userListLocalSource.addUserToLocal(user);
      yield Right(response);
    } catch (e) {
      yield Left(CacheFailure("Opration error!!"));
    }
  }

  @override
  Stream<Either<Failure, List<UserEntities>>> getUserList() async* {
    try {
      var respose = await userListLocalSource.getUsersListFromLocal();
      print("getUserist cubit => $respose");
      if (respose.isNotEmpty) {
        yield Right(respose);
      } else {
        yield Left(CacheFailureMessage("No data found!!"));
      }
    } catch (e) {
      yield Left(CacheFailureMessage("Opration error!!"));
    }
  }

  // @override
  // Stream<Either<Failure, List<UserEntities>>> addUserList() {
  //   throw UnimplementedError();
  // }
}
