import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venturo_test_mobile_dev/data/repository/menu_respository_impl.dart';
import 'package:venturo_test_mobile_dev/data/usecase/MenuUseCase.dart';
import 'package:venturo_test_mobile_dev/presentation/controller/counter_controller.dart';
import 'package:venturo_test_mobile_dev/presentation/controller/menu_controller.dart';
import 'package:venturo_test_mobile_dev/presentation/widgets/card.dart';

import 'domain/entity/Menu.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final MenuControllers menuController = Get.put(MenuControllers(
      menuUseCase: MenuUseCase(
        menuRepositoryImpl: MenuRepositoryImpl()
      )
    ));

    final CounterController counterController = Get.put(CounterController());

    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Api"),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Obx(() =>
              Stack(
                children: [
                  ListView.builder(
                      itemCount: menuController.menus.length,
                      itemBuilder: (context, index) {
                        Menu menu = menuController.menus[index];
                          return CustomCard(menu: menu,);
                      }
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                              color: Color(0xFFEDEDED),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              ),
                            ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text("Total pesanan (${counterController.selectedMenus.length} item): "),
                          Obx(() => Text(
                                counterController.totalPrice.toString(),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF009AAD),
                                ),
                              ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}
