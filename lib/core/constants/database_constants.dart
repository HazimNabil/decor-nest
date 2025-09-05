class DatabaseCodes {
  const DatabaseCodes._();

  static const uniqueViolation = '23505';
  static const foreignKeyViolation = '23503';
  static const notNullViolation = '23502';
  static const rowNotFound = 'PGRST116';
}

class DatabaseErrors {
  const DatabaseErrors._();

  static const duplicateRecord = 'This item already exists.';
  static const referenceNotFound = 'Related record not found.';
  static const requiredFieldMissing = 'A required field is missing.';
  static const rowNotFound = 'No matching record found.';
}

class TableConstants {
  const TableConstants._();

  static const products = 'products';
  static const category = 'category';
  static const id = 'id';
  static const isFavorite = 'is_favorite';
  static const name = 'name';
  static const createdAt = 'created_at';
  static const imagePath = 'image_path';
  static const imageUrl = 'image_url';
}
