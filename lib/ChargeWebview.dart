import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model/ResponsePayment/ResponsePaymentData.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';


class ChargeWebview extends StatefulWidget {
  final String? url;

  ChargeWebview({Key? key, required this.url}) : super(key: key);

  @override
  _ChargeWebviewState createState() => _ChargeWebviewState();
}

class _ChargeWebviewState extends State<ChargeWebview> {
   InAppWebViewController? _webViewController;

   bool shouldLoad = true; // Flag to control loading
   bool shouldStopNextLoading(String navigationAction) {
     // Add your conditions here to determine when to stop loading the next request
     // For example, you may want to stop loading if the URL matches a certain pattern.
      if (navigationAction.contains("https://apiv2api.upayments.com/get-pay-by-samsung")) {

        return true;
      }

     return false;
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('WebView')),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(widget.url!)),
        onWebViewCreated: (controller) {
          _webViewController = controller;
        },
        onLoadStart: (controller, url)  {
          print("started : $url");
          String urlTemp=  url.toString();

        },
        onLoadStop: (controller, url) {
    String urlTemp=  url.toString();
    // if (shouldStopNextLoading(urlTemp)) {
    //  // controller.loadUrl(urlRequest: URLRequest(url: url));
    //   controller.stopLoading();
    // }


    //


    if (url.toString().contains("result=CAPTURED")) {
      // Parse URL here

      String? payMentId = ""; // Extract payment_id from URL
      String? Result = ""; // Extract result from URL
      String? PostDate = ""; // Extract post_date from URL
      String? TranID = ""; // Extract tran_id from URL
      String? Ref = ""; // Extract ref from URL
      String? TrackID = ""; // Extract track_id from URL
      String? OrderID = ""; // Extract order_id from URL
      String? ReceiptID = ""; // Extract receipt_id from URL
      String? refund_order_id = ""; // Extract auth from URL

      List<String> split = url.toString().split("/?");
      List<String> split1 = split[1].split("&");
      // HashMap map = new HashMap<String, String>();

      Map<String, String> someMap = {};

      for (int i = 0; i < split1.length; i++) {

        List<String> split2 = split1[i].split("=");
        if (split2.length > 1) {
          someMap[split2[0].toLowerCase()] = split2[1].replaceAll("%20", " ");
          // map.putIfAbsent(split2[0].toLowerCase(), () => split2[1].replaceAll("%20", " "));
          //   map.put(split2[0].toLowerCase(), split2[1].replaceAll("%20", " "));
        }
      }
       payMentId = someMap["payment_id"];
       Result = someMap["result"];
      PostDate =someMap["post_date"];
      TranID = someMap["tran_id"];
      Ref = someMap["ref"];
      TrackID = someMap["track_id"];
      OrderID = someMap["order_id"];
      refund_order_id = someMap["refund_order_id"];


      final ResponsePaymentData responsePaymentData = ResponsePaymentData(
        payMentId: payMentId,
        result: Result,
        postDate: PostDate,
        tranID: TranID,
        ref: Ref,
        trackID: TrackID,
        orderID: OrderID,
        custRef: refund_order_id,
        receiptID: ReceiptID,
      );

      Navigator.pop(context, responsePaymentData);
    } else {
      // Handle other cases if needed
    }

    //


          print("finish : $url");
        },
        onProgressChanged: (controller, progress) {
          // Do something with progress
        },
        shouldOverrideUrlLoading: (controller, navigationAction) async {
          print("NavigationRequest: ${navigationAction.request.url}");
          try {

          String urlTemp=  navigationAction.request.url.toString();
          // if (shouldStopNextLoading(navigationAction)) {
          //   return NavigationActionPolicy.CANCEL;
          // }
            // if (navigationAction.request.url.toString().contains("https://apiv2api.upayments.com/get-pay-by-samsung")) {
            //   // return NavigationActionPolicy.CANCEL;
            // }

            if (navigationAction.request.url.toString().contains("result=CAPTURED")) {
              // Parse URL here

              String? payMentId = ""; // Extract payment_id from URL
          String? Result = ""; // Extract result from URL
          String? PostDate = ""; // Extract post_date from URL
          String? TranID = ""; // Extract tran_id from URL
          String? Ref = ""; // Extract ref from URL
          String? TrackID = ""; // Extract track_id from URL
          String? OrderID = ""; // Extract order_id from URL
          String? ReceiptID = ""; // Extract receipt_id from URL
          String? Auth = ""; // Extract auth from URL


          final ResponsePaymentData responsePaymentData = ResponsePaymentData(
          payMentId: payMentId,
          result: Result,
          postDate: PostDate,
          tranID: TranID,
          ref: Ref,
          trackID: TrackID,
          orderID: OrderID,
          receiptID: ReceiptID,
          );

          Navigator.pop(context, responsePaymentData);
          } else {
          // Handle other cases if needed
          }
          } catch (e) {
          print(e);
          }

          // Return NavigationDecision.navigate if you want to allow the navigation
          return NavigationActionPolicy.ALLOW;
        },
      ),
    );
  }

  void parsedata(Uri? url) {



  }

}
