import 'package:aipay/blocs/auth/auth_bloc.dart';
import 'package:aipay/blocs/user/user_bloc.dart';
import 'package:aipay/shared/themes.dart';
import 'package:aipay/ui/screens/home/main_screens.dart';
import 'package:aipay/ui/screens/home/scan_qr_screens.dart';
import 'package:aipay/ui/screens/onboarding_screens.dart';
import 'package:aipay/ui/screens/pin_screens.dart';
import 'package:aipay/ui/screens/profile_edit_pin_screens.dart';
import 'package:aipay/ui/screens/profile_edit_screens.dart';
import 'package:aipay/ui/screens/profile_edit_success_screens.dart';
import 'package:aipay/ui/screens/provider_item_screens.dart';
import 'package:aipay/ui/screens/provider_paymnet_success_screens.dart';
import 'package:aipay/ui/screens/signin_screen.dart';
import 'package:aipay/ui/screens/signup_screens.dart';
import 'package:aipay/ui/screens/signup_success_screens.dart';
import 'package:aipay/ui/screens/splash_screens.dart';
import 'package:aipay/ui/screens/top_up_screens.dart';
import 'package:aipay/ui/screens/top_up_success_screens.dart';
import 'package:aipay/ui/screens/transfer_screens.dart';
import 'package:aipay/ui/screens/transfer_success_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          // ..add(AuthGetCurrentUser) but user success login
          create: (context) => AuthBloc()..add(AuthGetCurrentUser()),
        ),
        BlocProvider(
          // ..add(AuthGetCurrentUser) but user success login
          create: (context) => UserBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: kDarkBackgraundColor,
        ),
        routes: {
          '/': (context) => const SplashScreens(),
          '/onboarding': (context) => const OnboardingScrrens(),
          '/sign-in': (context) => const SignInScreens(),
          '/sign-up': (context) => const SignUpScreens(),
          '/sign-up-success': (context) => const SignUpSuccessScreens(),
          '/home': (context) => const MainScreens(),
          '/qr-code': (context) => const ScanQRScreens(),
          '/pin': (context) => const PinScreens(),
          '/profile-edit': (context) => const ProfileEditScreens(),
          '/profile-edit-pin': (context) => const ProfileEditPinScreens(),
          '/profile-edit-success': (context) =>
              const ProfileEditSuccessScreens(),
          '/top-up': (context) => const TopUpScreens(),
          '/top-up-success': (context) => const TopUpSuccessScreens(),
          '/transfer': (context) => const TransferScreens(),
          '/transfer-success': (context) => const TransferSuccessScreens(),
          '/provider-item': (context) => const ProvideriItemScreens(),
          '/provider-payment-success': (context) =>
              const ProviderPaymentSuccess(),
        },
      ),
    );
  }
}
