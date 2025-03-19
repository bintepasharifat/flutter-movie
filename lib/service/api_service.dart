import 'dart:convert';

import 'package:flutter_movie/constants/constants.dart';
import 'package:flutter_movie/model/movie_model.dart';
import 'package:http/http.dart';

enum MovieType {nowPlaying, popular,topRated,upcoming,}

class ApiService {

  Future<List<MovieModel>> getMovieData(MovieType type)async{
    String url ="";

    if(type == MovieType.nowPlaying){
      url =kmovieDbURL + know_playing;

    }else if(type == MovieType.popular){
      url = kmovieDbURL + kpopular;
    }else if(type == MovieType.topRated){
      url = kmovieDbURL + ktop_rated;
    }else if(type == MovieType.upcoming){
      url = kmovieDbURL + kupcoming;

      
   
    }
    
    try{
      Response response =await get(Uri.parse(url+"?api_key=3118572c07f2e3664bb2a464035926b9&language=en-US"));

      if(response.statusCode ==200){
        Map<String,dynamic>json =jsonDecode(response.body);
        List<dynamic>body =json['results'];
        List<MovieModel>movieList =
        body.map((item) =>MovieModel.fromJson(item)).toList();
        return movieList;

      }else{
        throw ("no movie found");
      }

    }catch(e){
      throw e.toString();
    }
  }
}
