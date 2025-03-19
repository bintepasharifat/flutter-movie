import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie/constants/constants.dart';
import 'package:flutter_movie/model/movie_model.dart';

class MovieCarousel extends StatefulWidget {
  final List<MovieModel> movieList;
  const MovieCarousel({super.key, required this.movieList});

  @override
  State<MovieCarousel> createState() => _MovieCarouselState();
}

class _MovieCarouselState extends State<MovieCarousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        itemCount: widget.movieList.length,
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return CachedNetworkImage(
              width: double.infinity,
              fit: BoxFit.fill,
              placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(),
                  ),
              errorWidget: (context, url, error) => Icon(Icons.error),
              imageUrl: kmovieDbURL +
                  widget.movieList[itemIndex].posterPath.toString());
        },
        options: CarouselOptions(
            height: 180,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9));
  }
}
