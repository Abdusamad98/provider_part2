import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_part2/data_layer/models/currency_item.dart';
import 'package:provider_part2/presentation/user_screen/users_screen.dart';
import 'package:provider_part2/view_models/currencies_view_model.dart';

class CurrenciesScreen extends StatefulWidget {
  const CurrenciesScreen({Key? key}) : super(key: key);

  @override
  State<CurrenciesScreen> createState() => _CurrenciesScreenState();
}

class _CurrenciesScreenState extends State<CurrenciesScreen> {

  @override
  void initState() {
    _init();
    super.initState();

  }

  void _init(){
    Future.delayed(Duration.zero, () async {
      Provider.of<CurrencyViewModel>(context, listen: false).fetchCurrencyList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Column(
        children: [
          Text("Currencies:"),
          Consumer<CurrencyViewModel>(
            builder: (context, currencyViewModel, child) {
              return currencyViewModel.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: ListView(
                        children: List.generate(
                            currencyViewModel.currencyItems.length, (index) {
                          CurrencyItem currency =
                              currencyViewModel.currencyItems[index];
                          return ListTile(
                            title: Text(currency.title),
                            subtitle: Text(currency.code),
                          );
                        }),
                      ),
                    );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Text(
          "Users",
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return UsersScreen();
          }));
        },
      ),
    );
  }
}
