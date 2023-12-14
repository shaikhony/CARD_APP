import 'package:card_app/presentation/screens/add_card/add_card_screen.dart';
import 'package:card_app/presentation/screens/cards/cards_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const addCard = '/AddCardScreen';
  static const updateCard = '/updateCardScreen';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const CardsScreen(),
      ),
      GoRoute(
        path: addCard,
        builder: (context, state) => const AddCardScreen(),
      ),
      // GoRoute(
      //   path: updateCard,
      //   builder: (context, state) => const UpdateCardScreen(),
      // ),
    ],
  );
}