import 'dart:convert';
import 'package:admin_site/core/errors/errors.dart';
import 'package:admin_site/services/tokens_management.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;


const expiredTokenError = "EXPIRED_ACCESS_TOKEN";
class HttpClient {
  final TokensManagement _token;
  final String _url;

  HttpClient(this._url, this._token);

  Future<Tuple2<T?, CustomError?>> sendRequest<T>(Future<Tuple2<T?, CustomError?>>Function(Map<String, String>) request) async{
    try{
      if(_token.getAccessToken() == null){
        await refreshAccessToken();
      }
      Map<String, String> headers = {
        "Bearer" : _token.getAccessToken()!
      };
      final response = await request(headers);
      if(response.value2 == null){
        return response;
      }
      if(response.value2!.error == expiredTokenError){
        final refreshed = await refreshAccessToken();
        if(!refreshed){
          _token.deleteRefreshToken();
          return Tuple2(null, GoToLoginError());
        }
        headers["Bearer"] = _token.getAccessToken()!;
        return request(headers);
      }
      return response;
    }catch(error){
      print(error);
      return Tuple2(null, NetworkError());
    }
  }

  Future<bool> refreshAccessToken()async{
    try{
      final url = Uri.parse('$_url/auth/admin/accessToken');
      final rToken = await _token.getRefreshToken();
      if(rToken == null) return false;
      final response = await http.post(url, body: jsonEncode({
        "refreshToken" : rToken
      }));

      if(response.statusCode >= 400){
        return false;
      }
      final body = jsonDecode(response.body);
      _token.setAccessToken(body["accessToken"]);
      if(body["refreshToken"] != null){
        _token.setRefreshToken(body["refreshToken"]);
      }
      return true;
    }catch(err){
      return false;
    }
  }

}