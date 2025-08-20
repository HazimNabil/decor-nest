import 'package:envied/envied.dart';

part 'app_secrets.g.dart';

@Envied(path: '.env')
abstract class AppSecrets {
  @EnviedField(varName: 'SUPABASE_URL', obfuscate: true)
  static final String supabaseUrl = _AppSecrets.supabaseUrl;
  @EnviedField(varName: 'SUPABASE_ANON_KEY', obfuscate: true)
  static final String supabaseAnonKey = _AppSecrets.supabaseAnonKey;
  @EnviedField(varName: 'WEB_CLIENT_ID', obfuscate: true)
  static final String webClientId = _AppSecrets.webClientId;
}
