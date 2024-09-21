import 'dart:ffi';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelioapp/config/app_route.dart';
import 'package:hotelioapp/config/session.dart';
import 'package:hotelioapp/firebase_options.dart';
import 'package:hotelioapp/page/checkout_page.dart';
import 'package:hotelioapp/page/checkout_success_page.dart';
import 'package:hotelioapp/page/detail_booking_page.dart';
import 'package:hotelioapp/page/detail_page.dart';
import 'package:hotelioapp/page/home_page.dart';
import 'package:hotelioapp/page/intro_page.dart';
import 'package:hotelioapp/page/sign_in.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:hotelioapp/config/app_color.dart';

import 'model/user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initializeDateFormatting('en_US');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        scaffoldBackgroundColor: AppColor.backgroundScaffold,
        primaryColor: AppColor.primary,
        colorScheme: const ColorScheme.light(
          primary: AppColor.primary,
          secondary: AppColor.secondary
        )
      ),
      routes: {
        '/':(context) {
          return FutureBuilder(future: Session.getUser(),
          builder: (context, AsyncSnapshot<User> snapshot) {
            if (snapshot.data == null || snapshot.data!.id == null) {
              return IntroPage();
            } else {
              return HomePage();
          };
          });
        },
        AppRoute.intro:(context)=>IntroPage(),
        AppRoute.home:(context)=>HomePage(),
        AppRoute.signin:(context)=>SignInPage(),
        AppRoute.detail:(context)=>DetailPage(),
        AppRoute.checkout:(context)=>CheckoutPage(),
        AppRoute.checkoutSuccess:(context)=>CheckoutSuccessPage(),
        AppRoute.detailBooking:(context)=>DetailBookingPage(),
      },
    );
  }
}

