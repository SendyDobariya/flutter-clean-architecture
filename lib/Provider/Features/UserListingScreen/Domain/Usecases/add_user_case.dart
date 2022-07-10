import 'package:clean_demo/Provider/Core/Failure/failures.dart';
import 'package:clean_demo/Provider/Core/Usecases/use_case.dart';
import 'package:clean_demo/Provider/Features/UserListingScreen/Data/Models/user_model.dart';
import 'package:clean_demo/Provider/Features/UserListingScreen/Data/Repositories/user_repository_imp.dart';
import 'package:dartz/dartz.dart';

class AddUserCase extends UseCase<UserModel, UserModel> {
  UserRepositoryImp _userRepository;

  AddUserCase(this._userRepository);

  @override
  Stream<Either<Failure, UserModel>> call(UserModel params) {
    // TODO: implement call
    return _userRepository.addNewUser(params);
  }
}
