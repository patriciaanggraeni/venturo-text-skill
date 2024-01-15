import 'package:dartz/dartz.dart';
import 'package:venturo_test_mobile_dev/domain/entity/Menu.dart';

abstract class MenuRepository {

  Future<Either<String, List<Menu>>> getMenus();
}
