import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:getx_ststemngt_api/model/Products.dart';
import 'package:getx_ststemngt_api/service/apiService.dart';

class Getx_Controller extends GetxController {
  // Defining a controller class that extends GetxController to manage state.

  var list = <Products>[];
  // Declaring a list to store product data fetched from the API.
  // It is initialized as an empty list of type 'Products'.

  ApiService apiService = ApiService();
  // Creating an instance of ApiService to use its methods for API calls.

  Future<void> fetch() async {
    // Defining an asynchronous method to fetch data from the API.

    list = (await apiService.GetProductData()) ?? [];
    // Fetching product data using the GetProductData() method from ApiService.
    // If the result is null, an empty list is assigned to 'list'.

    update();
    // Notifies listeners to rebuild any UI components dependent on this controller.
  }
}
