
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upayment_flutter_ws/model/addCard/AddCardsResponse.dart';
import 'package:upayment_flutter_ws/model/createPayment/CreatePaymentResponse.dart';
import 'package:upayment_flutter_ws/model/createToken/CreateTokenResponse.dart';
import 'package:upayment_flutter_ws/model/getPaymentButton/GetPaymentButtonResponse.dart';
import 'package:upayment_flutter_ws/model/multiDelete/MultiRefundDeleteResponse.dart';
import 'package:upayment_flutter_ws/model/multivendor/MultiVandorRefundResponse.dart';
import 'package:upayment_flutter_ws/model/retrieveCard/RetrieveCardResponse.dart';
import 'package:upayment_flutter_ws/model/singleDelete/SingleRefundDeleteResponse.dart';
import 'package:upayment_flutter_ws/model/singleRefund/SingleRefundResponse.dart';
import '../model/addCard/Post/RequestAddCardData.dart';
import '../model/postAllPayment/PostAPaymentRequest.dart';
import '../model/postMultiRefund/MultiRefundRequestData.dart';
import '../model/postSingleRefund/SingleRefundPost.dart';
import '../network/api/user/user_api.dart';
import '../network/dio_exception.dart';

class UserRepository{
 final UserApi userApi;
 UserRepository(this.userApi);

 Future<GetPaymentButtonResponse> getPaymentButton(String token) async {
  try {
   final response = await userApi.getPaymentButtonApi(token);
   return GetPaymentButtonResponse.fromJson(response.data);
  } on DioError catch (e) {
   final errorMessage = DioExceptions.fromDioError(e).toString();
   return GetPaymentButtonResponse.fromJson(e.response?.data);

  }
 }

 Future<CreateTokenResponse> createToken(Map<String, dynamic> body) async {
  try {
   final response = await userApi.createTokenApi(body);
   return CreateTokenResponse.fromJson(response.data);
  } on DioError catch (e) {
   final errorMessage = DioExceptions.fromDioError(e).toString();
   return CreateTokenResponse.fromJson(e.response?.data);

  }
 }

 Future<CreatePaymentResponse> createPayment( PostAPaymentRequest paymentData2) async {
  try {
   final response = await userApi.createPaymentApi(paymentData2);
   return CreatePaymentResponse.fromJson(response.data);
  } on DioError catch (e) {
   final errorMessage = DioExceptions.fromDioError(e).toString();
   return CreatePaymentResponse.fromJson(e.response?.data);

  }
 }

 Future<AddCardsResponse> addCard(String token,RequestAddCardData body) async {
  try {
   final response = await userApi.addCardApi(token,body);
   return AddCardsResponse.fromJson(response.data);
  } on DioError catch (e) {
   final errorMessage = DioExceptions.fromDioError(e).toString();
   return AddCardsResponse.fromJson(e.response?.data);

  }
 }

 Future<RetrieveCardResponse> retrieveCard(String token,Map<String, dynamic> body) async {
  try {
   final response = await userApi.retrieveCardApi(token,body);
   return RetrieveCardResponse.fromJson(response.data);
  } on DioError catch (e) {
   final errorMessage = DioExceptions.fromDioError(e).toString();
   return RetrieveCardResponse.fromJson(e.response?.data);

  }
 }

 Future<SingleRefundResponse> singleRefund(SingleRefundPost body) async {
  try {
   final response = await userApi.singleRefundApi(body);
   return SingleRefundResponse.fromJson(response.data);
  } on DioError catch (e) {
   final errorMessage = DioExceptions.fromDioError(e).toString();
   return SingleRefundResponse.fromJson(e.response?.data);

  }
 }

 Future<MultiVandorRefundResponse> multiVendorRefund(MultiRefundRequestData body) async {
  try {
   final response = await userApi.multiVendorRefundApi(body);
   return MultiVandorRefundResponse.fromJson(response.data);
  } on DioError catch (e) {
   final errorMessage = DioExceptions.fromDioError(e).toString();
   return MultiVandorRefundResponse.fromJson(e.response?.data);

  }
 }

 Future<SingleRefundDeleteResponse> singleRefundDelete(String token,Map<String, dynamic> body) async {
  try {
   final response = await userApi.singleRefundDeleteApi(token,body);
   return SingleRefundDeleteResponse.fromJson(response.data);
  } on DioError catch (e) {
   final errorMessage = DioExceptions.fromDioError(e).toString();
   return SingleRefundDeleteResponse.fromJson(e.response?.data);

  }
 }

 Future<MultiRefundDeleteResponse> multiVendorRefundDelete(String token,Map<String, dynamic> body) async {
  try {
   final response = await userApi.multiVendorRefundDeleteApi(token,body);
   return MultiRefundDeleteResponse.fromJson(response.data);
  } on DioError catch (e) {
   final errorMessage = DioExceptions.fromDioError(e).toString();
   return MultiRefundDeleteResponse.fromJson(e.response?.data);

  }
 }

}