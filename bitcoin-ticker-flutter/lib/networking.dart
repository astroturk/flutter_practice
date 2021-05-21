import 'package:http/http.dart' as http;
import 'dart:convert';

const String apiKey = '96796C83-E0A7-48AF-9585-643601BAA789';

class NetworkHelper {
  final String url;
  Map<String, String> requestHeaders = {'X-CoinAPI-Key': '96796C83-E0A7-48AF-9585-643601BAA789'};
  NetworkHelper(this.url);

  Future getData() async {
    var uri = Uri.parse(url);
    http.Response response = await http.get(uri, headers: requestHeaders);
    if (response.statusCode == 200){
      String data = response.body;
      return jsonDecode(data);
    }
    else {
      print(response.statusCode);
      throw 'Could not fetch Data';
    }
  }
}