import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:marca_spb/modules/screen/questionary/components/switch_quality.dart';

class QuestionaryPage extends StatelessWidget {
  final bool dignidade = false;
  bool confianca = false;
  bool empoderamento = false;
  bool transformacao = false;
  bool cidadania = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Questionario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Selecione 3 das caracteristicas apresentadas que mais representa sua empresa:',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 10, 0, 0),
              child: Column(
                children: [
                  SwitchQuality(
                    color: Colors.grey,
                    quality: 'Dignidade',
                    value: dignidade,
                  ),
                  SwitchQuality(
                    color: Colors.blue,
                    quality: 'Azul',
                    value: confianca,
                  ),
                  SwitchQuality(
                    color: Colors.purple,
                    quality: 'Roxo',
                    value: dignidade,
                  ),
                  SwitchQuality(
                    color: Colors.grey,
                    quality: 'Dignidade',
                    value: dignidade,
                  ),
                ],
              ),
            ),
            Spacer(),
            Card(
              color: Colors.blue,
              child: InkWell(
                child: Container(
                  height: MediaQuery.of(context).size.height * .08,
                  width: double.infinity,
                  child: Align(
                    child: Text(
                      'Gerar imagem',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                onTap: () {
                  print(dignidade);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
