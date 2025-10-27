class BucketNames {
  static const images = 'images';
}

class StorageCodes {
  const StorageCodes._();

  static const badRequest = '400';
  static const unauthorized = '401';
  static const notFound = '404';
  static const conflict = '409';
  static const payloadTooLarge = '413';
}

class StorageErrors {
  const StorageErrors._();

  static const badRequest = 'Invalid storage request.';
  static const unauthorized = 'You do not have permission for this operation.';
  static const notFound = 'File not found.';
  static const conflict = 'A file with the same path already exists.';
  static const payloadTooLarge = 'File is too large.';
}
