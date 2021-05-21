import 'package:bitcoin_ticker/networking.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future<dynamic> getCoinData(String currency, String coin) async {
    String url = 'https://rest.coinapi.io/v1/exchangerate/$coin/$currency';
    NetworkHelper networkHelper = NetworkHelper(url);
    try {
      var data = await networkHelper.getData();
      int exchangeRateI = data['rate'].round();
      String exchangeRate = exchangeRateI.toString();
      return exchangeRate;
    } catch (error) {
      throw error;
    }
  }
}
