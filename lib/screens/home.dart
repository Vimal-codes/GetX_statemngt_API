import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../GetXController.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  // Constructor for MyHomePage widget with a key for widget identification.

  @override
  State<MyHomePage> createState() => _MyHomePageState();
// Creates the mutable state (_MyHomePageState) for this widget.
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final Getx_Controller c = Get.put(Getx_Controller());
    // Using Get.put() to initialize and inject the Getx_Controller, making it available throughout the widget tree.

    c.fetch();
    // Calling the fetch method from Getx_Controller to load product data.

    return Scaffold(
        body: GetBuilder<Getx_Controller>(
          builder: (controller) {
            if (controller.list.isEmpty) {
              // If the list is empty, showing a loading spinner while waiting for the data.
              return const Center(child: CircularProgressIndicator());
            }

            return ListView.builder(
              itemCount: controller.list.length,
              // Sets the number of items in the ListView based on the length of the list.

              itemBuilder: (BuildContext context, int index) {
                // Building each list item based on the index.
                return ListTile(
                  leading: CircleAvatar(
                    child: Text("${controller.list[index].id}"),
                    // Displaying the product ID in a circle avatar as a placeholder for the image.
                  ),
                  title: Text("${controller.list[index].title}"),
                  // Displaying the product title.

                  subtitle: Text("${controller.list[index].category}"),
                  // Displaying the product category.

                  trailing: Text("\$${controller.list[index].price}"),
                  // Displaying the product price with a "$" symbol.
                );
              },
            );
          },
        )
    );
  }
}
