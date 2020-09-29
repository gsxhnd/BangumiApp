import '../utils/HttpUtil.dart';

//
class UserRequest {
  /// 返回用户基础信息
  static Future getUerInfo(String username) {
    String url = "/user/$username";
  }

  /// 获取用户收藏列表，默认为在看
  /// cat	string	收藏类型	watching = 在看的动画与三次元条目 / all_watching = 在看的动画三次元与书籍条目
  /// ids	string	收藏条目 ID	批量查询收藏状态，将条目 ID 以半角逗号分隔，如 1,2,4,6
  /// responseGroup	string	medium / small	默认为 medium。small 时不返回条目详细信息
  static Future getUserCollection(String username) {
    String url = "/user/$username/collection";
  }

  /// subject_type	string	条目类型	(book/anime/music/game/real)
  /// max_results	integer	显示条数	最多 25
  static Future getUserCollectionType(String username,
      {String subjectType, int maxResults}) {
    String url = "/user/$username/collections/$subjectType";
  }

  /// 获取用户所有收藏信息
  static Future getUserCollectionStatus(String username) {
    String url = "/user/$username/collections/status";
  }

  /// 用户收视进度
  /// subject_id	integer	条目 ID	获取指定条目收视进度
  static Future getUserProgress(String username, {int subjectId}) {
    String subjectIdUri =
        subjectId != null ? "?subject_id=" + subjectId.toString() : "";
    print(subjectIdUri.isEmpty);
  }
}
