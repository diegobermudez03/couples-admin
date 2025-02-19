import 'package:admin_site/core/errors/errors.dart';
import 'package:admin_site/models/quizzes.dart';
import 'package:dartz/dartz.dart';

abstract class QuizzesRepo {
  Future<Tuple2<List<QuizModel?>?, CustomError?>> getQuizzes({String? categoryId, int? limit, int? page, String? orderBy, String? text});
}