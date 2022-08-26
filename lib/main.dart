import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_part2/data_layer/repository/currency_repository.dart';
import 'package:provider_part2/data_layer/repository/user_repository.dart';
import 'package:provider_part2/data_layer/services/api_service.dart';
import 'package:provider_part2/presentation/currencies_screen/currencies_screen.dart';
import 'package:provider_part2/view_models/currencies_view_model.dart';
import 'package:provider_part2/view_models/test_view_model.dart';
import 'package:provider_part2/view_models/user_view_model.dart';

void main() {
  // hozircha di shu
  ApiService apiService = ApiService();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => CurrencyViewModel(
                currencyRepository:
                    CurrencyRepository(apiService: apiService))),
        ChangeNotifierProvider(
            create: (context) => UserViewModel(
                userRepository: UserRepository(apiService: apiService))),
        Provider(create: (context) => TestViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CurrenciesScreen(),
    );
  }
}
