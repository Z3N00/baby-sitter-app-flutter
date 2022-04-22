class NotificationModel {
  String _email;
  String _name;
  String _message;

  Map<String, dynamic> toJson() => {
    'email': _email,
    'name': _name,
    'message': _message,
  };

  NotificationModel(
      this._email, this._name,this._message);

  String get message => _message;


  String get email => _email;


}
