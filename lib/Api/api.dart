import 'dart:convert';
import 'package:http/http.dart' as http;

class CallApi {
  var baseurl = '';
  var token;
  // Auth Api
  var _urlAuth = 'hhttp://192.168.8.103:8080/api/';

//post data
  postData(data, apiUrl) async {
    var fullUrl = Uri.parse(baseurl + apiUrl);
    return await http.post(
      fullUrl,
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }

 
  

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };

//Forget
  updatePassword(data, apiUrl) async {
    var fullUrl = Uri.parse(_urlAuth + apiUrl);
    return await http.put(
      fullUrl,
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }

//   _getToken() async {
//     SharedPreferences localStorage = await SharedPreferences.getInstance();
//     var token = localStorage.getString('token');
//     return token;
//   }

}
