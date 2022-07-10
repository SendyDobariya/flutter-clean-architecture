import 'package:clean_demo/Bloc/Core/NavigationDetails/app_route_observer_bloc.dart';
import 'package:clean_demo/Bloc/Core/NavigationDetails/app_routes_bloc.dart';
import 'package:clean_demo/Bloc/Features/HomeScreen/Presentation/Pages/home_page.dart';
import 'package:clean_demo/Cubit/Core/NavigationDetails/app_route_observer_cubit.dart';
import 'package:clean_demo/Cubit/Core/NavigationDetails/app_routes_cubit.dart';
import 'package:clean_demo/Cubit/Core/Theme/config.dart';
import 'package:clean_demo/Cubit/Core/Theme/custome_theme.dart';
import 'package:clean_demo/GetX/Core/NavigationDetails/app_route_observer_getx.dart';
import 'package:clean_demo/GetX/Core/NavigationDetails/app_routes_getx.dart';
import 'package:clean_demo/Provider/Core/NavigationDetails/app_route_observer_provider.dart';
import 'package:clean_demo/Provider/Core/NavigationDetails/app_routes_provider.dart';
import 'package:clean_demo/SqlWithGetX/Core/Helper/database_helper.dart';
import 'package:clean_demo/SqlWithGetX/Core/NavigationDetails/app_route_observer_sql.dart';
import 'package:clean_demo/SqlWithGetX/Core/NavigationDetails/app_routes_sql.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqlite_api.dart';
import 'injection_container.dart' as di;

DataBaseHelper dataBaseHelper = DataBaseHelper();

late Database userDataBase;
void main() async {
  // //Provider.debugCheckInvalidValueType = null;

  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  //await dataBaseHelper.init();
  userDataBase = await dataBaseHelper.init();
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     //// Need to set get material app for Getx
//     return GetMaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       getPages: AppRoutesGetX.routes,

//       ////GetX
//       navigatorObservers: [AppRouteObserverGetX()],

//       ////Getx With SQL
//       // navigatorObservers: [AppRouteObserverSql()],

//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //// Need to set get material app for Getx
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.lightTheme,

      // need to change this if you change it to other state management

      ////Provider
      // navigatorObservers: [AppRouteObserver()],

      ////Cubit
      // navigatorObservers: [AppRouteObserverCubit()],

      //Bloc
      navigatorObservers: [AppRouteObserverBloc()],
      onGenerateRoute: AppRoutesBloc.generateRoute,

      // need to change this, if you change it to other state management

      ////Provider
      // onGenerateRoute: AppRoutes.generateRoute,
      // navigatorObservers: [AppRouteObserverProvider()],

      ////Cubit
      // onGenerateRoute: AppRoutesCubit.generateRoute,
      // navigatorObservers: [AppRouteObserverCubit()],

      ////Bloc
      // onGenerateRoute: AppRoutesBloc.generateRoute,

      debugShowCheckedModeBanner: false,
    );
  }
}
