import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venturo_test_mobile_dev/presentation/controller/counter_controller.dart';
import '../../domain/entity/Menu.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key, required this.menu});
  final Menu menu;

  @override
  Widget build(BuildContext context) {
    final CounterController counterController = Get.put(CounterController());

    return Card(
      elevation: 5,
      color: const Color(0xFFF6F6F6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: SizedBox(
          height: 90,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                color: const Color(0xFFDFDFDF),
                height: 75,
                width: 75,
                child: Padding(
                  padding: EdgeInsets.all(5),
                  child: Image.network(
                    menu.gambar,
                    width: 75,
                    height: 75,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(menu.nama),
                  Text(
                    menu.harga.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF009AAD),
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(Icons.note),
                      SizedBox(width: 10,),
                      Text("catatan"),
                    ],
                  )
                ],
              ),
                Row(
                  children: [
                    IconButton(onPressed: () {
                      counterController.decrementQuantity(menu);
                    }, icon: Icon(Icons.remove)),
                    Obx(() => Text(counterController.quantity.toString()),),
                    IconButton(onPressed: () {
                      counterController.incrementQuantity(menu);
                    }, icon: Icon(Icons.add)),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
