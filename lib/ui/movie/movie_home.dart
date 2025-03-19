// 
// import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_movie/model/movie_model.dart';
import 'package:flutter_movie/service/api_service.dart';
import 'package:flutter_movie/ui/movie/components/movie_carousel.dart';

class MovieHome extends StatefulWidget {
  const MovieHome({super.key});

  @override
  State<MovieHome> createState() => _MovieHomeState();
}

class _MovieHomeState extends State<MovieHome> {
   ApiService apiService = ApiService();
  
    

  

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FutureBuilder(
            // future:apiService.getMovieData(MovieType.nowPlaying) , 
          builder: (context,snapshot){
            if(snapshot.hasData){
              List<MovieModel>moviedata =snapshot.data ??[];
              return MovieCarousel(movieList: moviedata,);
            }
            return Center(child: CircularProgressIndicator(),
            );
            
          },
            future:apiService.getMovieData(MovieType.nowPlaying) , 
          )
        ],
      ),
    );
  }
}
