import 'package:flutter/material.dart';
import 'package:lifepets/models/pet.model.dart';
import 'package:lifepets/screens/pet/perfil_pet_screen.dart';
import 'package:lifepets/screens/pet/remedio_pet_screen.dart';

class CustomNavBar extends StatefulWidget {

  int? paginaAberta;
  final Pet? pet;
  CustomNavBar({this.pet, this.paginaAberta});

  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {

  Widget? paginaAtual;

  @override
  Widget build(BuildContext context) {
    // BottomAppBar => Permite nos customizar
    return BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        /// widget é utilizado para conseguirmos acessar as variaveis
                        /// que estão dentro do CustomNavBar
                        widget.paginaAberta = 0;
                      });
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => PerfilPetScreen(pet: widget.pet!)
                        )
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.pets,
                          color: widget.paginaAberta == 0 ? Colors.redAccent : Colors.grey,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Perfil",
                          style: TextStyle(
                            color: widget.paginaAberta == 0 ? Colors.redAccent : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  /// Buttom Remédio
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        widget.paginaAberta = 1;
                      });
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (_) => RemedioScreen(pet: widget.pet!)
                          )
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.healing,
                          color:  widget.paginaAberta == 1 ? Colors.redAccent : Colors.grey,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Remédio",
                          style: TextStyle(
                            color:  widget.paginaAberta == 1 ? Colors.redAccent : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        widget.paginaAberta = 2;
                      });

                      /// Navegação para a pagina consulta
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.local_hospital,
                          color:  widget.paginaAberta == 2 ? Colors.redAccent : Colors.grey,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Consulta",
                          style: TextStyle(
                            color:  widget.paginaAberta == 2 ? Colors.redAccent : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: (){
                      setState(() {
                        widget.paginaAberta = 3;
                      });
                      /// Navegação para a pagina anotações
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.event_note,
                          color:  widget.paginaAberta == 3 ? Colors.redAccent : Colors.grey,
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Anotações",
                          style: TextStyle(
                            color: widget.paginaAberta == 3 ? Colors.redAccent : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        )
    );
  }
}

