import 'package:flutter/material.dart';
import 'package:lifepets/models/pet.model.dart';
import 'package:lifepets/service/pet_service.dart';

import 'home.screen.dart';

class FormPetScreen extends StatefulWidget {

  @override
  _FormPetScreenState createState() => _FormPetScreenState();
}

class _FormPetScreenState extends State<FormPetScreen> {
  String corPet = 'Branco';
  String sexoPet = 'Macho';

  final _nomeController = TextEditingController();
  final _bioController = TextEditingController();
  final _idadeController = TextEditingController();
  final _descricaoController = TextEditingController();

  /// Instanciando PetService
  PetService service = PetService();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro do pet"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _nomeController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Nome do pet"),
                ),

                TextFormField(
                  controller: _bioController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Bio")
                ),

                TextFormField(
                  controller: _idadeController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(labelText: "Idade")
                ),

                DropdownButtonFormField(
                  decoration: InputDecoration(labelText: "Sexo"),
                  value: sexoPet,
                  onChanged: (String? sexoSelecionada){
                    setState(() {
                      sexoPet = sexoSelecionada!;
                    });
                  },
                  items: <String>['Macho', 'Fêmea'].map<DropdownMenuItem<String>>
                    ((String value) {
                    return DropdownMenuItem<String> (
                        value: value,
                        child: Text(value)
                    );
                  }).toList(),
                ),

                TextFormField(
                  controller: _descricaoController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Descrição")
                ),

                DropdownButtonFormField(
                  decoration: InputDecoration(labelText: "Cor"),
                  value: corPet,
                  onChanged: (String? corSelecionada){
                    setState(() {
                      corPet = corSelecionada!;
                    });
                  },
                  items: <String>['Branco', 'Preto', 'Marron', 'Amarelo'].map<DropdownMenuItem<String>>
                    ((String value) {
                    return DropdownMenuItem<String> (
                      value: value,
                      child: Text(value)
                        );
                    }).toList(),
                ),

                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Container(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: (){
                        Pet newPet = Pet(
                          nome: _nomeController.text,
                          bio: _bioController.text,
                          idade: int.parse(_idadeController.text),
                          sexo: sexoPet,
                          descricao: _descricaoController.text,
                          cor: corPet
                        );
                        service.addPet(newPet);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (_) => HomeScreen(),
                          )
                        );
                      },
                      child: Text(
                        "Cadastrar",
                        style: TextStyle(
                            fontSize: 25),
                      ),
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent)
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
