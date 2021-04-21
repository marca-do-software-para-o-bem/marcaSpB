import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        title: Text('Marca Mutante'),
        backgroundColor: Colors.blue[400],
      ),
      body: Center(
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
              child: Text(
                'Marca Mutante',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.black, fontSize: 25),
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue[400],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () => {Navigator.pushNamed(context, '/menu')},
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Perfil'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Criar marca'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => Navigator.of(context).pop(),
            ),
        ],
      ),
    );
  }
}