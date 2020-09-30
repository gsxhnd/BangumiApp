class SearchRequest {
  static Future search(String keyword) async {
    String url = "/search/subject/$keyword";
  }
}
