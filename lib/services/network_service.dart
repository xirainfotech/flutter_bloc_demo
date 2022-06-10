import 'package:flutter_bloc_demo/models/customer_model.dart';
import 'package:http/http.dart' as http;

class NetworkCall {
  static final httpClient = http.Client();
  static Future<List<CustomerModel>> getData() async {
    final url = Uri.parse(
        'https://www.paperekart.com/admin/Services/CustomerMasterService.asmx/GET_EXISTING_ONE_SIGNAL_USERS');
    final response = await httpClient.get(url);
    if (response.statusCode == 200) {
      return decodeCustomerModel(response.body);
    } else {
      throw Exception('failed');
    }
  }
}
