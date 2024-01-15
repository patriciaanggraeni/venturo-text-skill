import 'package:dartz/dartz.dart';
import 'package:venturo_test_mobile_dev/data/repository/menu_respository_impl.dart';
import 'package:venturo_test_mobile_dev/domain/entity/Menu.dart';

class MenuUseCase {

  final MenuRepositoryImpl _menuRepositoryImpl;

  MenuUseCase({required MenuRepositoryImpl menuRepositoryImpl}) : _menuRepositoryImpl = menuRepositoryImpl;

  Future<Either<String, List<Menu>>> getMenus() async {
    return await _menuRepositoryImpl.getMenus();
  }

}