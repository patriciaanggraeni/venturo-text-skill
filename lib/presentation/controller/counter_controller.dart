import 'package:get/get.dart';

import '../../domain/entity/Menu.dart';

class CounterController extends GetxController {
  RxInt quantity = 0.obs;
  RxInt totalPrice = 0.obs;
  RxList<Menu> selectedMenus = <Menu>[].obs;

  void incrementQuantity(Menu menu) {
    quantity++;
    updateTotalPrice(menu, quantity.value);
  }

  void decrementQuantity(Menu menu) {
    if (quantity.value > 1) {
      quantity--;
      updateTotalPrice(menu, quantity.value);
    }
  }

  void updateTotalPrice(Menu menu, int quantity) {
    int totalHarga = menu.harga * quantity;
    totalPrice.value = totalHarga;

    int existingIndex = selectedMenus.indexWhere((item) => item.id == menu.id);
    if (existingIndex != -1) {
      selectedMenus[existingIndex] = Menu(
        id: menu.id,
        nama: menu.nama,
        harga: menu.harga,
        tipe: menu.tipe,
        gambar: menu.gambar,
      );
    } else {
      selectedMenus.add(Menu(
        id: menu.id,
        nama: menu.nama,
        harga: menu.harga,
        tipe: menu.tipe,
        gambar: menu.gambar,
      ));
    }
  }
}

