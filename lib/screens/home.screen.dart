import 'package:flutter/material.dart';
import 'package:lifepets/models/pet.model.dart';
import 'package:lifepets/screens/form_pet_screen.dart';
import 'package:lifepets/screens/pet/perfil_pet_screen.dart';


/// sempre perguntar se a tela vai ter alguma alteração em tempo de execução
/// se não tiver deve ser stateless, caso contrário statefull
class HomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// ListView.builder
      body: ListView.builder(

        /// ItenCount verificando a quantidade de itens que serão criados
        /// pets => lista da classe, length => tamanho da lista.
        itemCount: pets.length,


        itemBuilder: (context, index){
          return _petCard(context, index);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => FormPetScreen(),
            )
          );
        },
        icon: Icon(Icons.pets),
        label: Text("Cadastrar"),
        backgroundColor: Colors.redAccent,
      ),
    );
  }
    /// Método para retornar um Widget
    /// para ser chamado pelo ListView.builder
    Widget _petCard(BuildContext context, int index){
      return GestureDetector(
        onTap: (){
          /// acessamos a pagina de perfil
          Navigator.of(context).push(
              MaterialPageRoute(
                /// passamos o pet como parâmetro
                builder: (_) => PerfilPetScreen(pet: pets[index]),
              )
          );
        },
        child: Padding(
          padding: EdgeInsets.only(bottom: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              /// Filho 01
              Hero(
                tag: pets[index].id,
                child: Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                            Radius.circular(20)
                        ),
                        image: DecorationImage(
                          image: AssetImage(pets[index].imageUrl),
                          fit: BoxFit.cover,
                        )
                    )

                ),
              ),

              /// Filho 02
              Padding(
                padding: EdgeInsets.fromLTRB(12, 12, 40, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      pets[index].nome,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.fromLTRB(12, 12, 40, 0),
                child: Text(
                  pets[index].descricao,
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }
  }
