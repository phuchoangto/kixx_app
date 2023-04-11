import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../user_model.dart';

class AuthProvider extends GetConnect {
  @override
  void onInit() {
    final server = GetStorage().read('server');
    httpClient.baseUrl = '$server/api';
  }

  Future<User> login(String username, String password) async {
    final response = await post('/login', {
      'username': username,
      'password': password,
    });
    print(response.body);
    if (response.statusCode == 200) {
      return User.fromJson(response.body['user']);
    } else {
      throw Exception('Failed to login');
    }
  }
}
