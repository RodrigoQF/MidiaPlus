import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'DadosLivro.dart';
import 'Insert/InsertLivro.dart';
import 'botao.dart';

class CardLivro extends StatefulWidget {
  @override
  _CardLivroState createState() => _CardLivroState();
}

class _CardLivroState extends State<CardLivro> {

  var buscar;
  var dados;
  var titulo, pais, imagem;
  var carregando = false;

  _listarDados() async{
    final response = await http.get(Uri.parse("http://midiaplus.6te.net/MidiaPlustesdsa/listarlivro.php"));
    final map = json.decode(response.body);
    final itens = map ["result"];
    this.dados = itens;


    setState(() {
      carregando = true;
      this.dados = itens;

    });

  }


  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    _listarDados();
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(

      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
      child: Stack(
        children: <Widget>[


          Container(


              height: 600.0,
              width: 400.0,
              child: !carregando
                  ? new LinearProgressIndicator()
                  : new ListView.builder(
                  itemCount: this.dados != null ? this.dados.length : 0,
                  itemBuilder: (context, i){
                    final item = this.dados[i];
                    print(item);

                    return new Container(
                      margin: EdgeInsets.only(bottom: 15, left: 40, top: 10),

                      child: Stack(
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          DadosLivro()));
                            },
                            child: Image(

                              image: AssetImage('assets/imagens/' + item['imagem'],

                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            left: 0.0,
                            bottom: 0.0,
                            width: 240.0,
                            height: 50.0,
                            child: Container(

                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [Colors.black, Colors.black12])),
                            ),
                          ),
                          Positioned(
                            left: 10.0,
                            bottom: 10.0,
                            right: 10.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      item['titulo'],
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.star,
                                          color: Theme.of(context).primaryColor,
                                          size: 16.0,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Theme.of(context).primaryColor,
                                          size: 16.0,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Theme.of(context).primaryColor,
                                          size: 16.0,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Theme.of(context).primaryColor,
                                          size: 16.0,
                                        ),
                                        Icon(
                                          Icons.star,
                                          color: Theme.of(context).primaryColor,
                                          size: 16.0,
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Text(
                                          item["autor"],
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                    GestureDetector(
                    onTap: () {
                    Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                    builder: (BuildContext context) =>
                    CadastroLivro()));
                    },
                    child: Button(
                    btnText: "Inserir Livro",


                    )
                    ),


                              ],
                            ),

                          ),





                        ],
                      ),
                    );
                  }
              )

          )
        ],
      ),
    );
  }

}