class Equipe{

  String _nameGroup;
  List<String> _membro;
  List<String> _cellphone;

  Equipe(this._nameGroup, this._membro, this._cellphone);

  List<String> get cellphone => _cellphone;

  set cellphone(List<String> value) {
    _cellphone = value;
  }

  List<String> get membro => _membro;

  set membro(List<String> value) {
    _membro = value;
  }

  String get nameGroup => _nameGroup;

  set nameGroup(String value) {
    _nameGroup = value;
  }


}