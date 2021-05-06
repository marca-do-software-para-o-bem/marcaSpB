import 'package:bloc/bloc.dart';
import 'package:marca_spb/models/brand.dart';
import 'package:marca_spb/models/user.dart';
import 'package:marca_spb/modules/screen/questionary/bloc/questionary_event.dart';
import 'package:marca_spb/modules/screen/questionary/bloc/questionary_state.dart';
import 'package:marca_spb/utils/services/user/user_services.dart';

class QuestionaryPageBloc extends Bloc<QuestionaryPageEvent, QuestionaryState> {
  QuestionaryPageBloc(QuestionaryState initialState) : super(initialState);
  QuestionaryState state;

  Stream<QuestionaryState> mapEventToState(event) async* {
    if (event is QuestionaryPageStart) {
      try {
        yield LoadingState();
        yield* _mapBrandLoadedToState();
      } catch (error) {
        yield state;
      }
    } else if (event is QuestionaryPageUpdateDignidade) {
      try {
        yield LoadingState();
        yield* _updatingDignidadeToState(event);
      } catch (error) {
        yield state;
      }
    } else if (event is QuestionaryPageUpdateConfianca) {
      try {
        yield LoadingState();
        yield* _updatingConfiancaToState(event);
      } catch (error) {
        yield state;
      }
    }
  }

  Stream<QuestionaryState> _mapBrandLoadedToState() async* {
    try {
      var marca = await Future.delayed(Duration(seconds: 3), () {
        Brand marca = Brand(
            cidadania: false,
            confianca: false,
            dignidade: false,
            empoderamento: false,
            transformacao: false);

        return marca;
      });
      yield LoadedSucessState(marca);
    } catch (error) {
      yield ErrorState('Cannot Load Brand Qualities');
    }
  }

  Stream<QuestionaryState> _updatingDignidadeToState(
      QuestionaryPageUpdateDignidade event) async* {
    try {
      Brand marca = event.dignidade;
      marca.dignidade = !marca.dignidade;
      yield LoadedSucessState(marca);
    } catch (error) {
      yield ErrorState('Cannot Change Brand Qualities');
    }
  }

  Stream<QuestionaryState> _updatingConfiancaToState(
      QuestionaryPageUpdateConfianca event) async* {
    try {
      Brand marca = event.confianca;
      marca.confianca = !marca.confianca;
      yield LoadedSucessState(marca);
    } catch (error) {
      yield ErrorState('Cannot Change Brand Qualities');
    }
  }
}
