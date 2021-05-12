import 'package:flutter/material.dart';
import 'package:marca_spb/constants/menu_list_item.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Marca Mutante'),
        backgroundColor: Colors.blue[400],
      ),
       body: Column(
              children: <Widget>[
                SizedBox(height: 50),
                //header,
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      InkWell(
                        child: MenuListItem(
                          icon: LineAwesomeIcons.home,
                          text: 'Home',
                        ),
                        onTap:() => Navigator.pushNamed(context, '/menu'),
                      ),
                      InkWell(
                        child: MenuListItem(
                          icon: LineAwesomeIcons.user,
                          text: 'Perfil',
                        ),
                        onTap:() => Navigator.pushNamed(context, '/profile'),
                      ),
                      InkWell(
                        child: MenuListItem(
                          icon: LineAwesomeIcons.edit,
                          text: 'Criar Marca',                      
                        ),
                        onTap:() => Navigator.pushNamed(context, '/questionary'),
                      ),
                      InkWell(
                        child: MenuListItem(
                          icon: LineAwesomeIcons.alternate_sign_out,
                          text: 'Logout',
                          hasNavigation: false,
                        ),
                        onTap:() => Navigator.of(context).pop(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
  }
}