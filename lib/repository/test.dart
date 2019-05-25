import '../utils/HttpUtils.dart';




class ProductivityRequest {
  Future getProductivity({limit}) async {
    if (limit == null) {
      return await HttpUtil().request("/capacity?order=desc&sortby=created_at");
    } else {
      return await HttpUtil().request("/capacity?limit=$limit&order=desc&sortby=created_at");
    }
  }
  Future addProductivityRecord(data) async {
    return await HttpUtil().request("/capacity",data: data,method: "POST");
  }
  Future getProductivityRecordDashboard() async {
    return await HttpUtil().request("/capacity/dashboard");
  }
}