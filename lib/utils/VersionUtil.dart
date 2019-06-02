class VersionUtil {
  bool compare(String newVersion, String oldVersion) {
    List<String> newVersionList = newVersion.split(".");
    List<String> oldVersionList = oldVersion.split(".");

    int newVersionNum = int.parse(newVersionList[0]) * 1000000 +
        int.parse(newVersionList[1]) * 10000 +
        int.parse(newVersionList[2]) * 100;
    int oldVersionNum = int.parse(oldVersionList[0]) * 1000000 +
        int.parse(oldVersionList[1]) * 10000 +
        int.parse(oldVersionList[2]) * 100;

    return newVersionNum > oldVersionNum;
  }
}
