import 'package:get/get_navigation/src/root/internacionalization.dart';
import 'package:kalam_news_publication/app/common/packages/cd.dart';
import 'package:kalam_news_publication/app/common/page_const_var/page_const_var.dart';

class LanguageTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {

    "en_US": {

      ///TODO Language Bottom Sheet:English

      PageConstVar.changeLanguage: PageConstVar.changeLanguage,
      PageConstVar.english: PageConstVar.english,
      PageConstVar.hindi: PageConstVar.hindi,
      PageConstVar.saveLanguage: PageConstVar.saveLanguage,
      PageConstVar.back: PageConstVar.back,


      ///TODO Page_SIGN_IN:English

      PageConstVar.logIn: PageConstVar.logIn,
      PageConstVar.signInUpToEnjoyTheBestManagingExperience: PageConstVar.signInUpToEnjoyTheBestManagingExperience,
      PageConstVar.emailPhone: PageConstVar.emailPhone,
      PageConstVar.password: PageConstVar.password,
      PageConstVar.rememberMe: PageConstVar.rememberMe,
      PageConstVar.forgotPassword: PageConstVar.forgotPassword,
      PageConstVar.registeredNow: PageConstVar.registeredNow,
      PageConstVar.dontHaveAnAccount: PageConstVar.dontHaveAnAccount,

      ///TODO Registered:English

      PageConstVar.registered: PageConstVar.registered,
      PageConstVar.referralCodeOrPhone: PageConstVar.referralCodeOrPhone,
      PageConstVar.referralCode: PageConstVar.referralCode,
      PageConstVar.verify: PageConstVar.verify,

      ///TODO Verify Registered:English

      PageConstVar.verifyRegistered: PageConstVar.verifyRegistered,
      PageConstVar.youAreRegisteringANewMemberUnder: PageConstVar.youAreRegisteringANewMemberUnder,
      PageConstVar.referenceCode: PageConstVar.referenceCode,
      PageConstVar.name: PageConstVar.name,
      PageConstVar.mobile: PageConstVar.mobile,
      PageConstVar.pleaseSelectWhichWayDoYouWantToGo: PageConstVar.pleaseSelectWhichWayDoYouWantToGo,
      PageConstVar.left: PageConstVar.left,
      PageConstVar.right: PageConstVar.right,
      PageConstVar.proceed: PageConstVar.proceed,

      ///TODO Personal Details:English

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

      ///TODO Validation:English

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
      PageConstVar.pleaseEnterPanCardNumber: PageConstVar.pleaseEnterPanCardNumber,
      PageConstVar.pleaseEnterValidPanCardNumber: PageConstVar.pleaseEnterValidPanCardNumber,
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

      PageConstVar.pleaseEnterBankName: PageConstVar.pleaseEnterBankName,
      PageConstVar.pleaseEnterBankBranchName: PageConstVar.pleaseEnterBankBranchName,
      PageConstVar.pleaseEnterAccountNumber: PageConstVar.pleaseEnterAccountNumber,
      PageConstVar.pleaseEnterReAccountNumber: PageConstVar.pleaseEnterReAccountNumber,
      PageConstVar.accountNumberNotMatch: PageConstVar.accountNumberNotMatch,
      PageConstVar.pleaseEnterCustomerName: PageConstVar.pleaseEnterCustomerName,
      PageConstVar.pleaseEnterIFSCCode: PageConstVar.pleaseEnterIFSCCode,
      PageConstVar.pleaseEnterValidIFSCCode: PageConstVar.pleaseEnterValidIFSCCode,

      ///TODO Forgot Your Password:English
      ///
      PageConstVar.forgotYourPassword: PageConstVar.forgotYourPassword,
      PageConstVar.pleaseEnterYourEmailPhoneNumberToResetThePassword: PageConstVar.pleaseEnterYourEmailPhoneNumberToResetThePassword,

      ///TODO OTP verification:English

      PageConstVar.otpVerification: PageConstVar.otpVerification,
      PageConstVar.enterTheVerificationCodeWeJustSendToYourPhoneNumber: PageConstVar.enterTheVerificationCodeWeJustSendToYourPhoneNumber,
      PageConstVar.verificationCode: PageConstVar.verificationCode,
      PageConstVar.resend: PageConstVar.resend,
      PageConstVar.resendOTP: PageConstVar.resendOTP,
      PageConstVar.sec: PageConstVar.sec,
      PageConstVar.sendOTP: PageConstVar.sendOTP,
      PageConstVar.didntReceiveCode: PageConstVar.didntReceiveCode,

      ///TODO new password:English

      PageConstVar.setNewPassword: PageConstVar.setNewPassword,
      PageConstVar.oldPassword: PageConstVar.oldPassword,
      PageConstVar.newPassword: PageConstVar.newPassword,
      PageConstVar.update: PageConstVar.update,

      ///TODO Success:English

      PageConstVar.success: PageConstVar.success,
      PageConstVar.yourPasswordHasBeenSuccessfullyReset: PageConstVar.yourPasswordHasBeenSuccessfullyReset,

      ///TODO Bottom Bar:English

      PageConstVar.home: PageConstVar.home,
      PageConstVar.profile: PageConstVar.profile,
      PageConstVar.genealogy: PageConstVar.genealogy,
      PageConstVar.wallet: PageConstVar.wallet,
      PageConstVar.achievements: PageConstVar.achievements,

      ///TODO Home Page:English

      PageConstVar.welcome: PageConstVar.welcome,
      PageConstVar.yourProfileProgress: PageConstVar.yourProfileProgress,
      PageConstVar.packages: PageConstVar.packages,
      PageConstVar.purchasePackages: PageConstVar.purchasePackages,
      PageConstVar.nodeCount: PageConstVar.nodeCount,
      PageConstVar.leftBv: PageConstVar.leftBv,
      PageConstVar.rightBv: PageConstVar.rightBv,
      PageConstVar.commission: PageConstVar.commission,
      PageConstVar.yourSales: PageConstVar.yourSales,
      PageConstVar.walletBalance: PageConstVar.walletBalance,
      PageConstVar.withdrawalBalance: PageConstVar.withdrawalBalance,
      PageConstVar.upgrade: PageConstVar.upgrade,
      PageConstVar.purchased: PageConstVar.purchased,
      PageConstVar.purchaseNow: PageConstVar.purchaseNow,
      PageConstVar.upgradeNow: PageConstVar.upgradeNow,
      PageConstVar.alreadyPurchased: PageConstVar.alreadyPurchased,
      PageConstVar.iAccept: PageConstVar.iAccept,
      PageConstVar.termsAndConditions: PageConstVar.termsAndConditions,

      ///TODO Profile Page:English

      PageConstVar.referredBy: PageConstVar.referredBy,
      PageConstVar.message: PageConstVar.message,
      PageConstVar.kycApplication: PageConstVar.kycApplication,
      PageConstVar.accountSetting: PageConstVar.accountSetting,
      PageConstVar.editProfile: PageConstVar.editProfile,
      PageConstVar.changePassword: PageConstVar.changePassword,
      PageConstVar.manageBankDetail: PageConstVar.manageBankDetail,
      PageConstVar.referralAFriends: PageConstVar.referralAFriends,
      PageConstVar.waitForResponse: PageConstVar.waitForResponse,
      PageConstVar.logOut: PageConstVar.logOut,

      ///TODO KYC Application Page:English

      PageConstVar.personalInformation: PageConstVar.personalInformation,
      PageConstVar.profilePhoto: PageConstVar.profilePhoto,
      PageConstVar.aadharCardDetails: PageConstVar.aadharCardDetails,
      PageConstVar.panCardDetails: PageConstVar.panCardDetails,
      PageConstVar.userId: PageConstVar.userId,
      PageConstVar.uploadProfilePicture: PageConstVar.uploadProfilePicture,
      PageConstVar.aadharCardPhoto: PageConstVar.aadharCardPhoto,
      PageConstVar.frontSide: PageConstVar.frontSide,
      PageConstVar.backSide: PageConstVar.backSide,
      PageConstVar.panCardPhoto: PageConstVar.panCardPhoto,
      PageConstVar.panCardNumber: PageConstVar.panCardNumber,
      PageConstVar.addFile: PageConstVar.addFile,
      PageConstVar.submit: PageConstVar.submit,

      ///TODO Manage bank Page:English

      PageConstVar.manageBank: PageConstVar.manageBank,
      PageConstVar.primary: PageConstVar.primary,
      PageConstVar.viewAccountDetails: PageConstVar.viewAccountDetails,
      PageConstVar.accountHolderName: PageConstVar.accountHolderName,
      PageConstVar.accountNumber: PageConstVar.accountNumber,
      PageConstVar.accountType: PageConstVar.accountType,
      PageConstVar.iFSCCode: PageConstVar.iFSCCode,
      PageConstVar.branch: PageConstVar.branch,
      PageConstVar.addBank: PageConstVar.addBank,
      PageConstVar.updateBank: PageConstVar.updateBank,
      PageConstVar.updateBankDetail: PageConstVar.updateBankDetail,
      PageConstVar.addBankDetail: PageConstVar.addBankDetail,
      PageConstVar.chooseAction: PageConstVar.chooseAction,
      PageConstVar.edit: PageConstVar.edit,
      PageConstVar.setAsPrimary: PageConstVar.setAsPrimary,
      PageConstVar.remove: PageConstVar.remove,

      ///TODO Add bank Page:English

      PageConstVar.bankName: PageConstVar.bankName,
      PageConstVar.bankBranchName: PageConstVar.bankBranchName,
      PageConstVar.reAccountNumber: PageConstVar.reAccountNumber,
      PageConstVar.customerName: PageConstVar.customerName,
      PageConstVar.current: PageConstVar.current,
      PageConstVar.saving: PageConstVar.saving,

      ///TODO Dialog:English

      C.textLogOutDialogContent: C.textLogOutDialogContent,
      C.textCancel: C.textCancel,
      C.textSelectImageTitle: C.textSelectImageTitle,
      C.textImageDialogContent: C.textImageDialogContent,
      C.textCamera: C.textCamera,
      C.textGallery: C.textGallery,
      C.textDeleteDialogTitle: C.textDeleteDialogTitle,
      C.textDeleteDialogContent: C.textDeleteDialogContent,
      C.textExitDialogTitle: C.textExitDialogTitle,
      C.textExitDialogContent: C.textExitDialogContent,

      ///TODO Genealogy Page:English

      PageConstVar.totalBusinessValue: PageConstVar.totalBusinessValue,
      PageConstVar.levelBelow: PageConstVar.levelBelow,
      PageConstVar.goBack: PageConstVar.goBack,
      PageConstVar.paidUsers: PageConstVar.paidUsers,
      PageConstVar.unpaidUsers: PageConstVar.unpaidUsers,

      ///TODO Wallet Page:English

      PageConstVar.totalIncome: PageConstVar.totalIncome,
      PageConstVar.totalWithdrawal: PageConstVar.totalWithdrawal,
      PageConstVar.availableWithdrawBlance: PageConstVar.availableWithdrawBlance,
      PageConstVar.withdrawalAmount: PageConstVar.withdrawalAmount,
      PageConstVar.withdrawal: PageConstVar.withdrawal,
      PageConstVar.enterAmount: PageConstVar.enterAmount,
      PageConstVar.withdrawNow: PageConstVar.withdrawNow,
      PageConstVar.history: PageConstVar.history,
      PageConstVar.creditOn: PageConstVar.creditOn,
      PageConstVar.depositOn: PageConstVar.depositOn,
      PageConstVar.maximumCommission: PageConstVar.maximumCommission,

      ///TODO Achievements Page:English

      PageConstVar.contactSupport: PageConstVar.contactSupport,
      PageConstVar.followSocialLinks: PageConstVar.followSocialLinks,



    },

    "hi_IN": {

      ///TODO Language Bottom Sheet:English

      PageConstVar.changeLanguage: 'भाषा बदलें',
      PageConstVar.english: 'अंग्रेज़ी',
      PageConstVar.hindi: 'हिंदी',
      PageConstVar.saveLanguage: 'भाषा सहेजें',
      PageConstVar.back: 'पीछे',


      ///TODO Page_SIGN_IN:Hindi

      PageConstVar.logIn: "साइन इन करें",
      PageConstVar.signInUpToEnjoyTheBestManagingExperience: "सर्वोत्तम प्रबंधन अनुभव का आनंद लेने के लिए साइन-अप करें",
      PageConstVar.emailPhone: "फ़ोन नंबर",
      PageConstVar.password: "पासवर्ड",
      PageConstVar.rememberMe: "मुझे याद करो",
      PageConstVar.forgotPassword: "पासवर्ड भूल गए",
      PageConstVar.registeredNow: "अभी पंजीकृत",
      PageConstVar.dontHaveAnAccount: "कोई खाता नहीं है",

      ///TODO Registered:Hindi

      PageConstVar.registered: 'दर्ज कराई',
      PageConstVar.referralCodeOrPhone: 'रेफरल कोड या फ़ोन',
      PageConstVar.referralCode: 'रेफरल कोड',
      PageConstVar.verify: 'सत्यापित करें',

      ///TODO Verify Registered:Hindi

      PageConstVar.verifyRegistered: 'पंजीकृत सत्यापित करें',
      PageConstVar.youAreRegisteringANewMemberUnder: 'आप इसके अंतर्गत एक नये सदस्य का पंजीकरण कर रहे हैं',
      PageConstVar.referenceCode: 'संदर्भ कोड',
      PageConstVar.name: 'नाम',
      PageConstVar.mobile: 'गतिमान',
      PageConstVar.pleaseSelectWhichWayDoYouWantToGo: 'कृपया चुनें कि आप किस रास्ते पर जाना चाहते हैं?',
      PageConstVar.left: 'बाएं',
      PageConstVar.right: 'दाएँ',
      PageConstVar.proceed: 'आगे बढ़ना',

      ///TODO Personal Details:Hindi

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

      ///TODO Validation:Hindi

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
      PageConstVar.pleaseEnterPanCardNumber: 'कृपया पैन कार्ड नंबर दर्ज करें',
      PageConstVar.pleaseEnterValidPanCardNumber: 'कृपया वैध पैन कार्ड नंबर दर्ज करें',
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


      PageConstVar.pleaseEnterBankName: 'कृपया बैंक का नाम दर्ज करें',
      PageConstVar.pleaseEnterBankBranchName: 'कृपया बैंक शाखा का नाम दर्ज करें',
      PageConstVar.pleaseEnterAccountNumber: 'कृपया खाता संख्या दर्ज करें',
      PageConstVar.pleaseEnterReAccountNumber: 'कृपया पुनः खाता संख्या दर्ज करें',
      PageConstVar.accountNumberNotMatch: 'खाता संख्या मेल नहीं खा रही है',
      PageConstVar.pleaseEnterCustomerName: 'कृपया ग्राहक का नाम दर्ज करें',
      PageConstVar.pleaseEnterIFSCCode: 'कृपया आईएफएससी कोड दर्ज करें',
      PageConstVar.pleaseEnterValidIFSCCode: 'कृपया वैध आईएफएससी कोड दर्ज करें',

      ///TODO Forgot Your Password:Hindi

      PageConstVar.forgotYourPassword: 'अपना पासवर्ड भूल गए हैं',
      PageConstVar.pleaseEnterYourEmailPhoneNumberToResetThePassword: 'पासवर्ड रीसेट करने के लिए कृपया अपना फोन नंबर दर्ज करें',

      ///TODO OTP verification:Hindi

      PageConstVar.otpVerification: 'ओ.टी.पी  सत्यापन',
      PageConstVar.enterTheVerificationCodeWeJustSendToYourPhoneNumber: 'वह सत्यापन कोड दर्ज करें जो हमने अभी आपके फ़ोन नंबर पर भेजा है',
      PageConstVar.verificationCode: 'सत्यापन कोड',
      PageConstVar.resend: 'पुनः भेजें',
      PageConstVar.resendOTP: 'ओटीपी पुनः भेजें',
      PageConstVar.sec: 'सेकंड',
      PageConstVar.sendOTP: 'ओ.टी.पी भेजें',
      PageConstVar.didntReceiveCode: 'कोड प्राप्त नहीं हुआ?',

      ///TODO OTP verification:Hindi

      PageConstVar.setNewPassword: 'नया पासवर्ड सेट करें',
      PageConstVar.oldPassword: 'पुराना पासवर्ड',
      PageConstVar.newPassword: 'नया पासवर्ड',
      PageConstVar.update: 'अद्यतन',

      ///TODO Success:Hindi

      PageConstVar.success: 'सफलता',
      PageConstVar.yourPasswordHasBeenSuccessfullyReset: 'आपका पासवर्ड सफलतापूर्वक रीसेट कर दिया गया है.',

      ///TODO Bottom Bar:Hindi

      PageConstVar.home: 'घर',
      PageConstVar.profile: 'प्रोफ़ाइल',
      PageConstVar.genealogy: 'वंशावली',
      PageConstVar.wallet: 'बटुआ',
      PageConstVar.achievements: 'उपलब्धियों',

      ///TODO Home Page:Hindi

      PageConstVar.welcome: 'स्वागत',
      PageConstVar.yourProfileProgress: 'आपकी प्रोफ़ाइल प्रगति कर रही है',
      PageConstVar.packages: 'संकुल',
      PageConstVar.purchasePackages: 'पैकेज खरीदें',
      PageConstVar.nodeCount: 'नोड गिनती',
      PageConstVar.leftBv: 'बाएं बी.वी',
      PageConstVar.rightBv: 'दाएँ बी.वी',
      PageConstVar.commission: 'आयोग',
      PageConstVar.yourSales: 'आपकी बिक्री',
      PageConstVar.walletBalance: 'बटुआ शेष',
      PageConstVar.withdrawalBalance: 'निकासी शेष',
      PageConstVar.upgrade: 'उन्नत',
      PageConstVar.purchased: 'खरीदी',
      PageConstVar.purchaseNow: 'अब खरीदे',
      PageConstVar.upgradeNow: 'अभी अपग्रेड करें',
      PageConstVar.alreadyPurchased: 'पहले से ही खरीदा',
      PageConstVar.iAccept: 'मुझे स्वीकार है',
      PageConstVar.termsAndConditions: 'नियम एवं शर्तें',

      ///TODO Profile Page:Hindi

      PageConstVar.referredBy: 'द्वारा उल्लिखित',
      PageConstVar.message: 'संदेश',
      PageConstVar.kycApplication: 'केवाईसी आवेदन',
      PageConstVar.accountSetting: 'खाता सेटिंग',
      PageConstVar.editProfile: 'प्रोफ़ाइल संपादित करें',
      PageConstVar.changePassword: 'पासवर्ड बदलें',
      PageConstVar.manageBankDetail: 'बैंक विवरण प्रबंधित करें',
      PageConstVar.referralAFriends: 'मित्रों को रेफर करें',
      PageConstVar.waitForResponse: 'प्रतिक्रिया की प्रतीक्षा करें',
      PageConstVar.logOut: 'लॉग आउट',

      ///TODO KYC Application Page:English

      PageConstVar.personalInformation: 'व्यक्तिगत जानकारी',
      PageConstVar.profilePhoto: 'प्रोफ़ाइल फोटो',
      PageConstVar.aadharCardDetails: 'आधार कार्ड विवरण',
      PageConstVar.panCardDetails: 'पैन काड की जानकारीयां',
      PageConstVar.userId: 'उपयोगकर्ता पहचान',
      PageConstVar.uploadProfilePicture: 'अपना प्रोफ़ाइल चित्र अपलोड करें',
      PageConstVar.aadharCardPhoto: 'आधार कार्ड फोटो',
      PageConstVar.frontSide: 'सामने की ओर',
      PageConstVar.backSide: 'पीछे की ओर',
      PageConstVar.panCardPhoto: 'पैन कार्ड फोटो',
      PageConstVar.panCardNumber: 'पैन कार्ड नंबर',
      PageConstVar.addFile: 'फ़ाइल जोड़ेंं',
      PageConstVar.submit: 'जमा करें',

      ///TODO Manage bank Page:Hindi

      PageConstVar.manageBank: 'बैंक का प्रबंधन करें',
      PageConstVar.primary: 'प्राथमिक',
      PageConstVar.viewAccountDetails: 'खाता विवरण देखें',
      PageConstVar.accountHolderName: 'खाता धारक का नाम',
      PageConstVar.accountNumber: 'खाता संख्या',
      PageConstVar.accountType: 'खाते का प्रकार',
      PageConstVar.iFSCCode: 'आईएफएससी कोड',
      PageConstVar.branch: 'शाखा',
      PageConstVar.addBank: 'बैंक जोड़ें',
      PageConstVar.updateBank: 'बैंक अद्यतन करेंं',
      PageConstVar.updateBankDetail: 'बैंक विवरण अपडेट करें',
      PageConstVar.addBankDetail: 'बैंक विवरण जोड़ें',
      PageConstVar.chooseAction: 'कार्रवाई का चयन करें',
      PageConstVar.edit: 'संपादन करें',
      PageConstVar.setAsPrimary: 'प्राथमिक के रूप में सेट करें',
      PageConstVar.remove: 'हटाएँ',

      ///TODO Add bank Page:Hindi

      PageConstVar.bankName: 'बैंक का नाम',
      PageConstVar.bankBranchName: 'बैंक शाखा का नाम',
      PageConstVar.reAccountNumber: 'पुन: खाता संख्या',
      PageConstVar.customerName: 'ग्राहक का नाम',
      PageConstVar.current: 'वर्तमान',
      PageConstVar.saving: 'बचत',

      ///TODO Dialog:Hindi

      C.textLogOutDialogContent: 'क्या आप लॉग आउट करना चाहते हैं?',
      C.textCancel: 'रद्द करें',
      C.textSelectImageTitle: 'छवि चुने',
      C.textImageDialogContent: 'नीचे दिए गए विकल्प से छवि चुनें',
      C.textCamera: 'कैमरा',
      C.textGallery: 'गैलरी',
      C.textDeleteDialogTitle: 'हटाएँ',
      C.textDeleteDialogContent: 'क्या आप आश्वस्त है कि आपको डिलीट करना है?',
      C.textExitDialogTitle: 'बाहर निकले',
      C.textExitDialogContent: 'क्या आप इस एप्लिकेशन से बाहर निकलना चाहते हैं?',

      ///TODO Genealogy Page:Hindi

      PageConstVar.totalBusinessValue: 'कुल व्यवसाय मूल्य',
      PageConstVar.levelBelow: 'नीचे का स्तर',
      PageConstVar.goBack: 'वापस जाओ',
      PageConstVar.paidUsers: 'भुगतान किए गए उपयोगकर्ता',
      PageConstVar.unpaidUsers: 'अवैतनिक उपयोगकर्ता',

      ///TODO Wallet Page:Hindi

      PageConstVar.totalIncome: 'कुल आय',
      PageConstVar.totalWithdrawal: 'कुल निकासी',
      PageConstVar.availableWithdrawBlance: 'उपलब्ध निकासी शेष',
      PageConstVar.withdrawalAmount: 'निकाली गयी राशि',
      PageConstVar.withdrawal: 'निकासी',
      PageConstVar.enterAmount: 'राशि डालें',
      PageConstVar.withdrawNow: 'अभी वापस ले लो',
      PageConstVar.history: 'इतिहास',
      PageConstVar.creditOn: 'क्रेडिट',
      PageConstVar.depositOn: 'जमा करें',
      PageConstVar.maximumCommission: 'अधिकतम कमीशन',

      ///TODO Achievements Page:Hindi

      PageConstVar.contactSupport: 'समर्थन से संपर्क करें',
      PageConstVar.followSocialLinks: 'सामाजिक लिंक का पालन करें',

    },
  };

}