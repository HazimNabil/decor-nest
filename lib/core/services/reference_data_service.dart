import 'package:decor_nest/core/constants/database_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ReferenceDataService {
  final SupabaseClient _supabase;
  late final List<String> categories;
  late final List<String> woodTypes;

  ReferenceDataService(this._supabase);

  Future<void> preloadReferenceData() async {
    await Future.wait([_loadCategories(), _loadWoodTypes()]);
  }

  Future<void> _loadCategories() async {
    final response = await _supabase
        .from(TableConstants.categories)
        .select(TableConstants.name);

    categories = response
        .map((json) => json[TableConstants.name] as String)
        .toList();
  }

  Future<void> _loadWoodTypes() async {
    final response = await _supabase
        .from(TableConstants.woodTypes)
        .select(TableConstants.name);

    woodTypes = response
        .map((json) => json[TableConstants.name] as String)
        .toList();
  }
}
