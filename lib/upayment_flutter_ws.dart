library upayment_flutter_ws;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upayment_flutter_ws/model/postAllPayment/PostAPaymentRequest.dart';
import 'ChargeWebview.dart';
import 'controllers/AllController.dart';

import 'package:upayment_flutter_ws/model/singleRefund//RefundPayload.dart';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'di/service_locator.dart';
import 'model/extaMercahant/ExtraMerchantData.dart';


/// A Calculator.
class Calculator {
    String _baseUrl = 'White Level';
    String titleType = 'White Level';
  // String? headerToken="aS4OMOvxGd1UDsTgxRBEE1af5BqSaOVDa5eMtch2";
    String? headerToken = "oxxnDz0ES48qyaT96f8VG6YYyFr0krk2akJI7LH5";

    String? selectedPaymentValue="";
   String? str_customerUniqueToken="";
   String? timeStamp="";
  final tokenController = TextEditingController();
  final createTokenController = TextEditingController();
  final dio = Dio();
   bool _isLoading = false;

     late  final allController ;


   final List<String> paymentMethod = [];
   final List<RefundPayload> ralePayload = [];
    final List<RefundPayload> ralePayloadToApi = [];
    final List<ExtraMerchantData> extraMerchantData = [];

  Calculator(){
    allController = getIt<AllController>();
  }




   Object? result;
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;

   void getPaymentButtonApiCall(String token,BuildContext context) async{
      _isLoading=true;
    await allController.getPaymentButton(context as BuildContext,token);
      if(allController.getPaymentButtonResponse!.status.toString()=="true"){
          _isLoading = false;
      }
      _isLoading=false;
      if(allController.getPaymentButtonResponse!.status.toString()=="true"){
        paymentMethod.clear();
      //  setState(() {
          if(allController.getPaymentButtonResponse!.data!.payButtons!.knet.toString()=="true"){
            paymentMethod.add("knet");
          }
          if(allController.getPaymentButtonResponse!.data!.payButtons!.creditCard.toString()=="true"){
            paymentMethod.add("credit_card");
          }
          if(allController.getPaymentButtonResponse!.data!.payButtons!.samsungPay.toString()=="true"){
            paymentMethod.add("samsung_pay");
          }
          if(allController.getPaymentButtonResponse!.data!.payButtons!.applePay.toString()=="true"){
            paymentMethod.add("apple_pay");
          }
          if(allController.getPaymentButtonResponse!.data!.payButtons!.amex.toString()=="true"){
            paymentMethod.add("amex");
          }
          if(allController.getPaymentButtonResponse!.data!.payButtons!.google_pay.toString()=="true"){
            paymentMethod.add("google_pay");
          }

      //  });

      }

  }

   void createTokenApiCall(String token,String customerUniqueToken,BuildContext context) async{
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setString('timeStamp', customerUniqueToken);
    //  getTimeStampSF();
    // setState(() {
      _isLoading=true;

    // });
    Map<String, dynamic> body = {
      "customerUniqueToken": timeStamp,
    };
    await allController.createToken(context as BuildContext,token,body);
    // setState(() {
      if(allController.createTokenResponse!.status.toString()=="false"){
          _isLoading = false;
      }
      _isLoading=false;
      if(allController.createTokenResponse!.status.toString()=="true"){
        // setState(() {
          str_customerUniqueToken=allController.createTokenResponse!.data!.customerUniqueToken.toString();

          setTimeStampSF(allController.createTokenResponse!.data!.customerUniqueToken.toString());
        // });

      }

    // });
  }

   void createPaymentApiCall(String token,String customerUniqueToken,String paymentMethod, PostAPaymentRequest paymentData2, bool isWhiteLabel,BuildContext context) async{
      _isLoading=true;

      await allController.createPayment(context as BuildContext,token,paymentData2);
      if(allController.createPaymentResponse!.status.toString()=="false"){
          _isLoading = false;
      }
      _isLoading=false;
      if(allController.createPaymentResponse!.status.toString()=="true"){
        //_navigateAndDisplaySelection(context as BuildContext,allController.createPaymentResponse!.data!.link.toString());

      }

  }

   void addCardApiCall(String token,BuildContext context) async{
      _isLoading=true;
    Map<String, dynamic> body = {
      "card": {
        "number": "5123450000000008",
        "expiry": {
          "month": "02",
          "year": "39"
        },
        "securityCode": "100",
        "nameOnCard": "Dharmendra Kakde"
      },
      "customerUniqueToken": timeStamp
    };
    await allController.addCard(context as BuildContext,token,body);
      if(allController.addCardsResponse!.status.toString()=="false"){
          _isLoading = false;
      }
      _isLoading=false;
      if(allController.addCardsResponse!.status.toString()=="true"){


      }
  }

  void retrieveCardApiCall(String token,BuildContext context) async{
      _isLoading=true;
    Map<String, dynamic> body = {
      "customerUniqueToken":timeStamp
    };
    await allController.retrieveCard(context as BuildContext,token,body);

      if(allController.retrieveCardResponse!.status.toString()=="false"){

          _isLoading = false;

      }
      _isLoading=false;
      if(allController.retrieveCardResponse!.status.toString()=="true"){


      }

  }

   void singleRefundApiCall(String token,BuildContext context) async{
      _isLoading=true;
    Map<String, dynamic> body = {
      "customerEmail":"Aqeel2@gmail.com",
      "customerFirstName":"Aqeel2@gmail.com",
      "customerMobileNumber":"69923192",
      "notifyUrl":"https://webhook.site/92eb6888-362b-4874-840f-3fff620f7cf4",
      "orderId":"mv1GZnrG2l1231692959062114432109764e88156aabd6",
      "reference":"323801000139",
      "totalPrice":15.0};
    await allController.singleRefund(context as BuildContext,token,body);
      if(allController.singleRefundResponse!.status.toString()=="false"){
        // setState(() {
          _isLoading = false;
        // });
      }
      _isLoading=false;
      if(allController.singleRefundResponse!.status.toString()=="true"){

      }
  }

   void multiVendorRefundApiCall(String token, List<RefundPayload> ralePayload,BuildContext context) async{
    // setState(() {
      _isLoading=true;

    // });

    for(final a in ralePayload){
      var ibn_no = a.ibanNumber.toString();
      for(final b in extraMerchantData){
        if(ibn_no==b.ibanNumber.toString()){
          ralePayloadToApi.add(RefundPayload(
            refundRequestId: a.refundRequestId.toString(),
            ibanNumber: a.refundRequestId.toString(),
            totalPaid: a.refundRequestId.toString(),
            refundedAmount: b.amount,
            remainingLimit: a.remainingLimit,
            amountToRefund: a.amountToRefund,
            merchantType: a.merchantType.toString(),
          ));
        }
      }
    }
    Map<String, dynamic> body = {
      "orderId": "mv1GZnrG2l1231692959062114432109764e88156aabd6",
      "refundPayload": ralePayloadToApi,
      "receiptId": "NHDBC55214",
      "customerEmail":"Aqeel2@gmail.com",
      "customerFirstName":"Aqeel2@gmail.com",
      "customerMobileNumber":"69923192",
      "reference":"323801000139",
      "notifyUrl": "https://upayments.com"
    };
    await allController.multiVendorRefund(context as BuildContext,token,body);
    // setState(() {
      if(allController.multiVandorRefundResponse!.status.toString()=="false"){
        // setState(() {
          _isLoading = false;
        // });
      }
      _isLoading=false;
      if(allController.multiVandorRefundResponse!.status.toString()=="true"){
        // setState(() {
          //str_customerUniqueToken=allController.addCardsResponse!.data!.customerUniqueToken.toString();
          // showDialog(context: context, builder: (context) {
          //   return   DeleteAlertDialog(title:"Conformation",content:allController.multiVandorRefundResponse!.message.toString(),cancelPressed: (){
          //     Navigator.of(context).pop();
          //   },deletePressed: (){
          //
          //
          //     Navigator.of(context).push(MaterialPageRoute(
          //         builder: (BuildContext context) => MyApp()));
          //   }, buttonName: 'Ok',);});
        // });

      }

    // });
  }

  void singleRefundDeleteApiCall(String token,String orderId,String refundOrderId,BuildContext context) async{
    // setState(() {
      _isLoading=true;

    // });
    Map<String, dynamic> body = {
      "orderId" : orderId,
      "refundOrderId" : refundOrderId
    };
    await allController.singleRefundDelete(context as BuildContext,token,body);
    // setState(() {
      if(allController.singleRefundDeleteResponse!.status.toString()=="false"){
        // setState(() {
          _isLoading = false;
        // });
      }
      _isLoading=false;
      if(allController.singleRefundDeleteResponse!.status.toString()=="true"){
        // setState(() {
          //str_customerUniqueToken=allController.addCardsResponse!.data!.customerUniqueToken.toString();
          // showDialog(context: context, builder: (context) {
          //   return   DeleteAlertDialog(title:"Conformation",content:allController.singleRefundDeleteResponse!.message.toString(),cancelPressed: (){
          //     Navigator.of(context).pop();
          //   },deletePressed: (){
          //
          //
          //     Navigator.of(context).push(MaterialPageRoute(
          //         builder: (BuildContext context) => MyApp()));
          //   }, buttonName: 'Ok',);});
        // });

      }

    // });
  }

  void multiVendorRefundDeleteApiCall(String token,String generatedInvoiceId,String orderId,String refundOrderId,String refundArn,BuildContext context) async{
    // setState(() {
      _isLoading=true;

    // });
    Map<String, dynamic> body = {
      "generatedInvoiceId": generatedInvoiceId,
      "orderId": orderId,
      "refundOrderId": refundOrderId,
      "refundArn": refundArn
    };
    await allController.multiVendorRefundDelete(context as BuildContext,token,body);
    // setState(() {
      if(allController.multiRefundDeleteResponse!.status.toString()=="false"){
        // setState(() {
          _isLoading = false;
        // });
      }
      _isLoading=false;
      if(allController.multiRefundDeleteResponse!.status.toString()=="true"){
        // setState(() {
          //str_customerUniqueToken=allController.addCardsResponse!.data!.customerUniqueToken.toString();
          // showDialog(context: context, builder: (context) {
          //   return   DeleteAlertDialog(title:"Conformation",content:allController.multiRefundDeleteResponse!.message.toString(),cancelPressed: (){
          //     Navigator.of(context).pop();
          //   },deletePressed: (){
          //
          //
          //     Navigator.of(context).push(MaterialPageRoute(
          //         builder: (BuildContext context) => MyApp()));
          //   }, buttonName: 'Ok',);});
        // });

      }

    // });
  }


  setStringValuesSF(String order_id,BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    // setState(() {
      prefs.setString('order_id', order_id);

    // });
  }

   getTimeStampSF(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
      timeStamp = prefs.getString('timeStamp');
    if (timeStamp == null || timeStamp!.isEmpty) {
      String? timeSave= DateTime.now().millisecondsSinceEpoch.toString();
      Map<String, dynamic> body = {
        "customerUniqueToken": timeSave,
      };
      createTokenApiCall(timeStamp!,timeStamp!,context);

      // timeStamp= DateTime.now().millisecondsSinceEpoch.toString();
      // prefs.setString('timeStamp',timeStamp!);

    }

  }

   setTimeStampSF(String timeSet) async{

    SharedPreferences prefs = await SharedPreferences.getInstance();

      prefs.setString('timeStamp',timeSet);

    timeStamp = timeSet;

  }

  //

// Navigator.pop.
//    Future<void> _navigateAndDisplaySelection(BuildContext context,String url) async {
//
//      result = await  Navigator.of(context as BuildContext).push(MaterialPageRoute(
//         builder: (BuildContext context) =>
//             ChargeWebview(url: url)));
//
//     // if (!result) return;
//
//     return;
//
//   }

//


}
