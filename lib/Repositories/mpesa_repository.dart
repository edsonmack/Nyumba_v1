import 'package:flutter/foundation.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';

const kShortCode = '174379';

class MpesaRepository {
  Future<dynamic> lipaNaMpesa(
      {required double amount, required String phoneNumber}) async {
    final dynamic transactionInitialisation;
    //Wrap it with a try-catch
    try {
      //Run it
      transactionInitialisation =
          await MpesaFlutterPlugin.initializeMpesaSTKPush(
        businessShortCode:
            kShortCode, //use your store number if the transaction type is CustomerBuyGoodsOnline
        transactionType: TransactionType
            .CustomerPayBillOnline, //or CustomerBuyGoodsOnline for till numbers
        amount: amount,
        partyA: phoneNumber,
        partyB: kShortCode,
        callBackURL: Uri(
          scheme: 'https',
          host: 'mpesa-requestbin.herokuapp.com',
          path: '/1p2n4cp1',
        ),
        accountReference: 'Nyumba',
        phoneNumber: phoneNumber,
        baseUri: Uri(scheme: 'https', host: 'sandbox.safaricom.co.ke'),
        transactionDesc: 'purchase',
        passKey:
            'bfb279f9aa9bdbcf158e97dd71a467cd2e0c893059b10f78e6b72ada1ed2c919',
      );

      if (kDebugMode) {
        print('TRANSACTION RESULT: $transactionInitialisation');
      }

      return transactionInitialisation;
      // error
    } catch (e) {
      if (kDebugMode) {
        print('CAUGHT EXCEPTION: $e');
      }
    }
  }
}
