import 'package:dartz/dartz.dart';
import 'package:venturo_test_mobile_dev/data/service/menu_service.dart';
import 'package:venturo_test_mobile_dev/domain/entity/Menu.dart';
import 'package:venturo_test_mobile_dev/domain/repository/menu_repository.dart';

class MenuRepositoryImpl extends MenuRepository {

  final MenuService _menuService = MenuService();

  @override
  Future<Either<String, List<Menu>>> getMenus() async {
    return await _menuService.getMenus();
  }

}