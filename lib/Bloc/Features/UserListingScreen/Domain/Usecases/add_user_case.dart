import 'package:clean_demo/Bloc/Core/Failure/failures.dart';
import 'package:clean_demo/Bloc/Core/Usecases/use_case.dart';
import 'package:clean_demo/Bloc/Features/UserListingScreen/Data/Models/user_model.dart';
import 'package:clean_demo/Bloc/Features/UserListingScreen/Data/Repositories/user_repository_imp.dart';
import 'package:dartz/dartz.dart';

class AddUserCase extends UseCase<UserModel, UserModel> {
  final UserRepositoryImp _userRepository;

  AddUserCase(this._userRepository);

  @override
  Stream<Either<Failure, UserModel>> call(UserModel params) {
    // TODO: implement call
    return _userRepository.addNewUser(params);
  }
}
