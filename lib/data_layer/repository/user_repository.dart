import 'package:provider_part2/data_layer/db/cached_user_model.dart';
import 'package:provider_part2/data_layer/db/local_database.dart';
import 'package:provider_part2/data_layer/models/user_data.dart';
import 'package:provider_part2/data_layer/services/api_service.dart';

class UserRepository {
  UserRepository({required ApiService apiService}) {
    _apiService = apiService;
  }

  late ApiService _apiService;

  Future<UserData> getUserData() => _apiService.getUserData();

  //-----------------------Local Users side-------------------

  Future<List<CachedUser>> getCachedUsers() => LocalDataBase.getAllCachedUsers();
  Future<CachedUser> insertUserFromApi({required UserData userData}) => LocalDataBase.insertCachedUserFromApi(userData);

}
