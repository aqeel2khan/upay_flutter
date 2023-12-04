class Endpoints {
  Endpoints._();

  // base url
  // static const String baseUrl = "https://preprod-uinterface.upayments.com/api/v1/";

  static const String baseUrl = "https://dev-apiv2api.upayments.com/api/v1/";

  // production
  // static const String baseUrl = "https://apiv2api.upayments.com/api/v1/";



  // receiveTimeout
  static const int receiveTimeout = 15000;
  // connectTimeout
  static const int connectionTimeout = 15000;

  // Identity
  static const String getPaymentButton = baseUrl+'check-payment-button-status';
  static const String createToken = baseUrl+'create-customer-unique-token';
  static const String createPayment = baseUrl+'charge';
  static const String addCard = baseUrl+'create-token-from-card';
  static const String retrieveCard = baseUrl+'retrieve-customer-cards';
  static const String singleRefund = baseUrl+'create-refund';
  static const String multiVendorRefund = baseUrl+'create-multivendor-refund';
  static const String singleRefundDelete = baseUrl+'delete-refund';
  static const String multiVendorRefundDelete = baseUrl+'delete-multivendor-refund';


}
