import 'package:flutter_wordpress/flutter_wordpress.dart';

class WordPressService {
  static WordPressService instane = WordPressService._();

  WordPress wordPress = WordPress(
    baseUrl: "http://wptest.dreamsoftin.com",
    authenticator: WordPressAuthenticator.JWT,
  );
  WordPressService._();

  
}
