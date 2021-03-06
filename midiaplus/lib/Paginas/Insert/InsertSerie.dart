import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:midiaplus/Paginas/CardSerie.dart';
import '../botao.dart';

import 'package:midiaplus/Paginas/PaginaPrincipal.dart';

class CadastroSerie extends StatefulWidget {
  @override
  _CadastroSerieState createState() => _CadastroSerieState();
}

class _CadastroSerieState extends State<CadastroSerie> {


  bool _toggleVisibility = true;

  String _titulo;
  String _diretor;
  String _elenco_principal;
  String _pais;
  String _ano_lancamento;
  String _numero_temp;
  String _imagem;

  var titulotxt = new TextEditingController();
  var diretortxt = new TextEditingController();
  var elenco_principaltxt = new TextEditingController();
  var paistxt = new TextEditingController();
  var ano_lancamentotxt = new TextEditingController();
  var numero_temptxt = new TextEditingController();
  var imagemtxt = new TextEditingController();


  GlobalKey<FormState> _formKey = GlobalKey();

  Widget _titulotxt() {
    return TextFormField(
      controller: titulotxt,
      decoration: InputDecoration(
        hintText: "Titulo da Serie",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
      onSaved: (String titulo) {
        _titulo = titulo.trim();
      },
      validator: (String titulo) {
        String errorMessage;
        if (titulo.isEmpty) {
          errorMessage = "O titulo é requerido";
        }
        // if(username.length > 8 ){
        //   errorMessage = "Your username is too short";
        // }
        return errorMessage;
      },
    );
  }

  Widget _diretortxt() {
    return TextFormField(
      controller: diretortxt,
      decoration: InputDecoration(
        hintText: "Diretor da Serie",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
      onSaved: (String diretor) {
        _diretor = diretor.trim();
      },
      validator: (String diretor) {
        String errorMessage;
        if (diretor.isEmpty) {
          errorMessage = "O nome do diretor é requerido";
        }
        return errorMessage;
      },
    );
  }

  Widget _elenco_principaltxt() {
    return TextFormField(
      controller: elenco_principaltxt,
      decoration: InputDecoration(
        hintText: "Elenco principal",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
      onSaved: (String elenco_principal) {
        _elenco_principal = elenco_principal.trim();
      },
      validator: (String elenco_principal) {
        String errorMessage;
        if (elenco_principal.isEmpty) {
          errorMessage = "O elenco é requerido";
        }
        return errorMessage;
      },
    );
  }

  Widget _paistxt() {
    return TextFormField(
      controller: paistxt,
      decoration: InputDecoration(
        hintText: "pais de lancamento",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
      onSaved: (String pais) {
        _pais = pais.trim();
      },
      validator: (String pais) {
        String errorMessage;
        if (pais.isEmpty) {
          errorMessage = "O pais de lancamento é requerido";
        }
        return errorMessage;
      },
    );
  }

  Widget _ano_lancamentotxt() {
    return TextFormField(
      controller: ano_lancamentotxt,
      decoration: InputDecoration(
        hintText: "ano de lancamento",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
      onSaved: (String ano_lancamento) {
        _ano_lancamento = ano_lancamento.trim();
      },
      validator: (String ano_lancamento) {
        String errorMessage;
        if (ano_lancamento.isEmpty) {
          errorMessage = "O ano de lancamento é requerido";
        }
        return errorMessage;
      },
    );
  }
  Widget _numero_temptxt() {
    return TextFormField(
      controller: numero_temptxt,
      decoration: InputDecoration(
        hintText: "Numero de Temporada",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
      onSaved: (String numero_temp) {
        _numero_temp = numero_temp.trim();
      },
      validator: (String numero_temp) {
        String errorMessage;
        if (numero_temp.isEmpty) {
          errorMessage = "O ano de lancamento é requerido";
        }
        return errorMessage;
      },
    );
  }

  Widget _imagemtxt() {
    return TextFormField(
      controller: imagemtxt,
      decoration: InputDecoration(
        hintText: "Imagem(.png)",
        hintStyle: TextStyle(
          color: Color(0xFFBDC2CB),
          fontSize: 18.0,
        ),
      ),
      onSaved: (String imagem) {
        _imagem = imagem.trim();
      },
      validator: (String imagem) {
        String errorMessage;
        if (imagem.isEmpty) {
          errorMessage = "O link da imagem é requerido";
        }
        return errorMessage;
      },
    );
  }



  void _inserirDados() async {
    final response = await http.post(
        Uri.parse("http://midiaplus.6te.net/MidiaPlustesdsa/inserirserie.php"),
        body: {
          "titulo": titulotxt.text,
          "diretor": diretortxt.text,
          "elenco_principal": elenco_principaltxt.text,
          "pais": paistxt.text,
          "ano_lancamento": ano_lancamentotxt.text,
          "numero_temp": numero_temptxt.text,
          "imagem": imagemtxt.text,
        });
    final map = json.decode(response.body);
    final res = map["message"];
    messagem(res);
  }

  messagem(res){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(res),
      ),
    );

    if(res == 'Inserido com Sucesso'){
      titulotxt.text = "";
      diretortxt.text = "";
      elenco_principaltxt.text = "";
      paistxt.text = "";
      ano_lancamentotxt.text = "";
      numero_temptxt.text = "";
      imagemtxt.text = "";
      Navigator.push(

        context,
        MaterialPageRoute(builder: (context) => CardSerie()),
      );
    }
    if(res == 'Preencha os Dados'){

    }



  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.shade100,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage("assets/imagens/logo.png"),
                  height: 120.0,
                  width: 120.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Card(
                  elevation: 5.0,
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        _titulotxt(),
                        SizedBox(
                          height: 10.0,
                        ),
                        _diretortxt(),
                        SizedBox(
                          height: 10.0,
                        ),
                        _elenco_principaltxt(),
                        SizedBox(
                          height: 10.0,
                        ),
                        _paistxt(),
                        SizedBox(
                          height: 10.0,
                        ),
                        _ano_lancamentotxt(),
                        SizedBox(
                          height: 10.0,
                        ),
                        _numero_temptxt(),
                        SizedBox(
                          height: 10.0,
                        ),
                        _imagemtxt(),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),

                GestureDetector(
                  onTap: () {
                    _inserirDados();
                  },
                  child: Button(
                    btnText: "Inserir",


                  ),
                )


              ],
            ),
          ),
        ),
      ),
    );


  }

}
