import 'dart:io';
import 'package:clean_demo/Provider/Features/UserListingScreen/Data/Models/user_model.dart';
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
    print(Hive.isBoxOpen(Boxes.HiveProviderLocal));
    return Hive.isBoxOpen(Boxes.HiveProviderLocal);
  }

  Future<Box> hiveLocalBox() async {
    // Box For UserDetail
    return await Hive.openBox(Boxes.HiveProviderLocal);
  }

  close() {
    Hive.close();
  }
}

//boxes (Containers)
class Boxes {
  static final String HiveProviderLocal = 'hive_local_provider';
}
