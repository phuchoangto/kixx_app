import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_storage/get_storage.dart';

import '../event_model.dart';

class EventProvider extends GetConnect {
  @override
  void onInit() {
    final server = GetStorage().read('server');
    final user = GetStorage().read('user');
    httpClient.baseUrl = '$server/api';
    if (user != null) {
      httpClient.addAuthenticator<Object?>((request) async {
        request.headers['Authorization'] = "Bearer ${user['token']}";
        return request;
      });
    }
  }

  Future<List<Event>> getEvents() async {
    final response = await get('/events');
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return (response.body as List)
          .map((event) => Event.fromJson(event))
          .toList();
    }
  }

  Future<Response> checkIn(String eventId, String studentId) async {
    print('checkin $studentId to $eventId');
    return await post('/events/$eventId/checkin', {'studentId': studentId});
  }
}
