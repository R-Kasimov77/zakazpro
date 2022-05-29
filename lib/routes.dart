import 'package:flutter/material.dart';
import 'package:zakazpro/model/screens/detail_screen_arguments.dart';
import 'package:zakazpro/screens/chat/chat_screen.dart';
import 'package:zakazpro/screens/home/detail_screen.dart';
import 'package:zakazpro/screens/login/login_screen.dart';
import 'package:zakazpro/screens/menu/menu.dart';
import 'package:zakazpro/screens/my_orders/components/custom_answer_container.dart';
import 'package:zakazpro/screens/my_orders/components/custom_my_orders_container.dart';
import 'package:zakazpro/screens/my_orders/detail_order_screen.dart';
import 'package:zakazpro/screens/profile/data/my_job/my_job_screen.dart';
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
      case '/my_orders_screen':
        final arguments = settings.arguments as DetailScreenArguments;
        return MaterialPageRoute(
          builder: (context) => CustomMyOrdersContainer(
            index: arguments.index,
            orders: arguments.order.results,
          ),
        );
      case '/login':
        return MaterialPageRoute(builder: (context) => LoginScreen());
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
        final arguments = settings.arguments as DetailScreenArguments;
        return MaterialPageRoute(
          builder: (context) => Detailscreen(
            index: arguments.index,
            order: arguments.order,
          ),
        );
      case '/detail_order':
        final arguments = settings.arguments as DetailScreenArguments;
        return MaterialPageRoute(
          builder: (context) => DetailOrderScreen(
            index: arguments.index,
            order: arguments.order,
          ),
        );
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
