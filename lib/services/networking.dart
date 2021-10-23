import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String data =
          response.body; // received encoded json data from API (Serialization).
      var decodedData = jsonDecode(data);

      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
// String apiKey = "acd7fb99aa913183fa5880f513ba5b2c";
