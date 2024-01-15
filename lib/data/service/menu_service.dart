import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:venturo_test_mobile_dev/data/model/MenuModel.dart';
import '../../domain/entity/Menu.dart';

class MenuService {
  
  final Dio dio = Dio();

  
  Future<Either<String, List<Menu>>> getMenus() async {
    try {
      final response = await dio.get("https://tes-mobile.landa.id/api/menus");
      if (response.statusCode == 200) {
        final List<dynamic> result = response.data['datas'];
        final List<Menu> menus = result.map((e) => MenuModel.fromJson(e)).toList();
        return right(menus);
      } else {
        return left("Failed to get menus. Status code: ${response.statusCode}");
      }
    } catch (e) { return left(e.toString()); }
  } 
  
}