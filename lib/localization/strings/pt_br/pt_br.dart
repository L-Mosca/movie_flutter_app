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
  @override String get nameMinChar => "Nome deve possuir pelo menos 3 caracteres";
  @override String get nameMaxChar => "Nome deve possuir no máximo 50 caracteres";
  @override String get emptyEmail => "Preencha o e-mail";
  @override String get invalidEmail => "E-mail inválido";
  @override String get emptyPasswords => "Preencha os campos de senha";
  @override String get invalidPassword => "Senhas inválidas";
  @override String get eightChar => "8 caracteres";
  @override String get upperLetter => "Maiúscula";
  @override String get lowerLetter => "Minúscula";
  @override String get number => "Número";
  @override String get special => "Especial";
  @override String get typeAllFields => "Preencha todos os campos corretamente";

  // Login Page
  @override String get signInToContinue => "Entre para continuar";
  @override String get dontHaveAccount => "Não tem uma conta?";
  @override String get loginError => "Erro ao realizar login";
  @override String get emptyPassword => "Digite uma senha";
  @override String get loginSuccess => "Login realizado com sucesso";
  @override String get or => "Ou";
  @override String get login => "Entrar";

  // Settings Page
  @override String get settings => "Configurações";
  @override String get useAllAppFeatures => "Faça login para utilizar todos os recursos do app";
  @override String get useTerms => "Termos de uso";
  @override String get privacyPolicies => "Políticas de privacidade";
  @override String get portuguese => "Português (Brasil)";
  @override String get english => "Inglês";
  @override String get exit => "Sair";
  @override String get wouldLikeToExit => "Deseja sair do App?";

  // Home Page
  @override String get searchMovie => "Buscar filme";
  @override String get movieNotFound => "Nenhum filme encontrado";
  @override String get nonMatchResponse => "Parece que nenhum resultado foi encontrado para:";
  @override String get anErrorOccurred => "Ocorreu um erro";
  @override String get fetchMovieError => "Ocorreu um erro ao tentar buscar pelos seus filmes, tente novamente mais tarde";
  @override String get reload => "Recarregar";

  // Movie Detail
  @override String get duration => "Duração";
  @override String get director => "Diretor";
  @override String get trailer => "Trailer";
  @override String get casting => "Atores";
}