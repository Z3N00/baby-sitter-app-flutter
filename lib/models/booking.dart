class Booking {
  String _sitterId;
  String _email;
  String _name;
  String _status;
  double _totalamount;

  Map<String, dynamic> toJson() => {
        'sitterId': _sitterId,
        'email': _email,
        'name': _name,
        'status': _status,
        'totalamount': _totalamount,
      };

  Booking(
      this._sitterId, this._email, this._name, this._status, this._totalamount);

  String get status => _status;

  double get totalamount => _totalamount;

  String get email => _email;

  String get sitterId => _sitterId;

  set status(String status) => this._status = status;
}
