import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class SpbPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Icon(
            MdiIcons.square,
            color: Colors.blue[700],
            size: 32,
          ),
          Icon(MdiIcons.squareRounded,
              color: Color.fromARGB(255, 255, 20, 147), size: 32),
          Icon(
            Icons.circle,
            color: Color.fromARGB(255, 149, 193, 31),
            size: 32,
          )
        ],
        title: Text('Software para o Bem'),
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
                      color: Colors.pink[300]),
                  padding: EdgeInsets.fromLTRB(30, 30, 30, 30),
                  child: Column(
                    children: [
                      Text(
                        'O que é o SpB?',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'O Spb é um coletivo, uma comunidade de pessoas e Organizações, significados, ações, soluções, sentimentos e energias sintonizadas para gerar o bem.',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '"O que nos importa são as pessoas"',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.green[300]),
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  child: Column(
                    children: [
                      Text(
                        'Quais são nossos objetivos?',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        '* Gerar soluções baseadas em software de impacto social positivo',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '* Construir uma rede sustentável de pessoas e organizações sintonizadas( internas e externas á UnB) e dispostas a fazer o bem para a comunidade(local, regional, nacional, mundial)',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "* Gerar inovação, tecnologias e evidências cinetíficas, destinadas a melhoria da qualidade de vida social",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '* Contribuir para a formação( humana e técnica) dos estudantes da UnB',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '* Fortalecer( identidade, recursos, equipes, organização) e concetar o conjunto de ações e projetos vinculdaos ao SPB',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '* Gerar soluções baseadas em software de impacto social positivo',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(MdiIcons.instagram),
                          SizedBox(width: 5),
                          Text('@softwareparaobem'),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            MdiIcons.square,
                            color: Colors.blue,
                          ),
                          Icon(
                            MdiIcons.squareRounded,
                            color: Colors.pink,
                          ),
                          Icon(
                            MdiIcons.circle,
                            color: Colors.green,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Icon(MdiIcons.web),
                      SizedBox(width: 5),
                      Text('www.softwareparaobem.com.br'),
                      SizedBox(width: 5),
                      Text(
                        '(Em Breve)',
                        style: TextStyle(color: Colors.red),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
