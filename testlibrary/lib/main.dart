
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testlibrary/utils/Colors.dart';
import 'package:testlibrary/widgets/costome_dailog.dart';
import 'package:testlibrary/widgets/custome_text.dart';
import 'package:testlibrary/widgets/delete_alert_dialog.dart';
import 'package:upayment_flutter_ws/upayment_flutter_ws.dart';
import 'package:flutter/cupertino.dart';
import 'package:dropdown_button2/src/dropdown_button2.dart';
import 'package:upayment_flutter_ws/model/postAllPayment/PostAPaymentRequest.dart';
import 'package:upayment_flutter_ws/model/postAllPayment/Products.dart';
import 'package:upayment_flutter_ws/model/postAllPayment/Reference.dart';
import 'package:upayment_flutter_ws/model/postAllPayment/Tokens.dart';
import 'package:upayment_flutter_ws/model/postAllPayment/PaymentGateway.dart';
import 'package:upayment_flutter_ws/model/postAllPayment/Order.dart';
import 'package:upayment_flutter_ws/model/postAllPayment/Customer.dart';
import 'package:upayment_flutter_ws/model/postAllPayment/ExtraMerchantData.dart';
import 'package:upayment_flutter_ws/ChargeWebview.dart';
import 'package:upayment_flutter_ws/di/service_locator.dart';
import 'package:upayment_flutter_ws/controllers/AppConfig.dart';

import 'package:upayment_flutter_ws/model/createPayment/CreatePaymentResponse.dart';
import 'package:upayment_flutter_ws/model/ResponsePayment/ResponsePaymentData.dart';


import 'package:upayment_flutter_ws/model/postSingleRefund/SingleRefundPost.dart';
import 'package:upayment_flutter_ws/model/postSingleRefund/multiRefundOption/RefundPayloadOption.dart';
import 'package:upayment_flutter_ws/model/postSingleRefund/multiRefundOption/MultiRefundOptionData.dart';
import 'package:upayment_flutter_ws/model/multivendor/MultiVandorRefundResponse.dart';
import 'package:upayment_flutter_ws/model/singleRefund/SingleRefundResponse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:upayment_flutter_ws/model/addCard/Post/RequestAddCardData.dart';
import 'package:upayment_flutter_ws/model/addCard/Post/Expiry.dart';
import 'package:upayment_flutter_ws/model/addCard/Post/CardAdd.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  // app.use(
  //     helmet({
  //       contentSecurityPolicy: false,
  //     })
  //);
  runApp(const MyApp());
  setup();

}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'U Payment'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;



  @override
  State<MyHomePage> createState() => _MyHomePageState();


}

class _MyHomePageState extends State<MyHomePage> {
  String _baseUrl = 'White Level';
  String titleType = 'White Level';
  bool isWhiteLabel = false;

  // String? headerToken="aS4OMOvxGd1UDsTgxRBEE1af5BqSaOVDa5eMtch2";
  String? headerToken = "oxxnDz0ES48qyaT96f8VG6YYyFr0krk2akJI7LH5";
  String? selectedPaymentValue="";
  String? str_customerUniqueToken="";
  String? timeStamp="";
  final tokenController = TextEditingController();
  final createTokenController = TextEditingController();
  // final dio = Dio();
  bool _isLoading = false;
  final List<String> paymentMethod = [];
  final List<ExtraMerchantData> extraMerchantData = [];
  @override
  void initState() {
    super.initState();
    AppConfig.apiKey =headerToken!;

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(

                    child: Column(
                      children: [
                        GestureDetector(
                          child: Container(
                            width: double.infinity,
                            color: titleType=="White Level"?klightColor:Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: CustomText("Test Library Cases White Level",size: 16,weight: FontWeight.w500,)),
                            ),
                          ),
                          onTap: (){
                            setState(() {
                              titleType="White Level";
                              headerToken="aS4OMOvxGd1UDsTgxRBEE1af5BqSaOVDa5eMtch2";
                             Calculator(). getPaymentButtonApiCall(headerToken.toString(),context);

                            });
                          },
                        ),
                        SizedBox(height: 20,),
                        GestureDetector(
                          child: Container(
                            width: double.infinity,
                            color: titleType=="Non White Level"?klightColor:Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: CustomText("Test Library Cases Non White Level",size: 15,weight: FontWeight.w500,)),
                            ),

                          ),
                          onTap: (){
                            setState(() {
                              titleType="Non White Level";
                              headerToken="oxxnDz0ES48qyaT96f8VG6YYyFr0krk2akJI7LH5";

                            });
                          },
                        )
                      ],
                    ),
                    width: double.infinity,
                  ),
                  titleType=="White Level"? Container(
                    margin: EdgeInsets.only(left: 25,right: 20,top: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          margin: const EdgeInsets.only(left: 10, top: 10, right:0),
                          child: CustomText("Payment Method",color: Colors.black,size: 14,weight: FontWeight.w300,),
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ):Container(),
                  GestureDetector(
                    onTap: (){
                      getStringValuesSF();
                      callCreatePayment();
                    },
                    child: Container(
                      color: Colors.grey,
                      alignment: Alignment.center,
                      width: double.infinity,
                      margin: const EdgeInsets.only(left: 0, top: 20, right:0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText("Charge API(Buy Single Product)",color: Colors.white,size: 15,weight: FontWeight.w500,),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      getStringValuesSF();
                      //createPaymentApiCall("oxxnDz0ES48qyaT96f8VG6YYyFr0krk2akJI7LH5",timeStamp.toString(),selectedPaymentValue!);
                      // createPaymentApiCall(headerToken.toString(),timeStamp.toString(),selectedPaymentValue!);
                    },
                    child: Container(
                      color: Colors.grey,
                      alignment: Alignment.center,
                      width: double.infinity,
                      margin: const EdgeInsets.only(left: 0, top: 10, right:0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText("Charge API(Buy Multi Product)",color: Colors.white,size: 15,weight: FontWeight.w500,),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      callsingleRefund();
                    },
                    child: Container(
                      color: Colors.grey,
                      alignment: Alignment.center,
                      width: double.infinity,
                      margin: const EdgeInsets.only(left: 0, top: 10, right:0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText("Single Refund",color: Colors.white,size: 15,weight: FontWeight.w500,),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.grey,
                    alignment: Alignment.center,
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 0, top: 10, right:0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomText("Multi Refund",color: Colors.white,size: 15,weight: FontWeight.w500,),
                    ),
                  ),
                  Container(
                    color: Colors.grey,
                    alignment: Alignment.center,
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 0, top: 10, right:0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomText("Single Delete Refund",color: Colors.white,size: 15,weight: FontWeight.w500,),
                    ),
                  ),
                  Container(
                    color: Colors.grey,
                    alignment: Alignment.center,
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 0, top: 10, right:0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomText("Multi Delete Refund",color: Colors.white,size: 15,weight: FontWeight.w500,),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Calculator().createTokenApiCall(headerToken.toString(),DateTime.now().millisecondsSinceEpoch.toString(),context);
                    },
                    child: Container(
                      color: Colors.grey,
                      alignment: Alignment.center,
                      width: double.infinity,
                      margin: const EdgeInsets.only(left: 0, top: 10, right:0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText("Create Token",color: Colors.white70,size: 15,weight: FontWeight.w500,),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){

                      addCartAPICall();
                    },
                    child: Container(
                      color: Colors.grey,
                      alignment: Alignment.center,
                      width: double.infinity,
                      margin: const EdgeInsets.only(left: 0, top: 10, right:0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText("Add Card",color: Colors.white,size: 15,weight: FontWeight.w500,),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      callRetriveApiCall();
                    },
                    child: Container(
                      color: Colors.grey,
                      alignment: Alignment.center,
                      width: double.infinity,
                      margin: const EdgeInsets.only(left: 0, top: 10, right:0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomText("retrieveCard",color: Colors.white,size: 15,weight: FontWeight.w500,),
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.grey,
                    alignment: Alignment.center,
                    width: double.infinity,
                    margin: const EdgeInsets.only(left: 0, top: 10, right:0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomText("Pay Status",color: Colors.white,size: 15,weight: FontWeight.w500,),
                    ),
                  ),
                ],
              ),
            ),
            if(_isLoading)
              Center(
                child:Card(
                  elevation: 7,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(40.0),
                    child: CupertinoActivityIndicator(
                        radius: 20.0, color: CupertinoColors.activeBlue,animating: true),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void callCreatePayment() {

    PostAPaymentRequest paymentData2 = PostAPaymentRequest(
      products: [
        Products(
          name: "Logitech K380",
          description: "Logitech K380 / Easy-Switch for Upto 3 Devices, Slim Bluetooth Tablet Keyboar",
          price: 20,
          quantity: 1,
        ),
        Products(
          name: "Logitech M171 Wireless Optical Mouse",
          description: "Logitech M171 Wireless Optical Mouse  (2.4GHz Wireless, Blue Grey)",
          price: 20,
          quantity: 1,
        ),
      ],
      order: Order(
        id: "123",
        reference: "REF-456",
        description: "Purchase order K380 Keyboard",
        currency: "KWD",
        amount: 40
      ),
      paymentGateway: PaymentGateway(src: "knet"),
      language: "en",
      reference: Reference(id: "123459865234889"),
      customer: Customer(
        uniqueId: "ABCDer22126433",
        name: "Aqeel2",
        email: "Aqeel2@gmail.com",
        mobile: "69923192",
      ),
      returnUrl: "https://upayments.com/en/",
      cancelUrl: "https://developers.upayments.com/",
      notificationUrl: "https://webhook.site/92eb6888-362b-4874-840f-3fff620f7cf4",
      extraMerchantData: [
        // ExtraMerchantData(
        //   amount: 20,
        //   knetCharge: 5,
        //   knetChargeType: "fixed",
        //   ccCharge: 10,
        //   ccChargeType: "percentage",
        //   ibanNumber: "KW91KFHO0000000000051010173254",
        // ),
        // ExtraMerchantData(
        //   amount: 20,
        //   knetCharge: 5,
        //   knetChargeType: "fixed",
        //   ccCharge: 7,
        //   ccChargeType: "percentage",
        //   ibanNumber: "KW31NBOK0000000000002010177457",
        // ),
      ],
    );

    Calculator cal = Calculator();

    void handleSecondApiSuccess(ResponsePaymentData response) {
      print('Second API Success: $response');
      if(response!=null && response?.orderID !=null){
   String? orderId=     response?.orderID;
   String? result = response.result;

   cumstomeDailog(context,"OrderSuccess:$result",orderId);

      }else{

      }
    }

    void handleSecondApiError(String error) {
      print('Error calling the second API: $error');
      cumstomeDailog(context,"Error Order API","Error");

    }

    // Request Charge API
    cal. allController.createPayment(context as BuildContext,"699299889999", paymentData2,handleSecondApiSuccess);
    if(cal.allController.createPaymentResponse!.status==false){
      _isLoading = false;
    }
    _isLoading=false;
    if(cal.allController.createPaymentResponse!.status==true){
      // _navigateAndDisplaySelection(context,cal.allController.createPaymentResponse!.data!.link.toString());

    }
  }


  getStringValuesSF() async {
    //Return String
    setState(() {
      timeStamp= DateTime.now().millisecondsSinceEpoch.toString();

    });
  }

  void addCartAPICall() {
    Calculator cal = Calculator();

    RequestAddCardData requestAddCardData = RequestAddCardData(

    cardadd:CardAdd(
         expiry:Expiry(
           month: "02",
           year: "39"
         ),
          nameOnCard: "Dharmendra Kakde",
            number: "5123450000000008",
          securityCode: "100",
        ),
    customerUniqueToken: 233);

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
    cal. allController.addCard(context as BuildContext,"token",requestAddCardData);
    if(cal.allController.addCardsResponse!.status.toString()=="false"){
      _isLoading = false;
    }
    _isLoading=false;
    if(cal.allController.addCardsResponse!.status.toString()=="true"){

    }

  }

  void callsingleRefund() {
    _isLoading=true;
    Calculator cal = new Calculator();

    SingleRefundPost postRefundRequest = SingleRefundPost(
  orderId: "mv1GZnrG2l2022101012552551446691693753220125586473664f49f84b1ccb",
        totalPrice: 20,
        customerFirstName: "Aqeel",
        customerEmail: "Aqeel2@gmail.com",
        customerMobileNumber: "69923192",
        reference: "324601000405",
        notifyUrl: "https://webhook.site/92eb6888-362b-4874-840f-3fff620f7cf4"

    );

    MultiRefundOptionData multiOptionRefundData = MultiRefundOptionData(
      refundPayloadOption:[
        RefundPayloadOption(
              ibanNumber: "KW91KFHO0000000000051010173254",
              amountToRefund: 1

          ),
        RefundPayloadOption(
              ibanNumber: "KW31NBOK0000000000002010177457",
              amountToRefund: 2

          )

        ],

            receiptId: "mv1GZnrG2l2022101012552551446691693753220125586473664f49f84b1ccb",

    );


    cal.allController.singleRefund(context as BuildContext,postRefundRequest,multiOptionRefundData).then((value) async {
      if(value is MultiVandorRefundResponse){
        String? refundOrderId=value.data?.responseData?.refundOrderId;
        String? message = value.message;
        if(refundOrderId!=null && message!=null){
          cumstomeDailog(context,"MultiRefund:$message",refundOrderId);
        }
      } if (value is SingleRefundResponse) {
       String? refundId= value?.data?.refundOrderId;
       String? message = value.message;
       if(refundId!=null && message!=null){
         cumstomeDailog(context,"SingleRefund$message",refundId);

       }
      }

    });


    cal.allController.singleRefund(context as BuildContext,postRefundRequest,multiOptionRefundData);
    if(cal.allController.singleRefundResponse!.status==false){
      _isLoading = false;

    }
    _isLoading=false;
    if(cal.allController.singleRefundResponse!.status==true){

    }



  }

  void callRetriveApiCall() {

    Calculator(). retrieveCardApiCall(headerToken.toString(),context);

  }
}





