import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:time_tracker_flutter_course/app/services/auth.dart';
import 'package:time_tracker_flutter_course/app/sign_in/email_sign_in_model.dart';

class EmailSignInBloc {
  EmailSignInBloc({required this.auth});
  final AuthBase auth;

  final _modelSubject =
      BehaviorSubject<EmailSignInModel>.seeded(EmailSignInModel());
  Stream<EmailSignInModel> get modelStream => _modelSubject.stream;
  EmailSignInModel get _model => _modelSubject.value;

  void dispose() {
    _modelSubject.close();
  }

  /*
    Usar 'async' in BLoCS para:
    - Agregar valores a un stream
    - Llamar a servicios de métodos asíncronos
    - Retornar resultados o excepciones
    NOTA: No se permite código referente a la UI
  */
  Future<void> submit() async {
    updateWith(submitted: true, isLoading: true);
    // Condición para iniciar sesión o crear usuario
    try {
      if (_model.formType == EmailSignInFormType.signIn) {
        await auth.signInWithEmailAndPassword(_model.email, _model.password);
      } else {
        await auth.createUserWithEmailAndPassword(
            _model.email, _model.password);
      }
    } catch (e) {
      updateWith(isLoading: false);
      rethrow;
    }
  }

  void toggleFormType() {
    final formType = _model.formType == EmailSignInFormType.signIn
        ? EmailSignInFormType.register
        : EmailSignInFormType.signIn;
    updateWith(
      email: '',
      password: '',
      formType: formType,
      isLoading: false,
      submitted: false,
    );
  }

  void updateEmail(String email) => updateWith(email: email);

  void updatePassword(String password) => updateWith(password: password);

  void updateWith({
    String? email,
    String? password,
    EmailSignInFormType? formType,
    bool? isLoading,
    bool? submitted,
  }) {
    // Actualizar el modelo
    // Con BehaviorSubject podemos acceder al valor mas reciente del stream sincronizadamente
    _modelSubject.value = _model.copyWith(
      email: email,
      password: password,
      formType: formType,
      isLoading: isLoading,
      submitted: submitted,
    );
  }
}
