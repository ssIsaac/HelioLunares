const DATASOURCE = 'http://localhost:8000.com/';
Localdata localdataobj = Localdata();

class Localdata {
  static String Token = "";
  static int USERLEVEL = 1;
  static int USERID = 0;

  String Email = '';

  Localdata() {}

  void setData(String token, String email) {
    Token = token;
    Email = email;
  }

  String getToken() {
    return Token;
  }

  void setToken(String token) {
    Token = token;
  }

  int getUserLevel() {
    return USERLEVEL;
  }

  void setUserLevel(int userlevel) {
    USERLEVEL = userlevel;
  }

  int getUserID() {
    return USERID;
  }

  void setUserID(int userid) {
    USERID = userid;
  }
}
