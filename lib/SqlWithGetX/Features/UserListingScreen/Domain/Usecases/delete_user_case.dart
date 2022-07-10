import 'package:clean_demo/SqlWithGetX/Core/Failure/failures.dart';
import 'package:clean_demo/SqlWithGetX/Core/Usecases/use_case.dart';
import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Data/Models/user_model.dart';
import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Data/Repositories/user_repository_imp.dart';
import 'package:dartz/dartz.dart';

class DeleteUserCase extends UseCase<bool, UserModel> {
  final UserRepositoryImp _userRepository;

  DeleteUserCase(this._userRepository);

  @override
  Stream<Either<Failure, bool>> call(UserModel params) {
    // TODO: implement call
    return _userRepository.deleteUser(params);
  }
}
