import 'dart:convert';

import 'package:admin_site/core/errors/errors.dart';
import 'package:admin_site/core/http_client.dart';
import 'package:admin_site/models/quizzes.dart';
import 'package:admin_site/repository/quizzes_repo.dart';
import 'package:dartz/dartz.dart';
import "package:http/http.dart" as http;

class QuizzesRepoImpl implements QuizzesRepo{
  final HttpClient client;
  final String _url;

  QuizzesRepoImpl(this.client, String url): _url = "$url/admin/quizzes";
  
  @override
  Future<Tuple2<List<QuizModel>?, CustomError?>> getQuizzes({String? categoryId, int? limit, int? page, String? orderBy, String? text}) {
    return client.sendRequest((headers)async{
      final Map<String, dynamic> query = {};
      if(categoryId != null) query["categoryId"] = categoryId;
      if(limit != null) query["limit"] = limit;
      if(page != null) query["page"] = page;
      if(orderBy != null) query["orderBy"] = orderBy;
      if(text != null) query["text"] = text;
      final queryString = Uri(
        queryParameters: query
      ).query;
      final url = Uri.parse("$_url/quizes?$queryString");
      final response = await http.get(url);
      final body = jsonDecode(response.body);
      if(response.statusCode >= 400){
        return Tuple2(null, CustomError(body["error"]));
      }
      final List<dynamic> json = body as List<dynamic>;
      final List<QuizModel> quizzes = json.map((m)=>QuizModel.fromJson(m)).toList();
      return Tuple2(quizzes, null);
    });
  }


  
}