import 'dart:io';

import 'package:clean_demo/Bloc/Features/UserListingScreen/Data/Models/user_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as pathProvider;

class HiveHelper {
  Future<void> open() async {
    Directory appDocDir = await pathProvider.getApplicationDocumentsDirectory();
    print(">>>> ${appDocDir.path}");
    Hive.init(appDocDir.path);
    Hive.registerAdapter(UserModelAdapter());
  }

  bool isBoxOpen() {
    print(Hive.isBoxOpen(Boxes.HiveBlocLocal));
    return Hive.isBoxOpen(Boxes.HiveBlocLocal);
  }

  Future<Box> hiveLocalBox() async {
    // Box For UserDetail
    return await Hive.openBox(Boxes.HiveBlocLocal);
  }

  close() {
    Hive.close();
  }
}

//boxes (Containers)
class Boxes {
  static const String HiveBlocLocal = 'hive_local_for_bloc';
}
