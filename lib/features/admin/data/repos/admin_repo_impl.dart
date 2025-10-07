import 'dart:io' show File;

import 'package:decor_nest/core/constants/database_constants.dart';
import 'package:decor_nest/core/errors/database_failure.dart';
import 'package:decor_nest/core/errors/storage_failure.dart';
import 'package:decor_nest/core/helper/typedefs.dart';
import 'package:decor_nest/core/models/product.dart';
import 'package:decor_nest/features/admin/data/services/admin_database_service.dart';
import 'package:decor_nest/features/admin/data/services/storage_service.dart';
import 'package:decor_nest/features/admin/data/repos/admin_repo.dart';
import 'package:fpdart/fpdart.dart';
import 'package:supabase_flutter/supabase_flutter.dart'
    show PostgrestException, StorageException;

class AdminRepoImpl implements AdminRepo {
  final AdminDatabaseService _databaseService;
  final StorageService _storageService;

  const AdminRepoImpl(this._databaseService, this._storageService);

  @override
  FutureEither<Unit> addProduct({
    required Product product,
    required File image,
  }) async {
    return _guard<Unit>(() async {
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final filePath = 'products/$fileName';
      await _storageService.uploadImage(filePath, image);

      product.imageUrl = _storageService.getImageUrl(filePath);
      product.imagePath = filePath;

      await _databaseService.addProduct(product);

      return unit;
    });
  }

  @override
  FutureEither<Unit> deleteProduct({required Product product}) async {
    return _guard(() async {
      await _databaseService.deleteProduct(product.id!);

      await _storageService.deleteImage(product.imagePath!);

      return unit;
    });
  }

  @override
  FutureEither<List<Product>> readProducts({required int page}) async {
    return _guard(() async {
      final jsonProducts = await _databaseService.readProducts(page: page);

      final products = jsonProducts
          .map((jsonProduct) => Product.fromJson(jsonProduct))
          .toList();

      return products;
    });
  }

  @override
  FutureEither<List<Product>> searchProducts({
    required String query,
    required int page,
  }) async {
    return _guard(() async {
      final jsonProducts = await _databaseService.searchProducts(
        page: page,
        searchQuery: query,
      );

      final products = jsonProducts
          .map((jsonProduct) => Product.fromJson(jsonProduct))
          .toList();

      return products;
    });
  }

  @override
  FutureEither<Unit> updateProduct({
    required Map<String, dynamic> fields,
    required Product product,
    File? image,
  }) async {
    return _guard(() async {
      if (image != null) {
        await _storageService.updateImage(product.imagePath!, image);
        fields[TableConstants.imagePath] = product.imagePath;
        fields[TableConstants.imageUrl] = _storageService.getImageUrl(
          product.imagePath!,
        );
      }

      await _databaseService.updateProduct(id: product.id!, fields: fields);

      return unit;
    });
  }

  FutureEither<T> _guard<T>(Future<T> Function() request) async {
    try {
      final response = await request();
      return right(response);
    } on StorageException catch (e) {
      return left(StorageFailure.fromException(e));
    } on PostgrestException catch (e) {
      return left(DatabaseFailure.fromException(e));
    } catch (e) {
      return left(DatabaseFailure(e.toString()));
    }
  }
}
