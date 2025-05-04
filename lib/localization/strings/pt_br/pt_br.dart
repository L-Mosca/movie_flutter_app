import 'package:movie_flutter_app/localization/strings/app_localization.dart';

class PtBr extends AppLocalization {
  @override String get appName => "Movie App";

  // Register page
  @override String get welcome => "Bem-vindo(a) ao";
  @override String get getAllFeatures => "Cadastre-se para utilizar todas as funcionalidades do App";
  @override String get name => "Nome";
  @override String get email => "E-mail";
  @override String get password => "Senha";
  @override String get confirmPassword => "Confirmar senha";
  @override String get register => "Cadastrar";
  @override String get hasAccount => "Já tem uma conta?";
  @override String get clickHere => "Clique aqui";
  @override String get registerError => "Ocorreu um erro no cadastro";
  @override String get registerSuccess => "Cadastro realizado com sucesso";
  @override String get emptyName => "Preencha o nome";
  @override String get emptyEmail => "Preencha o e-mail";
  @override String get invalidEmail => "E-mail inválido";
  @override String get emptyPasswords => "Preencha os campos de senha";
  @override String get invalidPassword => "Senhas inválidas";

  // Login Page
  @override String get signInToContinue => "Entre para continuar";
  @override String get dontHaveAccount => "Não tem uma conta?";
  @override String get loginError => "Erro ao realizar login";
  @override String get emptyPassword => "Digite uma senha";
  @override String get loginSuccess => "Login realizado com sucesso";
  @override String get or => "Ou";
  @override String get login => "Entrar";
}