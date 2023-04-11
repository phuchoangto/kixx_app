import 'package:get/get.dart';

class ServerProvider extends GetConnect {
  Future<Response> connect(String server) async {
    return await get('$server/api');
  }
}
