import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsuariosPage extends StatefulWidget {
  @override
  _UsuariosPageState createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('usuarios'),
        ),
        body: Center(
          child: Text('usuario'),
        )
    );
  }
}