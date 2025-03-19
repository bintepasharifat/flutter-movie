import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/model/movie_model.dart';
import 'package:flutter_movie/service/api_service.dart';

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
              return CarouselSlider(
  options: CarouselOptions(height: 400.0),
  items: [1,2,3,4,5].map((i) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          decoration: BoxDecoration(
            color: Colors.amber
          ),
          child: Text('text $i', style: TextStyle(fontSize: 16.0),)
        );
      },
    );
  }).toList(),
);
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
