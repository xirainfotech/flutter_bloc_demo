import 'package:flutter_bloc_demo/models/customer_model.dart';
import 'package:flutter_bloc_demo/services/network_service.dart';

class ApiRepository {
  Future<List<CustomerModel>> fetchData() async {
    try {
      final result = await NetworkCall.getData();
      return result;
    } catch (e) {
      throw Exception(e);
    }
  }
}
