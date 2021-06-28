class Client{
  String _name;
  String _company;
  String _direction;
  int _phone;

  Client();

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get company => _company;

  int get phone => _phone;

  set phone(int value) {
    _phone = value;
  }

  String get direction => _direction;

  set direction(String value) {
    _direction = value;
  }

  set company(String value) {
    _company = value;
  }
}