import 'package:flutter/material.dart';

class FormPetScreen extends StatefulWidget {

  @override
  _FormPetScreenState createState() => _FormPetScreenState();
}

class _FormPetScreenState extends State<FormPetScreen> {
  String corPet = 'Branco';
  String sexoPet = 'Macho';
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
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Nome do pet"),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Bio")
                ),
                TextFormField(
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
                      onPressed: (){},
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
