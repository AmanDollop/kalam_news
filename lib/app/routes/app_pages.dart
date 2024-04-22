import 'package:get/get.dart';

import '../modules/add_document/bindings/add_document_binding.dart';
import '../modules/add_document/views/add_document_view.dart';
import '../modules/bottom_bar/bindings/bottom_bar_binding.dart';
import '../modules/bottom_bar/views/bottom_bar_view.dart';
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/log_in/bindings/log_in_binding.dart';
import '../modules/log_in/views/log_in_view.dart';
import '../modules/new_password/bindings/new_password_binding.dart';
import '../modules/new_password/views/new_password_view.dart';
import '../modules/otp/bindings/otp_binding.dart';
import '../modules/otp/views/otp_view.dart';
import '../modules/password_reset_successfully/bindings/password_reset_successfully_binding.dart';
import '../modules/password_reset_successfully/views/password_reset_successfully_view.dart';
import '../modules/personal_details/bindings/personal_details_binding.dart';
import '../modules/personal_details/views/personal_details_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/registration/bindings/registration_binding.dart';
import '../modules/registration/views/registration_view.dart';
import '../modules/registration_verification/bindings/registration_verification_binding.dart';
import '../modules/registration_verification/views/registration_verification_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/wallet/bindings/wallet_binding.dart';
import '../modules/wallet/views/wallet_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOG_IN,
      page: () => const LogInView(),
      binding: LogInBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRATION,
      page: () => const RegistrationView(),
      binding: RegistrationBinding(),
    ),
    GetPage(
      name: _Paths.REGISTRATION_VERIFICATION,
      page: () => const RegistrationVerificationView(),
      binding: RegistrationVerificationBinding(),
    ),
    GetPage(
      name: _Paths.PERSONAL_DETAILS,
      page: () => const PersonalDetailsView(),
      binding: PersonalDetailsBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.NEW_PASSWORD,
      page: () => const NewPasswordView(),
      binding: NewPasswordBinding(),
    ),
    GetPage(
      name: _Paths.PASSWORD_RESET_SUCCESSFULLY,
      page: () => const PasswordResetSuccessfullyView(),
      binding: PasswordResetSuccessfullyBinding(),
    ),
    GetPage(
      name: _Paths.OTP,
      page: () => const OtpView(),
      binding: OtpBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_BAR,
      page: () => const BottomBarView(),
      binding: BottomBarBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.WALLET,
      page: () => const WalletView(),
      binding: WalletBinding(),
    ),
    GetPage(
      name: _Paths.ADD_DOCUMENT,
      page: () => const AddDocumentView(),
      binding: AddDocumentBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
  ];
}
