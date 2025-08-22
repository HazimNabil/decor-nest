import 'package:decor_nest/core/constants/database_constants.dart';
import 'package:decor_nest/core/errors/failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart' show PostgrestException;

class DatabaseFailure extends Failure {
  const DatabaseFailure(super.message);

  factory DatabaseFailure.fromException(PostgrestException e) {
    return switch (e.code) {
      DatabaseCodes.uniqueViolation => const DatabaseFailure(
        DatabaseErrors.duplicateRecord,
      ),
      DatabaseCodes.foreignKeyViolation => const DatabaseFailure(
        DatabaseErrors.referenceNotFound,
      ),
      DatabaseCodes.notNullViolation => const DatabaseFailure(
        DatabaseErrors.requiredFieldMissing,
      ),
      DatabaseCodes.rowNotFound => const DatabaseFailure(
        DatabaseErrors.rowNotFound,
      ),
      _ => DatabaseFailure(e.message),
    };
  }
}
