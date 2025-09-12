import 'package:decor_nest/core/errors/failure.dart';
import 'package:fpdart/fpdart.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;

typedef FutureJson = Future<List<Map<String, dynamic>>>;

typedef StreamJson = Stream<List<Map<String, dynamic>>>;
