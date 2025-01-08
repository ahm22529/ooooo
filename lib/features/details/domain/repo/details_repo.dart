import 'package:arb_tasks/core/error/fauiler.dart';
import 'package:arb_tasks/features/metrics/data/model/Iteam_model.dart';
import 'package:dartz/dartz.dart';

abstract class DetailsRepo {
  Future<Either<Failure, List<int>>> getYearlydata(List<Item> iteams);
  Future<Either<Failure, Map<String, dynamic>>> getMontly(
      List<Item> iteams, int namberOfmonthly);
}
