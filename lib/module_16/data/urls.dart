class Urlss{
  static const String _baseUrl = 'http://35.73.30.144:2005/api/v1';
  static const String registationUrl = '$_baseUrl/Registration';
  static const String loginUrl = '$_baseUrl/Login';
  static const String createNewTaskUrl = '$_baseUrl/createTask';
  static const String getNewTaskUrl = '$_baseUrl/listTaskByStatus/New';
  static const String getProgressTaskUrl = '$_baseUrl/listTaskByStatus/Progress';
}