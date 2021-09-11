import 'package:flutter/material.dart';
import 'package:lifepets/models/pet.model.dart';

/// sempre perguntar se a tela vai ter alguma alteração em tempo de execução
/// se não tiver deve ser stateless, caso contrário statefull
class PerfilPetScreen extends StatelessWidget {

  /// Variavel do tipo Pet
  /// que é recebido como parâmetro da tela HomeScreen
  final Pet? pet;

  /// Construtor da classe PerfilPetScreen
  /// Inicializando a variavel criada
  PerfilPetScreen({this.pet});

  /// Método _cartaoInfoPet
  Widget _cartaoInfoPet(String label, String informacao){
    return Container(
      margin: EdgeInsets.all(10),
      width: 100,
      decoration: BoxDecoration(
        color: Color(0xfff8f2f7),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            label,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.red,
            ),
          ),

          SizedBox(height: 8),

          Text(
            informacao,
            style: TextStyle(
              fontFamily: "Montserrat",
              fontSize: 16,
              fontWeight: FontWeight.w600,
              //color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Hero(
                  /// precisamos receber as informações por parametros
                  /// do card do pet que esta na tela homeScreen
                    tag: pet?.id,
                    child: Container(
                      width: double.infinity, // largura do container
                      height: 350, // altura
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            pet?.imageUrl,
                          ),
                          fit: BoxFit.cover
                        ),
                      ),
                    )
                ),
                Padding(
                  padding: EdgeInsets.only(top: 50, left: 10),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                )
              ],
            ),

            SizedBox(height: 20),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                children: <Widget>[
                  Text(
                    pet?.nome, style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),)
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                children: <Widget>[
                  Text(
                    pet?.descricao, style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      color: Colors.grey,
                  ),)
                ],
              ),
            ),

            Container(
              margin: EdgeInsets.only(top: 30),
              height: 120, // Altura
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  _cartaoInfoPet('Idade', pet!.idade.toString()),
                  _cartaoInfoPet('Sexo', pet!.sexo.toString()),
                  _cartaoInfoPet('Cor', pet!.cor.toString()),
                  _cartaoInfoPet('ID', pet!.id.toString()),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 25),
              child: Text(
                pet!.bio,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 16,
                  height: 1.5,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              )

            )
          ],
        ),
      ),
    );
  }
}
