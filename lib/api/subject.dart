class SubjectRequset {
  static Future getSubjectInfo(int id) async {
    String url = "/subject/$id";
  }

  static Future getSubjectEPInfo(int id) async {
    String url = "/subject/$id/ep";
  }
}
