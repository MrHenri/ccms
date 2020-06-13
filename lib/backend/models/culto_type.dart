enum TypeCulto{
  Celebracao,
  Escola_De_Discipulo,
  Evento,
}

String typeCultoToString(Object object) {
  switch(object){
    case (TypeCulto.Celebracao):
      return 'Celebração';
    case (TypeCulto.Escola_De_Discipulo):
      return 'Escola de Discípulo';
    case (TypeCulto.Evento):
      return 'Evento';
    default:
      return 'Não informado';
  }
}

