import 'package:flutter/material.dart';
import 'package:lifepets/models/pet.model.dart';
import 'package:lifepets/screens/pet/form_remedio_pet_screen.dart';
import 'package:lifepets/widgets/custom_navbar.dart';

class RemedioScreen extends StatelessWidget {

  final Pet pet;

  RemedioScreen({required this.pet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Hero(
                  /// precisamos receber as informações por parametros
                  /// do card do pet que esta na tela homeScreen
                    tag: pet.id.toString(),
                    child: Container(
                      width: double.infinity, // largura do container
                      height: 350, // altura
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              pet.imageUrl.toString(),
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
            SizedBox(height: 20,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Remédios",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              )
            ),
            Expanded(
                child: ListView(
                  children: <Widget> [
                    Card(
                      elevation: 8,
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      child: Container(
                        child: ListTile(
                          leading: Container(
                            padding: EdgeInsets.only(right: 12),
                            child: Icon(Icons.healing, color: Colors.redAccent,),
                            decoration: BoxDecoration(
                              border: Border(
                                right: BorderSide(width: 1, color: Colors.redAccent)
                              )
                            ),
                          ),
                          title: Text(
                            pet.nome.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          subtitle: Text(
                            pet.descricao.toString()
                          ),
                        ),
                      ),
                    )
                  ],
                )
            ),
          ],
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => FormRemedioPetScreen(pet: pet),
              )
          );
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.redAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: CustomNavBar(paginaAberta: 1, pet: pet),
    );
  }
}
