/// Aula-02 Criando página home
/// Criando o model pet

/// Atributes
class Pet {

  /// SOBRE AS VARIAVEIS
  ///
  ///
  var nome;
  var imageUrl;
  var descricao;
  var idade;
  var sexo;
  var cor;
  var bio;
  var id;

  /// Construtor
  Pet({
    this.nome,
    this.imageUrl,
    this.descricao,
    this.idade,
    this.sexo,
    this.cor,
    this.bio,
    this.id
  });
}

/// Lista com dados fakes
/// Temporário

var pets =[
  Pet(
      nome: "Totó",
      imageUrl: 'assets/images/toto.png',
      descricao: "Um cachorro esperto",
      idade: 2,
      sexo: "Macho",
      cor: "Preto",
      bio: "Sou o totó bem esperto",
      id: "1"
  ),

  Pet(
      nome: "Arnaldo",
      imageUrl: 'assets/images/arnaldo.png',
      descricao: "Um cachorro elétrico",
      idade: 3,
      sexo: "Macho",
      cor: "Preto",
      bio: "Sou um pinsher elétrico",
      id: "2"
  ),

];