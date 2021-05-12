import 'package:bloc/bloc.dart';
import 'package:marca_spb/models/brand.dart';
import 'package:marca_spb/modules/screen/questionary/bloc/questionary_event.dart';
import 'package:marca_spb/modules/screen/questionary/bloc/questionary_state.dart';

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
    } else if (event is QuestionaryPageUpdateEmpoderamento) {
      try {
        yield LoadingState();
        yield* _updatingEmpoderamentoToState(event);
      } catch (error) {
        yield state;
      }
    } else if (event is QuestionaryPageUpdateTransformacao) {
      try {
        yield LoadingState();
        yield* _updatingTransformacaoToState(event);
      } catch (error) {
        yield state;
      }
    } else if (event is QuestionaryPageUpdateCidadania) {
      try {
        yield LoadingState();
        yield* _updatingCidadaniaToState(event);
      } catch (error) {
        yield state;
      }
    } else if (event is QuestionaryPageUpdateSolidezIndex) {
      try {
        yield LoadingState();
        yield* _updatingSolidezIndexToState(event);
      } catch (error) {
        yield state;
      }
    } else if (event is QuestionaryPageUpdateTransformacaoIndex) {
      try {
        yield LoadingState();
        yield* _updatingTransformacaoIndexToState(event);
      } catch (error) {
        yield state;
      }
    } else if (event is QuestionaryPageUpdateUniaoIndex) {
      try {
        yield LoadingState();
        yield* _updatingUniaoIndexToState(event);
      } catch (error) {
        yield state;
      }
    }
  }

  Stream<QuestionaryState> _mapBrandLoadedToState() async* {
    try {
      var marca = await Future.delayed(Duration(seconds: 0), () {
        Brand marca = Brand(
          cidadania: false,
          confianca: false,
          dignidade: false,
          empoderamento: false,
          transformacao: false,
          solidezIndex: false,
          transformacaoIndex: false,
          uniaoIndex: false,
          index: 0,
        );

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

  Stream<QuestionaryState> _updatingEmpoderamentoToState(
      QuestionaryPageUpdateEmpoderamento event) async* {
    try {
      Brand marca = event.empoderamento;
      marca.empoderamento = !marca.empoderamento;
      yield LoadedSucessState(marca);
    } catch (error) {
      yield ErrorState('Cannot Change Brand Qualities');
    }
  }

  Stream<QuestionaryState> _updatingTransformacaoToState(
      QuestionaryPageUpdateTransformacao event) async* {
    try {
      Brand marca = event.transformacao;
      marca.transformacao = !marca.transformacao;
      yield LoadedSucessState(marca);
    } catch (error) {
      yield ErrorState('Cannot Change Brand Qualities');
    }
  }

  Stream<QuestionaryState> _updatingCidadaniaToState(
      QuestionaryPageUpdateCidadania event) async* {
    try {
      Brand marca = event.cidadania;
      marca.cidadania = !marca.cidadania;
      yield LoadedSucessState(marca);
    } catch (error) {
      yield ErrorState('Cannot Change Brand Qualities');
    }
  }

  Stream<QuestionaryState> _updatingSolidezIndexToState(
      QuestionaryPageUpdateSolidezIndex event) async* {
    try {
      Brand marca = event.solidezIndex;
      marca.solidezIndex = !marca.solidezIndex;
      marca.index = 2;
      yield LoadedSucessState(marca);
    } catch (error) {
      yield ErrorState('Cannot Change Brand Qualities');
    }
  }

  Stream<QuestionaryState> _updatingTransformacaoIndexToState(
      QuestionaryPageUpdateTransformacaoIndex event) async* {
    try {
      Brand marca = event.transformacaoIndex;
      marca.transformacaoIndex = !marca.transformacaoIndex;
      marca.index = 1;
      yield LoadedSucessState(marca);
    } catch (error) {
      yield ErrorState('Cannot Change Brand Qualities');
    }
  }

  Stream<QuestionaryState> _updatingUniaoIndexToState(
      QuestionaryPageUpdateUniaoIndex event) async* {
    try {
      Brand marca = event.uniaoIndex;
      marca.uniaoIndex = !marca.uniaoIndex;
      marca.index = 0;
      yield LoadedSucessState(marca);
    } catch (error) {
      yield ErrorState('Cannot Change Brand Qualities');
    }
  }
}
