import 'dart:async';

class SignInBloc {
  final StreamController<bool> _isLoadingController = StreamController<bool>();
  // Tiene acceso al Stream pero no al controller
  Stream<bool> get isLoadingStream => _isLoadingController.stream;

  // De esta forma podemos cerrar nuestro Controller cuando SignInPage
  // es eliminada del 'Widget tree'
  void dispose() {
    _isLoadingController.close();
  }

  void setIsLoading(bool isLoading) => _isLoadingController.add(isLoading);
}
