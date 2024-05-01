import 'package:flutter/foundation.dart';
import 'package:kalam_news_publication/app/common/methods/knp_methods.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class KNPRazorpayMethods{

  static String razorpayKeyName = "rzp_test_sBIiiURrNWQRTc";
  static String razorpayKeyPassword = "UeGbEmzqYSb3tBjT7Mcphb2V";

  static Future<void> clickOnMakePaymentButton({
    required String purchaseAmount,
    required String walletAmount,
    required String traTypeValue,
  }) async {
    Razorpay razorpay = Razorpay();
    try{
      var options = {
        'key': razorpayKeyName,
        'amount': 1 * 100,
        'name': 'Dollop',
        'description': 'Testing ',
        'timeout': 60 * 2,
        // 'prefill': {'contact': userMobile, 'email': userEmail},
      };
      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentErrorResponse);
      razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccessResponse);
      razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWalletSelected);
      razorpay.open(options);
    }catch(e){
      if (kDebugMode) {
        print('Razorpay:::  ERROR:::: $e');
      }
      KNPMethods.showSnackBar(message: 'Payment Failed');
    }
  }

  static _handlePaymentErrorResponse(PaymentSuccessResponse response) {
    if (kDebugMode) {
      print('Payment Failed');
    }
    KNPMethods.showSnackBar(message: 'Payment Failed');
  }

  static _handlePaymentSuccessResponse(PaymentSuccessResponse response) async {
    if (kDebugMode) {
      print('Payment Successful::::::  ');
    }
    KNPMethods.showSnackBar(message: 'Payment Transection Successful');
  }

  static _handleExternalWalletSelected(ExternalWalletResponse response) {
    if (kDebugMode) {
      print('External Wallet Selected');
    }
    KNPMethods.showSnackBar(message: 'External Wallet Selected');
  }

}