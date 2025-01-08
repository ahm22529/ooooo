import 'package:arb_tasks/core/error/fauiler.dart';
import 'package:arb_tasks/core/error/fauiler.dart';
import 'package:arb_tasks/features/metrics/data/model/Iteam_model.dart';
import 'package:dartz/dartz.dart';

abstract class MetricesRepo {
  Future<Either<Failure, List<Item>>> loadData();
}
