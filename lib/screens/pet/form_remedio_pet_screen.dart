import 'package:flutter/material.dart';
import 'package:lifepets/models/pet.model.dart';

class FormRemedioPetScreen extends StatelessWidget {

  Pet pet;
  FormRemedioPetScreen({required this.pet});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro remédio - ${pet.nome}"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: "Nome do remédio"),
              ),
              TextFormField(
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(labelText: "data do remédio"),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Container(
                  height: 40,
                  child: ElevatedButton(
                    onPressed: (){},
                    child: Text("Cadastrar", style: TextStyle(fontSize: 16, color: Colors.white)),
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.redAccent)
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
