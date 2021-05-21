import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

CoinData coinData = CoinData();

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  Map<String, String> exchangeRates = {};
  List <Padding> coinWidgets = [];

  void updateCoins() async {
    for (int i = 0; i < cryptoList.length; i++){
      exchangeRates[cryptoList[i]] = '?';
    }
    updateCoinWidgets();

    try {
      for (int i = 0; i < cryptoList.length; i++){
        var data = await coinData.getCoinData(selectedCurrency, cryptoList[i]);
        exchangeRates[cryptoList[i]] = data;
      }
      //print(exchangeRates);
      updateCoinWidgets();
    }
    catch (error){
      print(error);
    }
    updateCoinWidgets();
  }

  void updateCoinWidgets(){
    List <Padding> newCoinWidgets = [];
    for (int i = 0; i < cryptoList.length; i++){
      Padding newCoinWidget = Padding(
        padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
        child: Card(
          color: Colors.lightBlueAccent,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
            child: Text(
              '1 ${cryptoList[i]} = ${exchangeRates[cryptoList[i]]} $selectedCurrency',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
      newCoinWidgets.add(newCoinWidget);
    }
    setState(() {
      coinWidgets = newCoinWidgets;
    });
  }

  @override
  void initState(){
    super.initState();
    for (int i = 0; i < cryptoList.length; i++){
      exchangeRates[cryptoList[i]] = '?';
    }
    updateCoinWidgets();
    updateCoins();
  }

  List<DropdownMenuItem> getDropDownItems() {
    List<DropdownMenuItem> dropDownItems = [];
    for(String currency in currenciesList){
      var newItem = DropdownMenuItem(child: Text(currency), value: currency,);
      dropDownItems.add(newItem);
    }
    return dropDownItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: coinWidgets,
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: DropdownButton(
              value: selectedCurrency,
              items: getDropDownItems(),
              onChanged: (value){
                setState(() {
                  selectedCurrency = value;
                });
                updateCoins();
              },
            ),
          ),
        ],
      ),
    );
  }
}
