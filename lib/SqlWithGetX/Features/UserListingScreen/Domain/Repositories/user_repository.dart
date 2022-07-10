import 'package:clean_demo/SqlWithGetX/Core/Failure/failures.dart';
import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Data/Models/user_model.dart';
import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Domain/Entities/user_entities.dart';
import 'package:dartz/dartz.dart';

//Here we can define definition of the repository
abstract class UserRepository {
  Stream<Either<Failure, List<UserEntities>>> getUserList();
  Stream<Either<Failure, UserModel>> addNewUser(UserModel user);

  Stream<Either<Failure, bool>> deleteUser(UserModel user);

  Stream<Either<Failure, UserModel>> updateUser(UserModel user);
}
