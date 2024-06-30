import 'package:flutter_dotenv/flutter_dotenv.dart';

final String url = dotenv.env['url'] ?? '';
final String tokenIdentifika = dotenv.env['identifika'] ?? '';
