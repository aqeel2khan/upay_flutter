import 'package:dio/dio.dart';
import '../../../controllers/AppConfig.dart';
import '../../../model/addCard/Post/RequestAddCardData.dart';
import '../../../model/postAllPayment/PostAPaymentRequest.dart';
import '../../../model/postMultiRefund/MultiRefundRequestData.dart';
import '../../../model/postSingleRefund/SingleRefundPost.dart';
import '../../dio_client.dart';
import '../constant/endpoints.dart';



class UserApi {
  final DioClient dioClient;

  UserApi({required this.dioClient});

  //// Payment Button
  Future<Response> getPaymentButtonApi(String token) async {
    try {
      final Response response = await dioClient.get(
        Endpoints.getPaymentButton,
          options: Options(
              headers: {"Authorization": "Bearer $token"})
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
  // Create Token
  Future<Response> createTokenApi(Map<String, dynamic> body) async {
    try {
      String headerKey=AppConfig.apiKey!;

      final Response response = await dioClient.post(
          Endpoints.createToken,
          data: body,
          options: Options(
              headers: {"Authorization": "Bearer $headerKey"})
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
  // Create Payment
  Future<Response> createPaymentApi(PostAPaymentRequest paymentData2) async {
    try {
      String headerKey=AppConfig.apiKey!;
      String header ="aS4OMOvxGd1UDsTgxRBEE1af5BqSaOVDa5eMtch2";
      final Response response = await dioClient.post(
          Endpoints.createPayment,
          data: paymentData2,
          options: Options(
              headers: {"Authorization": "Bearer $headerKey"})
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Add Card
  Future<Response> addCardApi(String token,RequestAddCardData body) async {
    try {
      String headerKey=AppConfig.apiKey!;

      final Response response = await dioClient.post(
          Endpoints.addCard,
          data: body,
          options: Options(
              headers: {"Authorization": "Bearer $headerKey"})
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Retrieve Card
  Future<Response> retrieveCardApi(String token,Map<String, dynamic> body) async {
    try {
      String headerKey=AppConfig.apiKey!;

      final Response response = await dioClient.post(
          Endpoints.retrieveCard,
          data: body,
          options: Options(
              headers: {"Authorization": "Bearer $headerKey"})
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Single Refund
  Future<Response> singleRefundApi(SingleRefundPost body) async {
    try {
      String headerKey=AppConfig.apiKey!;

      final Response response = await dioClient.post(
          Endpoints.singleRefund,
          data: body,
          options: Options(
              headers: {"Authorization": "Bearer $headerKey"})
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Multi Refund
  Future<Response> multiVendorRefundApi(MultiRefundRequestData body) async {
    try {
      String headerKey=AppConfig.apiKey!;
      final Response response = await dioClient.post(
          Endpoints.multiVendorRefund,
          data: body,
          options: Options(
              headers: {"Authorization": "Bearer $headerKey"})
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Single Refund Delete
  Future<Response> singleRefundDeleteApi(String token,Map<String, dynamic> body) async {
    try {
      String headerKey=AppConfig.apiKey!;
      final Response response = await dioClient.post(
          Endpoints.singleRefundDelete,
          data: body,
          options: Options(
              headers: {"Authorization": "Bearer $headerKey"})
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // Multi vendor Refund Delete
  Future<Response> multiVendorRefundDeleteApi(String token,Map<String, dynamic> body) async {
    try {
      String headerKey=AppConfig.apiKey!;

      final Response response = await dioClient.post(
          Endpoints.multiVendorRefundDelete,
          data: body,
          options: Options(
              headers: {"Authorization": "Bearer $headerKey"})
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }


}
