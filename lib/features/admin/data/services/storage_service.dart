import 'dart:io' show File;

import 'package:decor_nest/core/constants/storage_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StorageService {
  final _supabaseStorage = Supabase.instance.client.storage;

  Future<void> uploadImage(String path, File file) async {
    await _supabaseStorage.from(BucketNames.images).upload(path, file);
  }

  Future<void> deleteImage(String path) async {
    await _supabaseStorage.from(BucketNames.images).remove([path]);
  }

  String getImageUrl(String path) {
    return _supabaseStorage.from(BucketNames.images).getPublicUrl(path);
  }

  Future<void> updateImage(String path, File file) async {
    await _supabaseStorage.from(BucketNames.images).update(path, file);
  }
}
