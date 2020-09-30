class CollectionRequest {
  static Future getCollectionSubject(int subjectID) async {
    String url = "/collection/$subjectID";
  }

  static Future actionCollectionSubject(int subjectID, String action) async {
    String url = "/collection/$subjectID/$action";
  }
}
