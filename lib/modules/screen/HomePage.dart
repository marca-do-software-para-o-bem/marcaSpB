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
            onTap: () => {Navigator.pushNamed(context, '/profile')},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Criar marca'),
            onTap: () => {Navigator.pushNamed(context, '/questionary')},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Editar SpB'),
            onTap: () => {Navigator.pushNamed(context, '/generate')},
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
