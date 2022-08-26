import 'package:flutter/foundation.dart';
import 'package:provider_part2/data_layer/db/cached_user_model.dart';
import 'package:provider_part2/data_layer/models/user_data.dart';
import 'package:provider_part2/data_layer/repository/user_repository.dart';

class UserViewModel extends ChangeNotifier {
  UserViewModel({required this.userRepository});

  final UserRepository userRepository;

  List<CachedUser> cachedUsers = [];
  UserData? userData;
  bool isLoading = false;

  void getCachedUsers() async {
    isLoading = true;
    notifyListeners();
    cachedUsers = await userRepository.getCachedUsers();
    isLoading = false;
    notifyListeners();
  }

  void getUserDataAndSave() async {
    isLoading = true;
    notifyListeners();
    userData = await userRepository.getUserData();
    await userRepository.insertUserFromApi(userData: userData!);
    cachedUsers = await userRepository.getCachedUsers();
    isLoading = false;
    notifyListeners();
  }
}
