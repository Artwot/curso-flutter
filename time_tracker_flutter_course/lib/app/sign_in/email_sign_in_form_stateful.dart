import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../common_widgets/show_exception_alert_dialog.dart';
import '../services/auth.dart';
import '/app/sign_in/validators.dart';
import '/common_widgets/form_submit_button.dart';
import 'email_sign_in_model.dart';

class EmailSignInFormStateful extends StatefulWidget
    with EmailAndPasswordValidator {
  @override
  State<EmailSignInFormStateful> createState() =>
      _EmailSignInFormStatefulState();
}

class _EmailSignInFormStatefulState extends State<EmailSignInFormStateful> {
  // Crear controllers para los campos de texto
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  EmailSignInFormType _formType = EmailSignInFormType.signIn;

  // Obtener los controllers de los campos del formulario
  String get _email => _emailController.text;
  String get _password => _passwordController.text;

  bool _submitted = false;
  bool _isLoading = false;

  // El método dispose() es definido en el State de la clase.
  // Es invocado cuando un 'widget' es removido del 'widget tree'
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  void _submit() async {
    setState(() {
      _submitted = true;
      _isLoading = true;
    });
    // Condición para iniciar sesión o crear usuario
    try {
      final auth = Provider.of<AuthBase>(context, listen: false);
      if (_formType == EmailSignInFormType.signIn) {
        await auth.signInWithEmailAndPassword(_email, _password);
      } else {
        await auth.createUserWithEmailAndPassword(_email, _password);
      }
      Navigator.of(context).pop();
    } on FirebaseAuthException catch (e) {
      // Personalizar los widgets Dialog para cada plataforma
      showExceptionAlertDialog(
        context,
        title: 'Sign in failed',
        exception: e,
      );
    } finally {
      // finally se ejecuta en todos los casos: si se ejecuta o falla la instrucción
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _emailEditingComplete() {
    // Si el campo de email es invalido, no permite cambiar el focus del campo.
    final newFocus = widget.emailValidator.isValid(_email)
        ? _passwordFocusNode
        : _emailFocusNode;
    // Se traslada al siguiente campo del formulario
    FocusScope.of(context).requestFocus(newFocus);
  }

  // Intercambiar entre los textos mostrados
  void _toggleFormType() {
    setState(() {
      _submitted = false;
      _formType = _formType == EmailSignInFormType.signIn
          ? EmailSignInFormType.register
          : EmailSignInFormType.signIn;
    });
    _emailController.clear();
    _passwordController.clear();
  }

  List<Widget> _buildChildren() {
    // Seleccionar el tipo de texto
    final primaryText = _formType == EmailSignInFormType.signIn
        ? 'Sign in'
        : 'Create an account';
    final secondaryText = _formType == EmailSignInFormType.signIn
        ? 'Need an account? Register'
        : 'Have an account? Sign in';

    // Valida si _email y _password no son campos vacíos
    bool submitEnabled = widget.emailValidator.isValid(_email) &&
        widget.passwordValidator.isValid(_password) &&
        !_isLoading;

    return [
      // Campo Email
      _buildEmailTextField(),
      SizedBox(height: 8.0),
      // Campo Password
      _buildPasswordTextField(),
      SizedBox(height: 8.0),
      FormSubmitButton(
        text: primaryText,
        onPressed: submitEnabled ? _submit : null,
      ),
      SizedBox(height: 8.0),
      TextButton(
        child: Text(secondaryText),
        onPressed: !_isLoading ? _toggleFormType : null,
      )
    ];
  }

  TextField _buildPasswordTextField() {
    bool showErrorText =
        _submitted && !widget.passwordValidator.isValid(_password);
    return TextField(
      controller: _passwordController,
      focusNode: _passwordFocusNode,
      decoration: InputDecoration(
        labelText: 'Password',
        errorText: showErrorText ? widget.invalidPasswordErrorText : null,
        enabled: _isLoading == false,
      ),
      obscureText: true,
      onChanged: (password) => _updateState(),
      textInputAction: TextInputAction.done,
    );
  }

  TextField _buildEmailTextField() {
    bool showErrorText =
        _submitted && !widget.passwordValidator.isValid(_email);
    return TextField(
      controller: _emailController,
      focusNode: _emailFocusNode,
      decoration: InputDecoration(
        labelText: 'Email',
        hintText: 'test@test.com',
        errorText: showErrorText ? widget.invalidPasswordErrorText : null,
        enabled: _isLoading == false,
      ),
      // Quitar sugerencias en el teclado
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onChanged: (email) => _updateState(),
      onEditingComplete: _emailEditingComplete,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        // Hace que los widgets ocupen todo el espacio del contenedor
        crossAxisAlignment: CrossAxisAlignment.stretch,
        // Especifica cuánto espacio ocupa este Widget en el eje principal
        mainAxisSize: MainAxisSize.min,
        children: _buildChildren(),
      ),
    );
  }

  _updateState() {
    print("email is $_email, password is $_password");
    // Solo llamamos a setState() para actualizar el estado
    setState(() {});
  }
}