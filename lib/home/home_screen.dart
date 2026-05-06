import 'package:flutter/material.dart';
import 'package:news_app/core/app_colors.dart';
import 'package:news_app/home/tabs/tab_widget.dart';
import 'package:news_app/model/api_manager.dart';
import 'package:news_app/model/source_response.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<SourceResponse?> sourcesFuture;
  @override
  void initState() {
    super.initState();
    sourcesFuture = ApiManager.getSources();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: AppColors.whiteColor,
          child: Image.asset(
            'assets/images/pattern.png',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text(
              'News App',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(color: AppColors.whiteColor),
            ),
          ),
          body: FutureBuilder<SourceResponse?>(
            future: sourcesFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryLightColor,
                  ),
                );
              } else if (snapshot.hasError) {
                return Column(
                  children: [
                    const Text('Something Went Wrong'),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          sourcesFuture = ApiManager.getSources();
                        });
                      },
                      child: const Text('Try Again'),
                    ),
                  ],
                );
              }

              // server (response) => success , error
              if (snapshot.data == null) {
                return Column(
                  children: [
                    Text(snapshot.data!.message!),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          sourcesFuture = ApiManager.getSources();
                        });
                      },
                      child: const Text('Try Again'),
                    ),
                  ],
                );
              }
              var sourceList = snapshot.data!.sources!;
              return TabWidget(sourceList: sourceList,);
            },
          ),
        ),
      ],
    );
  }
}
