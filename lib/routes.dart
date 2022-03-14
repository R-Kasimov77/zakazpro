import 'package:flutter/material.dart';
import 'package:zakazpro/screens/chat/chat_screen.dart';
import 'package:zakazpro/screens/home/detail_screen.dart';
import 'package:zakazpro/screens/menu/menu.dart';
import 'package:zakazpro/screens/my_orders/detail_order_screen.dart';
import 'package:zakazpro/screens/profile/data/my_job/my_job_screen.dart';
import 'package:zakazpro/screens/profile/data/my_profile_screen.dart';
import 'package:zakazpro/screens/profile/data/questions/instruction_screen.dart';
import 'package:zakazpro/screens/profile/data/questions/questions_screen.dart';
import 'package:zakazpro/screens/profile/data/settings/settings_message.dart';
import 'package:zakazpro/screens/profile/partfolio/partfolio-screen.dart';
import 'package:zakazpro/screens/profile/reviews/review_screen.dart';
import 'package:zakazpro/screens/welcome/choose_account/choose_account_screen.dart';
import 'package:zakazpro/screens/welcome/choose_city/choose_city.dart';
import 'package:zakazpro/screens/welcome/choose_city/choose_region.dart';
import 'package:zakazpro/screens/welcome/permision/permision_screen.dart';
import 'package:zakazpro/screens/welcome/presentation/presentation_screen.dart';
import 'package:zakazpro/screens/welcome/public_offer/public_offer_screen.dart';
import 'package:zakazpro/screens/welcome/registration/registration_first_screen.dart';
import 'package:zakazpro/screens/welcome/registration/registration_second_screen.dart';

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
      case '/menu':
        return MaterialPageRoute(builder: (context) => Menu());
      case '/detail':
        return MaterialPageRoute(builder: (context) => Detailscreen());
      case '/detail_order':
        return MaterialPageRoute(builder: (context) => DetailOrderScreen());
      case '/my_partfolio_screen':
        return MaterialPageRoute(builder: (context) => PartfolioScreen());
      case '/review_screen':
        return MaterialPageRoute(builder: (context) => ReviewScreen());
      case '/chat_screen':
        return MaterialPageRoute(builder: (context) => ChatScreen());
      case '/settings_message':
        return MaterialPageRoute(builder: (context) => SettingsMessage());
      case '/my_job_screen':
        return MaterialPageRoute(builder: (context) => MyJobScreen());
      case '/questions_screen':
        return MaterialPageRoute(builder: (context) => QuestionsScreen());
      case '/instruction_screen':
        return MaterialPageRoute(builder: (context) => InstuctionScreen());
      default:
        return MaterialPageRoute(builder: (context) => ChooseAccountScreen());
    }
  }
}
