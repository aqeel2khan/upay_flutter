import 'dart:async';


import 'package:flutter/material.dart';
import 'package:upayment_flutter_ws/model/addCard/AddCardsResponse.dart';
import 'package:upayment_flutter_ws/model/createPayment/CreatePaymentResponse.dart';
import 'package:upayment_flutter_ws/model/createToken/CreateTokenResponse.dart';
import 'package:upayment_flutter_ws/model/getPaymentButton/GetPaymentButtonResponse.dart';
import 'package:upayment_flutter_ws/model/multiDelete/MultiRefundDeleteResponse.dart';
import 'package:upayment_flutter_ws/model/multivendor/MultiVandorRefundResponse.dart';
import 'package:upayment_flutter_ws/model/postSingleRefund/SingleRefundPost.dart';
import 'package:upayment_flutter_ws/model/postSingleRefund/multiRefundOption/RefundPayloadOption.dart';
import 'package:upayment_flutter_ws/model/retrieveCard/RetrieveCardResponse.dart';
import 'package:upayment_flutter_ws/model/singleDelete/SingleRefundDeleteResponse.dart';
import 'package:upayment_flutter_ws/model/singleRefund/SingleRefundResponse.dart';
import 'package:upayment_flutter_ws/repository/user_repository.dart';

import '../ChargeWebview.dart';
import '../di/service_locator.dart';
import '../model/ResponsePayment/ResponsePaymentData.dart';
import '../model/addCard/Post/RequestAddCardData.dart';
import '../model/postAllPayment/PostAPaymentRequest.dart';
import '../model/postMultiRefund/MultiRefundRequestData.dart';
import '../model/postMultiRefund/RefundPayloadRequest.dart';
import '../model/postSingleRefund/multiRefundOption/MultiRefundOptionData.dart';
import '../model/singleRefund/CommonModel.dart';
import '../model/singleRefund/RefundPayload.dart';
import 'package:shared_preferences/shared_preferences.dart';



class AllController{
  // --------------- Repository -------------
  final userRepository = getIt.get<UserRepository>();

  // -------------- Textfield Controller ---------------
  final mobileController = TextEditingController();

  // -------------- Methods ---------------
  late GetPaymentButtonResponse? getPaymentButtonResponse;
  late CreateTokenResponse? createTokenResponse;
  late CreatePaymentResponse? createPaymentResponse;
  late AddCardsResponse? addCardsResponse;
  late RetrieveCardResponse? retrieveCardResponse;
  late SingleRefundResponse? singleRefundResponse;
  late MultiVandorRefundResponse? multiVandorRefundResponse;
  late SingleRefundDeleteResponse? singleRefundDeleteResponse;
  late MultiRefundDeleteResponse? multiRefundDeleteResponse;
  final List<RefundPayloadRequest>? ralePayloadToApi = [];



// Countries List
  Future getPaymentButton(BuildContext context,String token) async {
    getPaymentButtonResponse = await userRepository.getPaymentButton(token);
    if(getPaymentButtonResponse!=null){
      if(getPaymentButtonResponse?.status=="SUCCESS"){

        /* showDialog(context: context, builder: (context) {
          return   AlertDialogExample(title:"Confirmation",content:countriesResponse!.status.toString(),okPressed: (){
            Navigator.of(context).pop();
          },);});*/
      }
    }
  }

  Future createToken(BuildContext context,String token,Map<String, dynamic> body) async {
    createTokenResponse = await userRepository.createToken(body);
    if(createTokenResponse!=null){
      if(createTokenResponse?.status=="SUCCESS"){

        /* showDialog(context: context, builder: (context) {
          return   AlertDialogExample(title:"Confirmation",content:countriesResponse!.status.toString(),okPressed: (){
            Navigator.of(context).pop();
          },);});*/
      }
    }
  }

  Future createPayment(BuildContext context,String token, PostAPaymentRequest paymentData2,void Function(ResponsePaymentData) onSuccessCallback) async {
    //Calculator().getTimeStampSF(context);
   // get time stamp  from preference if exist then pass in customer unique token else call get token api after success
    // store in preference then call create payment

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? timeStamp = prefs.getString('timeStamp');

    if(timeStamp==null || timeStamp.isEmpty){

      String? timeSave= DateTime.now().millisecondsSinceEpoch.toString();
      Map<String, dynamic> body = {
        "customerUniqueToken": timeSave,
      };
      createTokenResponse = await userRepository.createToken(body);
      if(createTokenResponse!=null){
        if(createTokenResponse?.status==true){
         int? token= createTokenResponse?.data?.customerUniqueToken;
          setTimeStampSF(token.toString() );

         paymentData2.tokens?.customerUniqueToken=token;
          
          callPaymentAPIInternally(paymentData2,onSuccessCallback,context);

        }
      }
    }else{
      paymentData2.tokens?.customerUniqueToken=int. parse(timeStamp);

      callPaymentAPIInternally(paymentData2,onSuccessCallback,context);

    }
  }
  Future addCard(BuildContext context,String token,RequestAddCardData requestAddCardData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
   String? timeStamp = prefs.getString('timeStamp');
   if(timeStamp==null || timeStamp.isEmpty){
    String? timeSave= DateTime.now().millisecondsSinceEpoch.toString();
     Map<String, dynamic> body = {
       "customerUniqueToken": timeSave,
     };

    createTokenResponse = await userRepository.createToken(body);
    if(createTokenResponse!=null){
      if(createTokenResponse?.status=="true"){

        setTimeStampSF(createTokenResponse?.data?.customerUniqueToken as String);

        addCardsResponse = await userRepository.addCard(createTokenResponse?.data?.customerUniqueToken! as String,requestAddCardData);
        if(addCardsResponse!=null){
          if(addCardsResponse?.status=="SUCCESS"){

          }
        }

      }
    }
   }else{

     addCardsResponse = await userRepository.addCard(timeStamp!,requestAddCardData);
     if(addCardsResponse!=null){
       if(addCardsResponse?.status=="SUCCESS"){


       }
     }
   }

    addCardsResponse = await userRepository.addCard(timeStamp!,requestAddCardData);
    if(addCardsResponse!=null){
      if(addCardsResponse?.status=="true"){

      }
    }
  }

  Future retrieveCard(BuildContext context,String token,Map<String, dynamic> body) async {
    retrieveCardResponse = await userRepository.retrieveCard(token,body);
    if(retrieveCardResponse!=null){
      if(retrieveCardResponse?.status=="true"){

      }
    }
  }

  Future<CommonModel> singleRefund(BuildContext context,SingleRefundPost body,MultiRefundOptionData multiRefundOption) async {
    singleRefundResponse = await userRepository.singleRefund(body);
     MultiVandorRefundResponse? model2 ;
    final model1 = await singleRefundResponse!;
    if(singleRefundResponse!=null){
      if(singleRefundResponse?.status == true){
       bool? isMultiRefund =   singleRefundResponse?.data?.isMultivendorRefund;
        if(isMultiRefund!=null && isMultiRefund){
          List<RefundPayload>? refundPayload=   singleRefundResponse?.data?.refundPayload;
          if(refundPayload!=null && refundPayload.isNotEmpty){

            for(int i=0; i<refundPayload.length; i++){

              RefundPayload refundData=     refundPayload[i] ;
              String? ibanNo=    refundData.ibanNumber;
           int pos=   filterIban(ibanNo,multiRefundOption);
              RefundPayloadOption? optionCustomer=    multiRefundOption.refundPayloadOption?[pos] ;
           int? amountCustomer=   optionCustomer?.amountToRefund ;
              refundData.amountToRefund =  amountCustomer ;
            }
            // call multiRefundAPI


            for(int i=0; i<refundPayload.length; i++) {
              RefundPayload refundData = refundPayload[i];
              // double doubleValue = double.parse(refundData.refundedAmount!);
              // int intValue = doubleValue.toInt();
              ralePayloadToApi?.add(RefundPayloadRequest(
                refundRequestId: refundData.refundRequestId.toString(),
                ibanNumber: refundData.ibanNumber.toString(),
                totalPaid: refundData.totalPaid.toString(),
                refundedAmount: refundData.refundedAmount,
                remainingLimit: refundData.remainingLimit,
                amountToRefund: (refundData.amountToRefund!),
                merchantType: refundData.merchantType.toString(),
              ));

            }
            MultiRefundRequestData multiRefundRequest = MultiRefundRequestData(
                orderId : body.orderId,
                refundPayload: ralePayloadToApi,
                receiptId : multiRefundOption.receiptId,
                customerFirstName : body.customerFirstName,
               customerEmail :body.customerEmail,
               customerMobileNumber : body.customerMobileNumber,
               reference : body.reference,
                notifyUrl :body.notifyUrl
            );

            // call multiRefund api with model : multiRefundRequest

            // multiVandorRefundResponse = await userRepository.multiVendorRefund(body);
            multiVendorRefund(multiRefundRequest).then((value) async {

              multiVandorRefundResponse = value;
               model2 = await multiVandorRefundResponse;

           //   return multiVandorRefundResponse;
              return CommonModel(model1, model2);

            });


          }
        }else{
          return CommonModel(model1, model2);

          //   return singleRefundResponse;

          // callback for Single Refund
        }
      }else{

      }
    }

    return CommonModel(model1, model2);

  }

  Future<MultiVandorRefundResponse?> multiVendorRefund(MultiRefundRequestData body) async {
    multiVandorRefundResponse = await userRepository.multiVendorRefund(body);
    if(multiVandorRefundResponse!=null){
      if(multiVandorRefundResponse?.status==true){

       String? mesage= multiVandorRefundResponse?.message;
       if(mesage!=null){

         return multiVandorRefundResponse;
         // send call back to Main
       }
      }
    }
  }

  Future singleRefundDelete(BuildContext context,String token,Map<String, dynamic> body) async {
    singleRefundDeleteResponse = await userRepository.singleRefundDelete(token,body);
    if(singleRefundDeleteResponse!=null){
      if(singleRefundDeleteResponse?.status=="true"){


      }
    }
  }

  Future multiVendorRefundDelete(BuildContext context,String token,Map<String, dynamic> body) async {
    multiRefundDeleteResponse = await userRepository.multiVendorRefundDelete(token,body);
    if(multiRefundDeleteResponse!=null){
      if(multiRefundDeleteResponse?.status=="true"){

        /* showDialog(context: context, builder: (context) {
          return   AlertDialogExample(title:"Confirmation",content:countriesResponse!.status.toString(),okPressed: (){
            Navigator.of(context).pop();
          },);});*/
      }
    }
  }

   setTimeStampSF(String timeSet) async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('timeStamp',timeSet);
  }

  int filterIban(String? ibanNo, MultiRefundOptionData multiRefundOption) {

    List<RefundPayloadOption>? list =multiRefundOption?.refundPayloadOption;
    for (int i= 0 ; i< list!.length; i++) {

      RefundPayloadOption option=  list[i];
     String? ibanCustomer= option.ibanNumber ;
     if(ibanCustomer == ibanNo){

       return i;

     }
    }

    return 0;
  }

  Future  callPaymentAPIInternally(PostAPaymentRequest paymentData2, void Function(ResponsePaymentData) onSuccessCallback, BuildContext context) async{

    createPaymentResponse = await userRepository.createPayment(paymentData2);
    if(createPaymentResponse!=null){
      if(createPaymentResponse?.status==true){
       String? urlSend= createPaymentResponse?.data?.link;
        _navigateAndDisplaySelection(context,urlSend!,onSuccessCallback);
      // onSuccessCallback(createPaymentResponse!);

      }
    }
  }

  Future<void> _navigateAndDisplaySelection(BuildContext context,String url,void Function(ResponsePaymentData) onSuccessCallback) async {
  // String url2= "https://apiv2api.upayments.com/get-pay-by-samsung?order_id=p8PS2GtfrGodZxD74RNzby9cDfsEP399&track_id=2tab587HaYmxfEf5kJRo0HWNSvOMuON3&transaction_id=2328669&ref_id=15269530&currency=KWD&amount=40.000&success_url=https://upayments.com/en/&failure_url=https://developers.upayments.com/";
    final result = await  Navigator.of(context as BuildContext).push(MaterialPageRoute(
        builder: (BuildContext context) =>
            ChargeWebview(url: url)));

    if(result!=null){
      onSuccessCallback(result!);
    }

  }
}