import 'package:flutter/material.dart';
import 'package:smart_jaguar/main.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const MyApp());

      case '/ArticleDetails':
        return _materialRoute(const MyApp());

      case '/SavedArticles':
        return _materialRoute(const MyApp());
        
      default:
        return _materialRoute(const MyApp());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
