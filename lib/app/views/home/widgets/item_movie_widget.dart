import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:the_movies_db/app/utils/constants.dart';
import 'package:the_movies_db/app/utils/custom_colors.dart';
import 'package:the_movies_db/app/utils/date_formatter.dart';

class ItemMovieWidget extends StatefulWidget {
  final String title;
  final String imageURL;
  final String date;
  final int voteAverage;
  const ItemMovieWidget({
    Key? key,
    required this.title,
    required this.imageURL,
    required this.voteAverage,
    required this.date,
  }) : super(key: key);

  @override
  State<ItemMovieWidget> createState() => _ItemMovieWidgetState();
}

class _ItemMovieWidgetState extends State<ItemMovieWidget> {
  selectColorPercentIndicator(int voteAverage) {
    if (voteAverage <= 80 && voteAverage > 70) {
      return Colors.green;
    } else if (voteAverage <= 70 && voteAverage >= 50) {
      return Colors.yellow;
    } else if (voteAverage < 50 && voteAverage >= 20) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 250,
            width: 150,
            child: Stack(
              children: [
                Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: Image.network(
                      "${Constants.API_IMAGE_URL}${widget.imageURL}",
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      fit: BoxFit.cover,
                      width: 150,
                      height: 225,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 15,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: CircularPercentIndicator(
                      radius: 25,
                      percent: widget.voteAverage / 100,
                      circularStrokeCap: CircularStrokeCap.round,
                      lineWidth: 4,
                      animation: true,
                      progressColor:
                          selectColorPercentIndicator(widget.voteAverage),
                      backgroundColor: CustomColors.tmdbGrey,
                      fillColor: CustomColors.tmdbDarkBlue,
                      center: Center(
                          child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: widget.voteAverage.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          WidgetSpan(
                            child: Transform.translate(
                              offset: const Offset(2, -7),
                              child: const Text(
                                '%',
                                textScaleFactor: 0.5,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          )
                        ]),
                      )),
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: InkWell(
                    onTap: () {
                      print("Exibir dialog");
                    },
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white.withOpacity(0.8),
                      ),
                      child: const Icon(
                        Icons.keyboard_control_sharp,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          Text(
            DateFormatter.formatDate(widget.date),
            style: const TextStyle(
              color: CustomColors.tmdbGrey,
            ),
          ),
        ],
      ),
    );
  }
}
