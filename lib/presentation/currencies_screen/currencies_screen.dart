import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_part2/data_layer/models/currency_item.dart';
import 'package:provider_part2/presentation/user_screen/users_screen.dart';
import 'package:provider_part2/view_models/currencies_view_model.dart';

class CurrenciesScreen extends StatelessWidget {
  const CurrenciesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<CurrencyViewModel>(context, listen: false).fetchCurrencyList();
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
