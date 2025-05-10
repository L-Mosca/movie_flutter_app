import 'package:movie_flutter_app/data/remote/helper/client_helper.dart';
import 'package:movie_flutter_app/domain/models/movie/movie_details.dart';
import 'package:movie_flutter_app/domain/models/movie/movie_home_response.dart';
import 'package:movie_flutter_app/domain/repositories/movie_repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final ClientHelper clientHelper;

  MovieRepositoryImpl({required this.clientHelper});

  @override
  Future<void> favoriteMovie({required int id}) async {}

  @override
  Future<MovieHomeResponse> getMovies({
    required int page,
    required int size,
    required String filter,
  }) async {
    //final body = MovieHomeBody.buildBody(page, size, filter);
    final list = <MovieBasicData>[];
    for (int i = 0; i < size; i++) {
      list.add(
        MovieBasicData(
          id: page + i,
          name: "Nome do filme",
          image:
              "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/5298bac0-b8bf-4c80-af67-725c1272dbb0/dgue2co-18e8b1c6-619f-4785-82fa-76c1766d3f0b.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzUyOThiYWMwLWI4YmYtNGM4MC1hZjY3LTcyNWMxMjcyZGJiMFwvZGd1ZTJjby0xOGU4YjFjNi02MTlmLTQ3ODUtODJmYS03NmMxNzY2ZDNmMGIuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.b5ZkPEYHEgaFL6_NF92VvWaC3w2uBVeGH6rpVwweY5c",
        ),
      );
    }
    final response = MovieHomeResponse(
      pageNumber: page,
      pageSize: size,
      totalPages: 3,
      list: list,
    );
    await Future.delayed(const Duration(seconds: 3));

    return response;
  }

  @override
  Future<void> removeFavoriteMovie({required int id}) async {}

  @override
  Future<MovieDetails?> getMovieById({required int id}) async {
    await Future.delayed(const Duration(seconds: 3));
    return MovieDetails(
      image: "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/5298bac0-b8bf-4c80-af67-725c1272dbb0/dgue2co-18e8b1c6-619f-4785-82fa-76c1766d3f0b.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzUyOThiYWMwLWI4YmYtNGM4MC1hZjY3LTcyNWMxMjcyZGJiMFwvZGd1ZTJjby0xOGU4YjFjNi02MTlmLTQ3ODUtODJmYS03NmMxNzY2ZDNmMGIuanBnIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.b5ZkPEYHEgaFL6_NF92VvWaC3w2uBVeGH6rpVwweY5c",
      title: "Nome do Filme",
      originalTitle: "Nome do Filme",
      rating: "7.2/10",
      duration: "1h22m",
      director: "Nome do Diretor",
      trailerLink: "link do trailer",
      actors: "Ator 1, Ator 2, Ator 3, Ator 4, Ator 5, Ator 6, Ator 7, Ator 8",
      synopsis: "Um texto muito longo para alongar o mock de uma resposta retornada da api para simular qual seria a sinopse de algum filme aleatório que foi retornado porque o usuário clicou em algum filme na lista anterior de filmes.\nDepois que a tela toda carregar (o que não vai demorar, pois esta resposta está mocada no software) o usuário poderá apreciar o belo design da tela desenvolvida por mim.\n\nUm texto muito longo para alongar o mock de uma resposta retornada da api para simular qual seria a sinopse de algum filme aleatório que foi retornado porque o usuário clicou em algum filme na lista anterior de filmes.\nDepois que a tela toda carregar (o que não vai demorar, pois esta resposta está mocada no software) o usuário poderá apreciar o belo design da tela desenvolvida por mim.\n\nUm texto muito longo para alongar o mock de uma resposta retornada da api para simular qual seria a sinopse de algum filme aleatório que foi retornado porque o usuário clicou em algum filme na lista anterior de filmes.\nDepois que a tela toda carregar (o que não vai demorar, pois esta resposta está mocada no software) o usuário poderá apreciar o belo design da tela desenvolvida por mim.\n\nUm texto muito longo para alongar o mock de uma resposta retornada da api para simular qual seria a sinopse de algum filme aleatório que foi retornado porque o usuário clicou em algum filme na lista anterior de filmes.\nDepois que a tela toda carregar (o que não vai demorar, pois esta resposta está mocada no software) o usuário poderá apreciar o belo design da tela desenvolvida por mim.\n\nUm texto muito longo para alongar o mock de uma resposta retornada da api para simular qual seria a sinopse de algum filme aleatório que foi retornado porque o usuário clicou em algum filme na lista anterior de filmes.\nDepois que a tela toda carregar (o que não vai demorar, pois esta resposta está mocada no software) o usuário poderá apreciar o belo design da tela desenvolvida por mim.",
    );
  }

  @override
  Future<void> deleteMovie({required int id}) async {
    await Future.delayed(const Duration(seconds: 3));
  }
}
