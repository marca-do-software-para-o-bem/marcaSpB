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
          Icon(LineAwesomeIcons.square_full, color: Colors.blue[700], size: 32,),
          Icon(MdiIcons.squareRounded, color: Color.fromARGB(255, 255, 20, 147), size: 32),
          Icon(Icons.circle, color: Color.fromARGB(255, 149, 193, 31), size: 32,)
        ],
        title: Text('Marca Mutante'),
        backgroundColor: Colors.blue[400],
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Clique para gerar uma nova'),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/questionary'),
              child: Text('Clica aqui'),
            ),
          ],
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
