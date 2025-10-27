import 'package:decor_nest/core/constants/storage_constants.dart';
import 'package:decor_nest/core/errors/failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart' show StorageException;

class StorageFailure extends Failure {
  const StorageFailure(super.message);

  factory StorageFailure.fromException(StorageException e) {
    switch (e.statusCode) {
      case StorageCodes.conflict:
        return const StorageFailure(StorageErrors.conflict);
      case StorageCodes.notFound:
        return const StorageFailure(StorageErrors.notFound);
      case StorageCodes.badRequest:
        return const StorageFailure(StorageErrors.badRequest);
      case StorageCodes.unauthorized:
        return const StorageFailure(StorageErrors.unauthorized);
      case StorageCodes.payloadTooLarge:
        return const StorageFailure(StorageErrors.payloadTooLarge);
      default:
        return StorageFailure(e.message);
    }
  }
}
