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
                      'Selecione 3 das caracteristicas apresentadas que mais representa sua empresa:',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 10, 0, 0),
                      child: Column(
                        children: [
                          Switch(
                            value: state.qualities.dignidade,
                            onChanged: (value) {
                              _bloc.add(QuestionaryPageUpdateDignidade(
                                  state.qualities));
                              print('${state.qualities.dignidade}');
                            },
                          ),
                          Switch(
                            value: state.qualities.confianca,
                            onChanged: (value) {
                              print('${state.qualities.confianca}');
                              _bloc.add(QuestionaryPageUpdateConfianca(
                                  state.qualities));
                            },
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
                          print(
                              'Valor da dignidade é:${state.qualities.dignidade}');
                          print(
                              'Valor da confianca é:${state.qualities.confianca}');
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
