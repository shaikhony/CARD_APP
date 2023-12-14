import 'package:card_app/business_logic/cubit/cards_cubit.dart';
import 'package:card_app/constants/app_router.dart';
import 'package:card_app/data/repository/cards_repository.dart';
import 'package:card_app/data/web_services/cards_web_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'color_schemes.g.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const CardsApp());
}

class CardsApp extends StatelessWidget {
  const CardsApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  CardsRepository cardsRepository = CardsRepository(CardsWebServises());
  CardsCubit cardsCubit = CardsCubit(cardsRepository);
    return BlocProvider(
      create: (context) => cardsCubit,
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar', 'AE'), // arabic
        ],
      ),
    );
  }
}
