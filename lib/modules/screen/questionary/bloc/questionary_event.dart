import 'package:flutter/material.dart';
import 'package:marca_spb/models/brand.dart';

abstract class QuestionaryPageEvent {
  const QuestionaryPageEvent();
}

@immutable
class QuestionaryPageStart extends QuestionaryPageEvent {
  const QuestionaryPageStart();
}

@immutable
class QuestionaryPageUpdateDignidade extends QuestionaryPageEvent {
  final Brand dignidade;
  const QuestionaryPageUpdateDignidade(this.dignidade);
}

@immutable
class QuestionaryPageUpdateConfianca extends QuestionaryPageEvent {
  final Brand confianca;
  const QuestionaryPageUpdateConfianca(this.confianca);
}

@immutable
class QuestionaryPageUpdateEmpoderamento extends QuestionaryPageEvent {
  final Brand empoderamento;
  const QuestionaryPageUpdateEmpoderamento(this.empoderamento);
}

@immutable
class QuestionaryPageUpdateTransformacao extends QuestionaryPageEvent {
  final Brand transformacao;
  const QuestionaryPageUpdateTransformacao(this.transformacao);
}

@immutable
class QuestionaryPageUpdateCidadania extends QuestionaryPageEvent {
  final Brand cidadania;
  const QuestionaryPageUpdateCidadania(this.cidadania);
}

@immutable
class QuestionaryPageError extends QuestionaryPageEvent {
  final String message;
  const QuestionaryPageError(this.message);
}
