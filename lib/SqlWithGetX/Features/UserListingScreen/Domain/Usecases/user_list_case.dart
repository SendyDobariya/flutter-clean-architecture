import 'package:clean_demo/SqlWithGetX/Core/Failure/failures.dart';
import 'package:clean_demo/SqlWithGetX/Core/Usecases/use_case.dart';
import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Data/Repositories/user_repository_imp.dart';
import 'package:clean_demo/SqlWithGetX/Features/UserListingScreen/Domain/Entities/user_entities.dart';
import 'package:dartz/dartz.dart';

class UserListUseCase extends UseCase<List<UserEntities>, NoParams> {
  final UserRepositoryImp _userRepository;

  UserListUseCase(this._userRepository);

  @override
  Stream<Either<Failure, List<UserEntities>>> call(NoParams noParams) {
    return _userRepository.getUserList();
  }
}
