import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marca_spb/models/brand.dart';
import 'package:marca_spb/modules/screen/questionary/bloc/questionary_bloc.dart';
import 'package:marca_spb/modules/screen/questionary/bloc/questionary_event.dart';
import 'package:marca_spb/modules/screen/questionary/bloc/questionary_state.dart';
import 'package:marca_spb/modules/screen/questionary/components/switch_quality.dart';
import 'package:marca_spb/modules/screen/user_profile/bloc/profile_bloc.dart';
import 'package:marca_spb/modules/screen/user_profile/components/circular_loading.dart';

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
                title: Text('Questionario'),
              ),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      'Selecione 3 ou mais das caracteristicas apresentadas que mais representa sua empresa:',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 20),
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
                                value: state.qualities.empoderamento,
                                onChanged: (value) {
                                  _bloc.add(QuestionaryPageUpdateEmpoderamento(
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
                                  _bloc.add(QuestionaryPageUpdateTransformacao(
                                      state.qualities));
                                },
                              ),
                              Text('Transformação')
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
                          List values = [
                            state.qualities.cidadania,
                            state.qualities.confianca,
                            state.qualities.dignidade,
                            state.qualities.empoderamento,
                            state.qualities.transformacao,
                          ];
                          var counter =
                              values.where((element) => element == true).length;

                          if (counter >= 3) {
                            print(
                                'Valor da dignidade é:${state.qualities.dignidade}');
                            print(
                                'Valor da confianca é:${state.qualities.confianca}');
                          } else {
                            showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                      title: new Text("Erro"),
                                      content: new Text(
                                          "Você selecionou menos que 3 caracteristicas"),
                                      actions: <Widget>[
                                        FlatButton(
                                          child: Text('Fechar'),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        )
                                      ],
                                    ));
                          }
                        },
                      ),
                    )
                  ],
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
