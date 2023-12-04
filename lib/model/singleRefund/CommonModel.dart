
import '../multivendor/MultiVandorRefundResponse.dart';
import 'SingleRefundResponse.dart';

   class CommonModel{
   MultiVandorRefundResponse? multiVandorRefundResponse;
   SingleRefundResponse? singleRefundResponse;
   CommonModel(this.singleRefundResponse, this.multiVandorRefundResponse);
 }