import 'package:brain_heart/app/modules/accountSetUp/account_set_up_screen.dart';
import 'package:brain_heart/app/modules/additionalInfo/alcohol_screen.dart';
import 'package:brain_heart/app/modules/additionalInfo/education_screen.dart';
import 'package:brain_heart/app/modules/additionalInfo/exercise_screen.dart';
import 'package:brain_heart/app/modules/additionalInfo/religion_screen.dart';
import 'package:brain_heart/app/modules/additionalInfo/smoking_screen.dart';
import 'package:brain_heart/app/modules/bottomBar/bottom_bar_screen.dart';
import 'package:brain_heart/app/modules/chat/chat_screen.dart';
import 'package:brain_heart/app/modules/chooseInterest/choose_your_interest_screen.dart';
import 'package:brain_heart/app/modules/deleteAccount/delete_account_screen.dart';
import 'package:brain_heart/app/modules/feedback/feedback_screen.dart';
import 'package:brain_heart/app/modules/intro/intro_screen.dart';
import 'package:brain_heart/app/modules/location/locations_screen.dart';
import 'package:brain_heart/app/modules/partnerPreferences/partner_preferences_screen.dart';
import 'package:brain_heart/app/modules/profile/other_user_profile.dart';
import 'package:brain_heart/app/modules/reportUser/report_user_screen.dart';
import 'package:brain_heart/app/modules/selectAvatar/select_avatar_screen.dart';
import 'package:brain_heart/app/modules/signIn/sign_in_screen.dart';
import 'package:brain_heart/app/modules/splash/splash_screen.dart';
import 'package:brain_heart/app/modules/yourMatches/matches_chat_screen.dart';
import 'package:get/get.dart';
part './app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.initial,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: Routes.introScreen,
      page: () => IntroScreen(),
    ),
    GetPage(
      name: Routes.otherUserProfileScreen,
      page: () => const OtherUserProfileScreen(),
    ),
    GetPage(
      name: Routes.signInScreen,
      page: () => SignInScreen(),
    ),
    GetPage(
      name: Routes.bottomBarScreen,
      page: () => BottomBarScreen(),
    ),
    GetPage(
      name: Routes.selectAvatarScreen,
      page: () => SelectAvatarScreen(),
    ),
    GetPage(
      name: Routes.accountSetUpScreen,
      page: () => AccountSetUpScreen(),
    ),
    GetPage(
      name: Routes.locationScreen,
      page: () => const LocationScreen(),
    ),
    GetPage(
      name: Routes.educationScreen,
      page: () => EducationScreen(),
    ),
    GetPage(
      name: Routes.religionScreen,
      page: () => ReligionScreen(),
    ),
    GetPage(
      name: Routes.exerciseScreen,
      page: () => ExerciseScreen(),
    ),
    GetPage(
      name: Routes.alcoholScreen,
      page: () => AlcoholScreen(),
    ),
    GetPage(
      name: Routes.smokingScreen,
      page: () => SmokingScreen(),
    ),
    GetPage(
      name: Routes.chooseYourInterestScreen,
      page: () => ChooseYourInterestScreen(),
    ),
    GetPage(
      name: Routes.partnerPreferencesScreen,
      page: () => PartnerPreferencesScreen(),
    ),
    GetPage(
      name: Routes.deleteAccountScreen,
      page: () => DeleteAccountScreen(),
    ),
    GetPage(
      name: Routes.feedBackScreen,
      page: () => FeedBackScreen(),
    ),
    GetPage(
      name: Routes.chatScreen,
      page: () => ChatScreen(),
    ),
    GetPage(
      name: Routes.matchesChatScreen,
      page: () => const MatchesChatScreen(),
    ),
    GetPage(
      name: Routes.reportUserScreen,
      page: () => ReportUserScreen(),
    ),
  ];
}
