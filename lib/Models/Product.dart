class Product{
  String _name;
  String _company;
  String _description;
  int _amount;
  double _price;
  String _image;

  Product();

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get company => _company;

  set company(String value) {
    _company = value;
  }

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  int get amount => _amount;

  set amount(int value) {
    _amount = value;
  }

  String get description => _description;

  set description(String value) {
    _description = value;
  }

  String get image => _image;

  set image(String value) {
    _image = value;
  }
}