import 'package:provider_part2/data_layer/models/user_data.dart';
import 'package:provider_part2/data_layer/services/api_service.dart';

class UserRepository {
  UserRepository({required this.apiService});

  final ApiService apiService;

  Future<UserData> getUserData() => apiService.getUserData();
}
