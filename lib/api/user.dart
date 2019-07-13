import '../utils/HttpUtil.dart';

class AuthRequest {
  static Future getUerInfo(String username) {
    return HttpUtil().request("/user/$username");
  }

  static Future getUserCollection(String username) {
    return HttpUtil().request("/user/$username/collection");
  }

  /// subject_type	string	条目类型	(book/anime/music/game/real)
  static Future getUserCollectionType(String username, String subjectType) {
    return HttpUtil().request("/user/$username/collections/$subjectType");
  }

  static Future getUserCollectionStatus(String username) {
    return HttpUtil().request("/user/$username/collections/status");
  }
  static Future getUserProgress(String username, {int subject_id}) {
    return HttpUtil().request("/user/$username/progress");
  }
}
