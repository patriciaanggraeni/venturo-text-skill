import 'package:get/get.dart';
import 'package:venturo_test_mobile_dev/data/usecase/MenuUseCase.dart';
import '../../domain/entity/Menu.dart';

class MenuControllers extends GetxController {
  final MenuUseCase _menuUseCase;
  final RxBool isLoading = true.obs;
  final RxList<Menu> menus = <Menu>[].obs;

  MenuControllers({required MenuUseCase menuUseCase}) : _menuUseCase = menuUseCase;

  @override
  void onInit() {
    super.onInit();
    getMenus();
  }

  Future<void> getMenus() async {
    final result = await _menuUseCase.getMenus();
    result.fold((error) => print(error.toString()), (menu) {
      menus.value = menu;
      isLoading.value = true;
    } );
  }
}