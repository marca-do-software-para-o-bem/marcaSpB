import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        actions: <Widget>[
          Icon(
            LineAwesomeIcons.square_full,
            color: Colors.blue[700],
            size: 35,
          ),
          Icon(MdiIcons.squareRounded,
              color: Color.fromARGB(255, 255, 20, 147), size: 32),
          Icon(
            Icons.circle,
            color: Color.fromARGB(255, 149, 193, 31),
            size: 32,
          )
        ],
        title: Text('Marca Mutante'),
        backgroundColor: Colors.blue[400],
      ),
      body: SingleChildScrollView(
        child: Column(
           children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.blue[300]),
                  padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                  child: Column(
                    children: [
                      Text(
                        'O que é uma marca mutante?',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Marca Mutante é uma identidade que pode ser alterada, mas possui um elemento básico que permanece sempre o mesmo. Quer seja a palavra, texto, cores ou forma; a marca ainda é reconhecível. Marca Mutante é uma maneira de dar uma nova aparência à sua identidade sem alterar completamente a identidade.',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text('Crie sua marca mutante aqui:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                        ElevatedButton(
                        onPressed: () => Navigator.pushNamed(context, '/questionary'),
                        child: Text('Gerar'),
                      ),
                    ],
                  ),
                ),
              ),
            )
           ],
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}

class SideDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Image.asset('assets/images/SpB2.png'),
            ),
            decoration: BoxDecoration(
              color: Colors.blue[200],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => {Navigator.pushNamed(context, '/menu')},
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('O que é o SpB?'),
            onTap: () => {Navigator.pushNamed(context, '/spb')},
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Perfil'),
            onTap: () => {Navigator.pushNamed(context, '/profile')},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Criar marca'),
            onTap: () => {Navigator.pushNamed(context, '/questionary')},
          ),
        ],
      ),
    );
  }
}
