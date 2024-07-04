import 'package:flutter_dotenv/flutter_dotenv.dart';

final String url = dotenv.env['url'] ?? '';
final String urlIdentifika = dotenv.env['url_identifika'] ?? '';
final String tokenIdentifika = dotenv.env['token_identifika'] ?? '';
