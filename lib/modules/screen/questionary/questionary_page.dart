import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:marca_spb/models/brand.dart';
import 'package:marca_spb/modules/screen/questionary/bloc/questionary_bloc.dart';
import 'package:marca_spb/modules/screen/questionary/bloc/questionary_event.dart';
import 'package:marca_spb/modules/screen/questionary/bloc/questionary_state.dart';
import 'package:marca_spb/modules/screen/user_profile/components/circular_loading.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

const String _APPBARTITLE = 'Profile';

class QuestionaryPage extends StatelessWidget {
  final Bloc _bloc = QuestionaryPageBloc(EmptyState());

  QuestionaryPage() {
    _bloc.add(QuestionaryPageStart());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: _bloc,
        builder: (context, state) {
          if (state is LoadingState) {
            return CircularProgressIndicator();
          }
          if (state is LoadedSucessState) {
            return Scaffold(
              appBar: AppBar(
                actions: <Widget>[
                  Icon(LineAwesomeIcons.square_full,
                      color: Color.fromARGB(255, 0, 191, 255), size: 32),
                  Icon(MdiIcons.squareRounded,
                      color: Color.fromARGB(255, 255, 20, 147), size: 32),
                  Icon(
                    Icons.circle,
                    color: Color.fromARGB(255, 149, 193, 31),
                    size: 32,
                  )
                ],
                title: Text('Questionario'),
                backgroundColor: Colors.green,
              ),
              body: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Selecione uma ou mais das caracteristicas abaixo, das quais você vê no seu projeto:',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 10, 0, 0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Switch(
                                  value: state.qualities.confianca,
                                  onChanged: (value) {
                                    _bloc.add(QuestionaryPageUpdateConfianca(
                                        state.qualities));
                                  },
                                ),
                                Text('Confiança')
                              ],
                            ),
                            Row(
                              children: [
                                Switch(
                                  value: state.qualities.cidadania,
                                  onChanged: (value) {
                                    _bloc.add(QuestionaryPageUpdateCidadania(
                                        state.qualities));
                                  },
                                ),
                                Text('Cidadania')
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Selecione uma ou mais das caracteristicas abaixo, das quais você gostaria que as pessoas vissem no seu projeto:',
                        style: TextStyle(fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 10, 0, 0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Switch(
                                  value: state.qualities.dignidade,
                                  onChanged: (value) {
                                    _bloc.add(QuestionaryPageUpdateDignidade(
                                        state.qualities));
                                  },
                                ),
                                Text('Dignidade'),
                              ],
                            ),
                            Row(
                              children: [
                                Switch(
                                  value: state.qualities.empoderamento,
                                  onChanged: (value) {
                                    _bloc.add(
                                        QuestionaryPageUpdateEmpoderamento(
                                            state.qualities));
                                  },
                                ),
                                Text('Empoderamento')
                              ],
                            ),
                            Row(
                              children: [
                                Switch(
                                  value: state.qualities.transformacao,
                                  onChanged: (value) {
                                    _bloc.add(
                                        QuestionaryPageUpdateTransformacao(
                                            state.qualities));
                                  },
                                ),
                                Text('Transformação')
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Selecione a caracteristica que define o time do seu projeto:',
                        style: TextStyle(fontSize: 20),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 10, 0, 0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Switch(
                                  value: state.qualities.solidezIndex,
                                  onChanged: (value) {
                                    if (!state.qualities.transformacaoIndex &&
                                        !state.qualities.uniaoIndex) {
                                      _bloc.add(
                                        QuestionaryPageUpdateSolidezIndex(
                                            state.qualities),
                                      );
                                    }
                                  },
                                ),
                                Text('Solidez'),
                              ],
                            ),
                            Row(
                              children: [
                                Switch(
                                  value: state.qualities.transformacaoIndex,
                                  onChanged: (value) {
                                    if (!state.qualities.solidezIndex &&
                                        !state.qualities.uniaoIndex) {
                                      _bloc.add(
                                        QuestionaryPageUpdateTransformacaoIndex(
                                            state.qualities),
                                      );
                                    }
                                  },
                                ),
                                Text('Transformação')
                              ],
                            ),
                            Row(
                              children: [
                                Switch(
                                  value: state.qualities.uniaoIndex,
                                  onChanged: (value) {
                                    if (!state.qualities.transformacaoIndex &&
                                        !state.qualities.solidezIndex) {
                                      _bloc.add(
                                        QuestionaryPageUpdateUniaoIndex(
                                            state.qualities),
                                      );
                                    }
                                  },
                                ),
                                Text('União')
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                      Card(
                        color: Colors.green,
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
                            int counterSquare =
                                _validateSquareQualities(state.qualities);
                            int counterCircle =
                                _validateCircleQualities(state.qualities);
                            int counterIndex =
                                _validateIndexQualities(state.qualities);

                            if (counterSquare >= 1 &&
                                counterCircle >= 1 &&
                                counterIndex == 1) {
                              Navigator.pushNamed(context, '/generate',
                                  arguments: state.qualities);
                            } else {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: new Text("Resposta Inválida"),
                                  content: new Text(
                                      "Você deixou uma das questões sem responder. Volte e responda corretamente o questionário."),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('Fechar'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
          return CircularLoading(_getAppBar());
        });
  }
}

Widget _getAppBar() {
  return AppBar(
    title: Text(_APPBARTITLE),
    centerTitle: true,
    backgroundColor: Colors.red,
  );
}

int _validateSquareQualities(Brand brand) {
  List squareValues = [
    brand.cidadania,
    brand.confianca,
  ];

  var counterSquare = squareValues.where((element) => element == true).length;
  return counterSquare;
}

int _validateCircleQualities(Brand brand) {
  List circleValues = [
    brand.dignidade,
    brand.empoderamento,
    brand.transformacao,
  ];

  var counterCircle = circleValues.where((element) => element == true).length;
  return counterCircle;
}

int _validateIndexQualities(Brand brand) {
  List circleValues = [
    brand.solidezIndex,
    brand.transformacaoIndex,
    brand.uniaoIndex,
  ];

  var counterIndex = circleValues.where((element) => element == true).length;
  return counterIndex;
}
