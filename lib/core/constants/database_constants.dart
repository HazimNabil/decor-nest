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
  static const favorites = 'favorites';
  static const cart = 'cart';
  static const category = 'category';
  static const id = 'id';
  static const isFavorite = 'is_favorite';
  static const isInCart = 'is_in_cart';
  static const name = 'name';
  static const createdAt = 'created_at';
  static const imagePath = 'image_path';
  static const imageUrl = 'image_url';
  static const userId = 'user_id';
  static const productId = 'product_id';
}
