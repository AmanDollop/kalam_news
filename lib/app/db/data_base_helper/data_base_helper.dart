// ignore_for_file: depend_on_referenced_packages

import 'package:kalam_news_publication/app/db/data_base_constant/data_base_constant.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseHelper {
  static Database? dataBaseHelper;

  static final DataBaseHelper _dataBaseHelper = DataBaseHelper._privetConstructor();

  DataBaseHelper._privetConstructor();

  factory DataBaseHelper() {
    return _dataBaseHelper;
  }

  Future<Database?> openDataBase() async {
    dataBaseHelper = await openDatabase(
      join(await getDatabasesPath(), DataBaseConstant.dataBaseName),
    );
    return dataBaseHelper;
  }

  closeDataBase() async {
    Database? database = await openDataBase();
    database?.close();
  }

  createTableInDataBaseForUserDetail({required Database db}) async {
    await db.execute('''CREATE TABLE IF NOT EXISTS ${DataBaseConstant.tableNameForUserDetail}  
        (${DataBaseConstant.columnId} ${DataBaseType.autoIncrementUserId}
        , ${DataBaseConstant.userDetail} ${DataBaseType.textType}
        )''');
  }

  insertInDataBase({required Map<String, dynamic> data,required String tableName}) async {
    int id = await dataBaseHelper?.insert(tableName, data) ?? -1;
    if (id != -1) {
      return true;
    } else {
      return false;
    }
  }

  upDateDataBase({required Map<String, dynamic> data,required String tableName}) async {
     int id = await dataBaseHelper?.update(tableName, data,where:DataBaseConstant.columnId) ?? -1;
     if (id != -1) {
       return true;
     } else {
       return false;
     }
  }

  Future<int?> deleteDataBase({required String tableName}) async {
    return await dataBaseHelper?.delete(tableName);
  }

  Future<String> getParticularData({required String key, required String tableName}) async {
    dataBaseHelper = await openDataBase();
    if (!await isDatabaseHaveData(db: dataBaseHelper,tableName: tableName)) {
      List<Map<String, Object?>> listOfData = await dataBaseHelper?.rawQuery('SELECT * FROM $tableName') ?? [];
      return listOfData.first[key].toString();
    } else {
      return "";
    }
  }

  Future<bool> isDatabaseHaveData({required Database? db,required String tableName}) async {
    List<Map<String, Object?>> listOfData = await db?.rawQuery('SELECT * FROM $tableName') ?? [];
    if (listOfData.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

}