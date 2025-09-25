import 'package:decor_nest/core/errors/failure.dart';
import 'package:fpdart/fpdart.dart';

typedef FutureEither<T> = Future<Either<Failure, T>>;

typedef FutureJson = Future<List<Map<String, dynamic>>>;

typedef StreamEither<T> = Stream<Either<Failure, T>>;

typedef StreamJson = Stream<List<Map<String, dynamic>>>;

typedef SortBy = ({String column, bool ascending});

