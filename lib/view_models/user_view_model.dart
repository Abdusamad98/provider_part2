import 'package:flutter/foundation.dart';
import 'package:provider_part2/data_layer/repository/user_repository.dart';

class UserViewModel extends ChangeNotifier {
  UserViewModel({required this.userRepository});

  final UserRepository userRepository;
}
