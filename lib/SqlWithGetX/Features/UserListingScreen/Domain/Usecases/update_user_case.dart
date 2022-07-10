import 'package:clean_demo/SqlWithGetX/Core/Failure/failures.dart';
import 'package:clean_demo/SqlWithGetX/Core/Usecases/use_case.dart';
import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Data/Models/user_model.dart';
import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Domain/Repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateUserCase extends UseCase<UserModel, UserModel> {
  final UserRepository _userRepository;

  UpdateUserCase(this._userRepository);

  @override
  Stream<Either<Failure, UserModel>> call(UserModel user) {
    return _userRepository.updateUser(user);
  }
}
