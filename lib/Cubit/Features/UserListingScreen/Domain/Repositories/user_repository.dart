import 'package:clean_demo/Cubit/Core/Failure/failures.dart';
import 'package:clean_demo/Cubit/Features/UserListingScreen/Data/Models/user_model.dart';
import 'package:clean_demo/Cubit/Features/UserListingScreen/Domain/Entities/user_entities.dart';
import 'package:dartz/dartz.dart';

//Here we can define definition of the repository
abstract class UserRepository {
  Stream<Either<Failure, List<UserEntities>>> getUserList();
  Stream<Either<Failure, UserModel>> addNewUser(UserModel user);
}
