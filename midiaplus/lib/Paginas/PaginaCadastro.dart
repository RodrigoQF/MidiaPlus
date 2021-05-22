import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'PaginaLogin.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}


class _CadastroPageState extends State<CadastroPage> {
  TextEditingController nome_completo = new TextEditingController();
  TextEditingController username = new TextEditingController();
  TextEditingController senha = new TextEditingController();
  TextEditingController data_nascimento = new TextEditingController();
  TextEditingController cidade = new TextEditingController();
  TextEditingController estado = new TextEditingController();

  /*Future<List> senddata() async {
    final response = await http.post("http://192.168.56.1/flutter/listar_usuario.php",   body: {

      "nome_completo": nome_completo.text,
      "username": username.text,
      "senha":senha.text,
      "data_nascimento":data_nascimento.text,
      "cidade":cidade.text,
      "estado":estado.text,
    });
    var datauser = json.decode(response.body);
    return datauser;
  }
  */



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Pagina de Cadastro"),
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: nome_completo,
                autofocus: true,
                keyboardType: TextInputType.text,
                style: new TextStyle(color: Colors.white, fontSize: 15),
                decoration: InputDecoration(
                  labelText: "Nome Completo",
                  hintText: 'nome_completo',
                  labelStyle: TextStyle (color: Colors.white)),
                ),
              Divider(),
              TextFormField(
                controller: username,
                autofocus: true,
                keyboardType: TextInputType.text,
                style: new TextStyle(color: Colors.white, fontSize: 15),
                decoration: InputDecoration(
                  hintText: 'username',
                    labelText: "Username",
                    labelStyle: TextStyle (color: Colors.white)),
              ),
              Divider(),
              TextFormField(
                controller: senha,
                autofocus: true,
                obscureText: true,
                keyboardType: TextInputType.text,
                style: new TextStyle(color: Colors.white, fontSize: 15),
                decoration: InputDecoration(
                  hintText: 'senha',
                    labelText: "Senha",
                    labelStyle: TextStyle (color: Colors.white)),
              ),

              TextFormField(
                controller: data_nascimento,
                autofocus: true,
                keyboardType: TextInputType.datetime,
                style: new TextStyle(color: Colors.white, fontSize: 15),
                decoration: InputDecoration(
                  hintText: 'data_nascimento',
                    labelText: "Data de Nascimento",
                    labelStyle: TextStyle (color: Colors.white)),
              ),

              TextFormField(
                controller: cidade,
                autofocus: true,
                keyboardType: TextInputType.text,
                style: new TextStyle(color: Colors.white, fontSize: 15),
                decoration: InputDecoration(
                  hintText: 'cidade',
                    labelText: "Cidade",
                    labelStyle: TextStyle (color: Colors.white)),
              ),

              TextFormField(
                controller: estado,
                autofocus: true,
                keyboardType: TextInputType.text,
                style: new TextStyle(color: Colors.white, fontSize: 15, fontFamily: "Rock Salt"),
                decoration: InputDecoration(
                  hintText: 'estado',
                    labelText: "Estado",
                    labelStyle: TextStyle (color: Colors.white)),
              ),
              Divider(),
              ButtonTheme(
                height: 60.0,
                child: RaisedButton(
                  color: Color(0xFF947bd3),
                  onPressed: () => {
                    //senddata(),
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    ),
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text("Cadastro Realizado com Sucesso"),
                      ),
                    ),
                  },
                  child: Text(
                    "Realizar Cadastrar",
                    style: TextStyle(color: Colors.white, fontSize: 20),
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
