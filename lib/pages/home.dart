import 'package:flutter/material.dart';
import 'package:sports_news/backend/function.dart';
import 'package:sports_news/components/appbar.dart';
import 'package:sports_news/components/newsbox.dart';
import 'package:sports_news/utils/colors.dart';
import 'package:sports_news/utils/constants.dart';
import 'package:sports_news/utils/text.dart';
import '../components/searchbar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List> news;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    news=fetchnews();
  }
  @override
  Widget build(BuildContext context) {
    var w=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: appbar(),
      // appBar:AppBar(title: Text("TechNewz",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),centerTitle: true,backgroundColor: AppColors.black),
      body: Column(
        children: [
          SearchBar(),
          Expanded(
            child: Container(
                width: w,
                child: FutureBuilder<List>(
                    future: fetchnews(),
                    builder: (context,snapshot){
                      if(snapshot.hasData){
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context,index){
                              return NewsBox(
                                url: snapshot.data![index]['url'],
                                imageurl: snapshot.data![index]['urlToImage']!=null?snapshot.data![index]['urlToImage']:Constant.imgurl,
                                title: snapshot.data![index]['title'],
                                time: snapshot.data![index]['publishedAt'],
                                description: snapshot.data![index]['description'].toString(),
                              );
                            }
                        );
                      }
                      else if(snapshot.hasError){
                        return Text("${snapshot.error}");
                      }
                      return Center(
                        child: CircularProgressIndicator(color: AppColors.primary,),
                      );
                    }

                )
            ),
          )
        ],
      ),
    );
  }
}
