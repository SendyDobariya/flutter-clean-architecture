import 'package:clean_demo/Bloc/Features/UserListingScreen/Data/DataSource/local_source_imp.dart';
import 'package:clean_demo/Bloc/Features/UserListingScreen/Data/Repositories/user_repository_imp.dart';
import 'package:clean_demo/Bloc/Features/UserListingScreen/Domain/Usecases/add_user_case.dart';
import 'package:clean_demo/Bloc/Features/UserListingScreen/Domain/Usecases/user_list_case.dart';
import 'package:clean_demo/Bloc/Features/UserListingScreen/Presentation/bloc/user_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //// UserList CASE
  // UserListLocalSourceImp _userListLocalSourceImp = UserListLocalSourceImp();
  // UserRepositoryImp _userRepositoryImp =
  //     UserRepositoryImp(_userListLocalSourceImp);
  // UserListUseCase _userListuseCase = UserListUseCase(_userRepositoryImp);

  // //AddUser CASE
  // AddUserCase _addUserCase = AddUserCase(_userRepositoryImp);

//Bloc
  sl.registerLazySingleton(() => UserBloc(sl(), sl()));

  //usecases
  sl.registerLazySingleton(() => AddUserCase(sl()));
  sl.registerLazySingleton(() => UserListUseCase(sl()));

  //Repository
  sl.registerLazySingleton(() => UserRepositoryImp(sl()));

  //Data Source
  sl.registerLazySingleton(() => UserListLocalSourceImp());
}
