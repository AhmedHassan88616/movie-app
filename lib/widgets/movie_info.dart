import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movies_app/bloc/get_movie_details_bloc.dart';
import 'package:movies_app/models/movie_detail_response.dart';
import 'package:movies_app/models/movie_details.dart';
import '../style/theme.dart' as Style;

class MovieInfo extends StatefulWidget {
  final int id;

  MovieInfo({Key key, @required this.id}) : super(key: key);

  @override
  _MovieInfoState createState() => _MovieInfoState(id);
}

class _MovieInfoState extends State<MovieInfo> {
  final int id;

  _MovieInfoState(this.id);

  @override
  void initState() {
    movieDetailsBloc.getMovieDetails(id);
    super.initState();
  }

  @override
  void dispose() {
    movieDetailsBloc..drainStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<MovieDetailResponse>(
      stream: movieDetailsBloc.subject.stream,
      builder: (ctx, AsyncSnapshot<MovieDetailResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return _buildErrorWidget(snapshot.data.error.toString());
          }
          return _buildVideosWidget(snapshot.data);
        } else if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.data.error.toString());
        } else {
          return _buildLoadingWidget();
        }
      },
    );
  }

  Widget _buildLoadingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 25.0,
            width: 25.0,
            child: CircularProgressIndicator(),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorWidget(String error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 25.0,
            width: 25.0,
            child: Text("Error occurred : $error"),
          ),
        ],
      ),
    );
  }

  Widget _buildVideosWidget(MovieDetailResponse data) {
    MovieDetails movieDetails = data.movieDetails;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'BUDGET',
                    style: TextStyle(
                      color: Style.Colors.titleColor,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    movieDetails.budget.toString() + '\$',
                    style: TextStyle(
                      color: Style.Colors.secondColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DURATION',
                    style: TextStyle(
                      color: Style.Colors.titleColor,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    movieDetails.runtime.toString() + 'min',
                    style: TextStyle(
                      color: Style.Colors.secondColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'RELEASE DATE',
                    style: TextStyle(
                      color: Style.Colors.titleColor,
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    movieDetails.releaseDate == null
                        ? 'null'
                        : movieDetails.releaseDate,
                    style: TextStyle(
                      color: Style.Colors.secondColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'GENRES',
                style: TextStyle(
                  color: Style.Colors.titleColor,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          height: 30.0,
          padding: EdgeInsets.only(
            left: 10.0,
            right: 10.0,
            top: 5.0,
          ),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movieDetails.genres.length,
            itemBuilder: (ctx, index) {
              return Padding(
                padding: EdgeInsets.only(right: 18.0),
                child: Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                    border: Border.all(width: 1.0, color: Colors.white),
                  ),
                  child: Text(
                    movieDetails.genres[index].name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                      fontSize: 9.0,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
