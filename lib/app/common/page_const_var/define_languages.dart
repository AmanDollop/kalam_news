import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:kalam_news_publication/app/common/page_const_var/page_const_var.dart';

class LanguageTranslations extends Translations{
  @override
  Map<String, Map<String, String>> get keys => {

    "en_US": {

      //Language Bottom Sheet:English

      PageConstVar.changeLanguage: PageConstVar.changeLanguage,
      PageConstVar.english: PageConstVar.english,
      PageConstVar.hindi: PageConstVar.hindi,
      PageConstVar.saveLanguage: PageConstVar.saveLanguage,
      PageConstVar.back: PageConstVar.back,


      //Page_SIGN_IN:English

      PageConstVar.logIn: PageConstVar.logIn,
      PageConstVar.signInUpToEnjoyTheBestManagingExperience: PageConstVar.signInUpToEnjoyTheBestManagingExperience,
      PageConstVar.emailPhone: PageConstVar.emailPhone,
      PageConstVar.password: PageConstVar.password,
      PageConstVar.rememberMe: PageConstVar.rememberMe,
      PageConstVar.forgetPassword: PageConstVar.forgetPassword,
      PageConstVar.registeredNow: PageConstVar.registeredNow,
      PageConstVar.dontHaveAnAccount: PageConstVar.dontHaveAnAccount,

      //Registered:English

      PageConstVar.registered: PageConstVar.registered,
      PageConstVar.referralCodeOrPhone: PageConstVar.referralCodeOrPhone,
      PageConstVar.referralCode: PageConstVar.referralCode,
      PageConstVar.verify: PageConstVar.verify,

      //Verify Registered:English

      PageConstVar.verifyRegistered: PageConstVar.verifyRegistered,
      PageConstVar.youAreRegisteringANewMemberUnder: PageConstVar.youAreRegisteringANewMemberUnder,
      PageConstVar.referenceCode: PageConstVar.referenceCode,
      PageConstVar.name: PageConstVar.name,
      PageConstVar.mobile: PageConstVar.mobile,
      PageConstVar.pleaseSelectWhichWayDoYouWantToGo: PageConstVar.pleaseSelectWhichWayDoYouWantToGo,
      PageConstVar.left: PageConstVar.left,
      PageConstVar.right: PageConstVar.right,
      PageConstVar.proceed: PageConstVar.proceed,

      //Personal Details:English

      PageConstVar.personalDetails: PageConstVar.personalDetails,
      PageConstVar.initials: PageConstVar.initials,
      PageConstVar.mr: PageConstVar.mr,
      PageConstVar.mrs: PageConstVar.mrs,
      PageConstVar.ms: PageConstVar.ms,
      PageConstVar.mst: PageConstVar.mst,
      PageConstVar.select: PageConstVar.select,
      PageConstVar.firstName: PageConstVar.firstName,
      PageConstVar.optional: PageConstVar.optional,
      PageConstVar.middleName: PageConstVar.middleName,
      PageConstVar.lastName: PageConstVar.lastName,
      PageConstVar.dob: PageConstVar.dob,
      PageConstVar.emailID: PageConstVar.emailID,
      PageConstVar.phoneNumber: PageConstVar.phoneNumber,
      PageConstVar.whatsAppNumber: PageConstVar.whatsAppNumber,
      PageConstVar.aadharNumber: PageConstVar.aadharNumber,
      PageConstVar.sameAsPhoneNumber: PageConstVar.sameAsPhoneNumber,
      PageConstVar.completeAddress: PageConstVar.completeAddress,
      PageConstVar.city: PageConstVar.city,
      PageConstVar.state: PageConstVar.state,
      PageConstVar.pinCode: PageConstVar.pinCode,
      PageConstVar.confirmPassword: PageConstVar.confirmPassword,
      PageConstVar.continueText: PageConstVar.continueText,

      //Validation:English

      PageConstVar.thisFiledIsRequired: PageConstVar.thisFiledIsRequired,
      PageConstVar.pleaseEnterReferralCode: PageConstVar.pleaseEnterReferralCode,
      PageConstVar.pleaseSelectInitials: PageConstVar.pleaseSelectInitials,
      PageConstVar.pleaseEnterFirsName: PageConstVar.pleaseEnterFirsName,
      PageConstVar.pleaseEnterLastName: PageConstVar.pleaseEnterLastName,
      PageConstVar.pleaseEnterDob: PageConstVar.pleaseEnterDob,
      PageConstVar.pleaseEnterEmail: PageConstVar.pleaseEnterEmail,
      PageConstVar.pleaseEnterValidEmail: PageConstVar.pleaseEnterValidEmail,
      PageConstVar.pleaseEnterNumber: PageConstVar.pleaseEnterNumber,
      PageConstVar.pleaseEnterValidNumber: PageConstVar.pleaseEnterValidNumber,
      PageConstVar.pleaseEnterCompleteAddress: PageConstVar.pleaseEnterCompleteAddress,
      PageConstVar.pleaseEnterAadharNumber: PageConstVar.pleaseEnterAadharNumber,
      PageConstVar.pleaseEnterValidAadharNumber: PageConstVar.pleaseEnterValidAadharNumber,
      PageConstVar.pleaseSelectState: PageConstVar.pleaseSelectState,
      PageConstVar.pleaseSelectCity: PageConstVar.pleaseSelectCity,
      PageConstVar.pleaseEnterPinCode: PageConstVar.pleaseEnterPinCode,
      PageConstVar.pleaseEnterPassword: PageConstVar.pleaseEnterPassword,
      PageConstVar.passwordLengthGreaterThan6: PageConstVar.passwordLengthGreaterThan6,
      PageConstVar.passwordLengthLessThan12: PageConstVar.passwordLengthLessThan12,
      PageConstVar.passwordContainAtLeastOneLowercase: PageConstVar.passwordContainAtLeastOneLowercase,
      PageConstVar.passwordContainAtLeastOneUppercase: PageConstVar.passwordContainAtLeastOneUppercase,
      PageConstVar.passwordContainAtLeastOneSpecialCharacter: PageConstVar.passwordContainAtLeastOneSpecialCharacter,
      PageConstVar.passwordContainAtLeastOneNumericCharacter: PageConstVar.passwordContainAtLeastOneNumericCharacter,
      PageConstVar.pleaseEnterCorrectPassword: PageConstVar.pleaseEnterCorrectPassword,
      PageConstVar.pleaseEnterConfirmPassword: PageConstVar.pleaseEnterConfirmPassword,
      PageConstVar.confirmPasswordNotMatch: PageConstVar.confirmPasswordNotMatch,

      //Forgot Your Password:English

      PageConstVar.forgotYourPassword: PageConstVar.forgotYourPassword,
      PageConstVar.pleaseEnterYourEmailPhoneNumberToResetThePassword: PageConstVar.pleaseEnterYourEmailPhoneNumberToResetThePassword,

      //OTP verification:English

      PageConstVar.otpVerification: PageConstVar.otpVerification,
      PageConstVar.enterTheVerificationCodeWeJustSendToYourPhoneNumber: PageConstVar.enterTheVerificationCodeWeJustSendToYourPhoneNumber,
      PageConstVar.verificationCode: PageConstVar.verificationCode,
      PageConstVar.resend: PageConstVar.resend,
      PageConstVar.resendOTP: PageConstVar.resendOTP,
      PageConstVar.sec: PageConstVar.sec,
      PageConstVar.sendOTP: PageConstVar.sendOTP,
      PageConstVar.didntReceiveCode: PageConstVar.didntReceiveCode,

      //new password:English

      PageConstVar.setNewPassword: PageConstVar.setNewPassword,
      PageConstVar.oldPassword: PageConstVar.oldPassword,
      PageConstVar.newPassword: PageConstVar.newPassword,
      PageConstVar.update: PageConstVar.update,

      //Success:English

      PageConstVar.success: PageConstVar.success,
      PageConstVar.yourPasswordHasBeenSuccessfullyReset: PageConstVar.yourPasswordHasBeenSuccessfullyReset,




    },

    "hi_IN": {

      //Language Bottom Sheet:English

      PageConstVar.changeLanguage: 'भाषा बदलें',
      PageConstVar.english: 'अंग्रेज़ी',
      PageConstVar.hindi: 'हिंदी',
      PageConstVar.saveLanguage: 'भाषा सहेजें',
      PageConstVar.back: 'पीछे',


      //Page_SIGN_IN:Hindi

      PageConstVar.logIn: "साइन इन करें",
      PageConstVar.signInUpToEnjoyTheBestManagingExperience: "सर्वोत्तम प्रबंधन अनुभव का आनंद लेने के लिए साइन-अप करें",
      PageConstVar.emailPhone: "ईमेल/फ़ोन",
      PageConstVar.password: "पासवर्ड",
      PageConstVar.rememberMe: "मुझे याद करो",
      PageConstVar.forgetPassword: "पासवर्ड भूल गए",
      PageConstVar.registeredNow: "अभी पंजीकृत",
      PageConstVar.dontHaveAnAccount: "कोई खाता नहीं है",

      //Registered:Hindi

      PageConstVar.registered: 'दर्ज कराई',
      PageConstVar.referralCodeOrPhone: 'रेफरल कोड या फ़ोन',
      PageConstVar.referralCode: 'रेफरल कोड',
      PageConstVar.verify: 'सत्यापित करें',

      //Verify Registered:Hindi

      PageConstVar.verifyRegistered: 'पंजीकृत सत्यापित करें',
      PageConstVar.youAreRegisteringANewMemberUnder: 'आप इसके अंतर्गत एक नये सदस्य का पंजीकरण कर रहे हैं',
      PageConstVar.referenceCode: 'संदर्भ कोड',
      PageConstVar.name: 'नाम',
      PageConstVar.mobile: 'गतिमान',
      PageConstVar.pleaseSelectWhichWayDoYouWantToGo: 'कृपया चुनें कि आप किस रास्ते पर जाना चाहते हैं?',
      PageConstVar.left: 'बाएं',
      PageConstVar.right: 'दाएँ',
      PageConstVar.proceed: 'आगे बढ़ना',

      //Personal Details:Hindi

      PageConstVar.personalDetails: 'व्यक्तिगत विवरण',
      PageConstVar.initials: 'आद्याक्षर',
      PageConstVar.mr: 'श्री',
      PageConstVar.mrs: 'श्रीमती',
      PageConstVar.ms: 'एमएस',
      PageConstVar.mst: 'एमएसटी',
      PageConstVar.select: 'चुनना',
      PageConstVar.firstName: 'पहला नाम',
      PageConstVar.optional: 'वैकल्पिक',
      PageConstVar.middleName: 'मध्य नाम',
      PageConstVar.lastName: 'उपनाम',
      PageConstVar.dob: 'जन्म तिथि',
      PageConstVar.emailID: 'ईमेल आईडी',
      PageConstVar.phoneNumber: 'फ़ोन नंबर',
      PageConstVar.whatsAppNumber: 'व्हाट्सएप नंबर',
      PageConstVar.aadharNumber: 'आधार नंबर',
      PageConstVar.sameAsPhoneNumber: 'फ़ोन नंबर के समान',
      PageConstVar.completeAddress: 'पूर्ण पता',
      PageConstVar.city: 'शहर',
      PageConstVar.state: 'राज्य',
      PageConstVar.pinCode: 'पिन कोड',
      PageConstVar.confirmPassword: 'पासवर्ड की पुष्टि कीजिये',
      PageConstVar.continueText: 'जारी रखना',

      //Validation:Hindi

      PageConstVar.thisFiledIsRequired: "यह दायर आवश्यक है",
      PageConstVar.pleaseEnterReferralCode: 'कृपया रेफरल कोड दर्ज करें',
      PageConstVar.pleaseSelectInitials: 'कृपया आरंभिक अक्षर चुनें',
      PageConstVar.pleaseEnterFirsName: 'कृपया प्रथम नाम दर्ज करें',
      PageConstVar.pleaseEnterLastName: 'कृपया अंतिम नाम दर्ज करें',
      PageConstVar.pleaseEnterDob: 'कृपया जन्मतिथि दर्ज करें',
      PageConstVar.pleaseEnterEmail: 'कृपया ईमेल दर्ज करें',
      PageConstVar.pleaseEnterValidEmail: 'कृपया वैध ईमेल दर्ज़ करें',
      PageConstVar.pleaseEnterNumber: 'कृपया संख्या दर्ज करें',
      PageConstVar.pleaseEnterValidNumber: 'कृपया वैध संख्या दर्ज करें',
      PageConstVar.pleaseEnterCompleteAddress: 'कृपया पूरा पता दर्ज करें',
      PageConstVar.pleaseEnterAadharNumber: 'कृपया आधार नंबर दर्ज करें',
      PageConstVar.pleaseEnterValidAadharNumber: 'कृपया वैध आधार नंबर दर्ज करें',
      PageConstVar.pleaseSelectState: 'कृपया राज्य का चयन करें',
      PageConstVar.pleaseSelectCity: 'कृपया शहर चुनें',
      PageConstVar.pleaseEnterPinCode: 'कृपया पिन कोड दर्ज करें',
      PageConstVar.pleaseEnterPassword: 'कृपया पासवर्ड दर्ज करें',
      PageConstVar.passwordLengthGreaterThan6: 'पासवर्ड की लंबाई 6 से अधिक',
      PageConstVar.passwordLengthLessThan12: 'पासवर्ड की लंबाई 12 से कम',
      PageConstVar.passwordContainAtLeastOneLowercase: 'पासवर्ड में कम से कम एक लोअरकेस होना चाहिए',
      PageConstVar.passwordContainAtLeastOneUppercase: 'पासवर्ड में कम से कम एक अपरकेस हो',
      PageConstVar.passwordContainAtLeastOneSpecialCharacter: 'पासवर्ड में कम से कम एक विशेष अक्षर होना चाहिए',
      PageConstVar.passwordContainAtLeastOneNumericCharacter: 'पासवर्ड में कम से कम एक संख्यात्मक अक्षर होना चाहिए',
      PageConstVar.pleaseEnterCorrectPassword: 'कृपया सही पासवर्ड दर्ज करें',
      PageConstVar.pleaseEnterConfirmPassword: 'कृपया पुष्टि पासवर्ड दर्ज करें',
      PageConstVar.confirmPasswordNotMatch: 'पुष्टि करें कि पासवर्ड मेल नहीं खाता',

      //Forgot Your Password:Hindi

      PageConstVar.forgotYourPassword: 'अपना पासवर्ड भूल गए हैं',
      PageConstVar.pleaseEnterYourEmailPhoneNumberToResetThePassword: 'पासवर्ड रीसेट करने के लिए कृपया अपना ईमेल/फोन नंबर दर्ज करें',

      //OTP verification:Hindi

      PageConstVar.otpVerification: 'ओ.टी.पी  सत्यापन',
      PageConstVar.enterTheVerificationCodeWeJustSendToYourPhoneNumber: 'वह सत्यापन कोड दर्ज करें जो हमने अभी आपके फ़ोन नंबर पर भेजा है',
      PageConstVar.verificationCode: 'सत्यापन कोड',
      PageConstVar.resend: 'पुनः भेजें',
      PageConstVar.resendOTP: 'ओटीपी पुनः भेजें',
      PageConstVar.sec: 'सेकंड',
      PageConstVar.sendOTP: 'ओ.टी.पी भेजें',
      PageConstVar.didntReceiveCode: 'कोड प्राप्त नहीं हुआ?',

      //OTP verification:Hindi

      PageConstVar.setNewPassword: 'नया पासवर्ड सेट करें',
      PageConstVar.oldPassword: 'पुराना पासवर्ड',
      PageConstVar.newPassword: 'नया पासवर्ड',
      PageConstVar.update: 'अद्यतन',

      //Success:English

      PageConstVar.success: 'सफलता',
      PageConstVar.yourPasswordHasBeenSuccessfullyReset: 'आपका पासवर्ड सफलतापूर्वक रीसेट कर दिया गया है.',

    },
  };

}