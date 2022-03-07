import 'package:flutter/material.dart';
import 'package:zakazpro/screens/choose_account/choose_account_screen.dart';
import 'package:zakazpro/screens/choose_city/choose_city.dart';
import 'package:zakazpro/screens/choose_city/choose_region.dart';
import 'package:zakazpro/screens/permision/permision_screen.dart';
import 'package:zakazpro/screens/presentation/presentation_screen.dart';
import 'package:zakazpro/screens/public_offer/public_offer_screen.dart';
import 'package:zakazpro/screens/registration/registration_first_screen.dart';
import 'package:zakazpro/screens/registration/registration_second_screen.dart';

class RouteGenerator {
  static Route<dynamic> routes({required RouteSettings settings}) {
    switch (settings.name) {
      case '/choose_account':
        return MaterialPageRoute(builder: (context) => ChooseAccountScreen());
      case '/presentation':
        return MaterialPageRoute(builder: (context) => PresentationScreen());
      case '/choose_region':
        return MaterialPageRoute(builder: (context) => ChooseRegion());
      case '/choose_city':
        return MaterialPageRoute(builder: (context) => ChooseCity());
      case '/registration_first_screen':
        return MaterialPageRoute(
            builder: (context) => RegistrationFirstScreen());
      case '/registration_second_screen':
        return MaterialPageRoute(
            builder: (context) => RegistrationSecondScreen());
      case '/public_offer':
        return MaterialPageRoute(builder: (context) => PublicOfferScreen());
      case '/premision_screen':
        return MaterialPageRoute(builder: (context) => PermisionScreen());
      default:
        return MaterialPageRoute(builder: (context) => ChooseAccountScreen());
    }
  }
}
