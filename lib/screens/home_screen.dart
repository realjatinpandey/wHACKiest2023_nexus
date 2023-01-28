import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nexus_alpha/firebase/f_read.dart';
import '/models/article_model.dart';
import '/screens/screens.dart';
import '/widgets/custom_tag.dart';

import '../widgets/bottom_nav_bar.dart';
import '../widgets/image_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    Article article = Article.articles[0];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'nexus',
        ),
        foregroundColor: Colors.white,
        centerTitle: true,
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: const Icon(
        //     Icons.menu,
        //     color: Colors.white,
        //   ),
        // ),
      ),
      bottomNavigationBar: BottomNavBar(index: 0),
      extendBodyBehindAppBar: true,
      body: ListView(padding: EdgeInsets.zero, children: [
        _NewsOfTheDay(article: article),
        SizedBox(
          height: 20.0,
        ),
        _BreakingNews(articles: Article.articles),
      ]),
    );
  }
}

class _BreakingNews extends StatefulWidget {
  const _BreakingNews({
    Key? key,
    required this.articles,
  }) : super(key: key);

  final List<Article> articles;

  @override
  State<_BreakingNews> createState() => _BreakingNewsState();
}

class _BreakingNewsState extends State<_BreakingNews> {
  final db = FirebaseFirestore.instance;
  List<String> imgs = [];

  Future<void> getData() async {
    var collection = FirebaseFirestore.instance.collection('year1');
    var docSnapshot = await collection.doc('important').get();
    if (docSnapshot.exists) {
      Map<String, dynamic>? data = docSnapshot.data();
      var value = data?['listA'];
      for (var item in value) {
        Map<String, dynamic> itemM = item;

        debugPrint(item.toString());
        imgs.add(itemM['img']);
        debugPrint("\n\n\n${item['source']}");
      }
      debugPrint('\n\n\n\n bang bang${imgs.toString()}');
      // debugPrint(value.toString());
    }
  }

  // Future<void> createData() async {
  //   final docUser =
  //       FirebaseFirestore.instance.collection('year1').doc('academics');

  //   final Map<String, dynamic> jsonD = {
  //     'listA': [
  //       {
  //         'img':
  //             'https://images.unsplash.com/photo-1581726707445-75cbe4efc586?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=876&q=80',
  //         'time': '2 Jan 23',
  //         'source': 'HOD, CSE',
  //         'title':
  //             'Lorem ipsum dolor sit amet, consectetur a  dipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore ',
  //         'article':
  //             'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
  //       },
  //     ]
  //   };
  //   await docUser.update(jsonD);
  // }

  @override
  void initState() {
    // getData();
    // createData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Notices',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/discover');
                  },
                  child: Text('More',
                      style: Theme.of(context).textTheme.bodyLarge)),
            ],
          ),
          const SizedBox(height: 25),
          // StreamBuilder<QuerySnapshot>(
          //   stream: db.collection('year1').snapshots(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       return ListView.builder(
          //         scrollDirection: Axis.horizontal,
          //         itemCount: widget.articles.length,
          //         itemBuilder: (context, index) {
          //           return Container(
          //             width: MediaQuery.of(context).size.width * 0.5,
          //             margin: const EdgeInsets.only(right: 10),
          //             child: InkWell(
          //               onTap: () {
          //                 Navigator.pushNamed(
          //                   context,
          //                   ArticleScreen.routeName,
          //                   arguments: widget.articles[index],
          //                 );
          //               },
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   ImageContainer(
          //                     width: MediaQuery.of(context).size.width * 0.5,
          //                     imageUrl: widget.articles[index].imageUrl,
          //                   ),
          //                   const SizedBox(height: 10),
          //                   Text(
          //                     widget.articles[index].title,
          //                     maxLines: 2,
          //                     style: Theme.of(context)
          //                         .textTheme
          //                         .bodyLarge!
          //                         .copyWith(
          //                             fontWeight: FontWeight.bold, height: 1.5),
          //                   ),
          //                   const SizedBox(height: 5),
          //                   Text(
          //                       '${DateTime.now().difference(widget.articles[index].createdAt).inHours} hours ago',
          //                       style: Theme.of(context).textTheme.bodySmall),
          //                   const SizedBox(height: 5),
          //                   Text('by ${widget.articles[index].author}',
          //                       style: Theme.of(context).textTheme.bodySmall),
          //                 ],
          //               ),
          //             ),
          //           );
          //         },
          //       );
          //     }
          //     return Center(
          //       child: CircularProgressIndicator(),
          //     );
          //   },
          // ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.articles.length,
              itemBuilder: (context, index) {
                return Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  margin: const EdgeInsets.only(right: 10),
                  child: InkWell(
                    onTap: () {
                      // debugPrint('\n\n\n\ninkwell${imgs[index]}');
                      Navigator.pushNamed(
                        context,
                        ArticleScreen.routeName,
                        arguments: widget.articles[index],
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ImageContainer(
                          width: MediaQuery.of(context).size.width * 0.5,
                          // imageUrl: imgs[index]!=null ? O
                          imageUrl: widget.articles[index].imageUrl,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          widget.articles[index].title,
                          maxLines: 2,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontWeight: FontWeight.bold, height: 1.5),
                        ),
                        const SizedBox(height: 5),
                        Text(
                            '${DateTime.now().difference(widget.articles[index].createdAt).inHours} hours ago',
                            style: Theme.of(context).textTheme.bodySmall),
                        const SizedBox(height: 5),
                        Text('by ${widget.articles[index].author}',
                            style: Theme.of(context).textTheme.bodySmall),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _NewsOfTheDay extends StatelessWidget {
  const _NewsOfTheDay({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return ImageContainer(
      borderRadius: 25,

      height: MediaQuery.of(context).size.height * 0.45,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 20.0,
      ),
      // decoration: BoxDecoration(
      //   color: Colors.black54,
      //   borderRadius: BorderRadius.circular(
      //     20.0,
      //   ),
      // ),
      imageUrl:
          'https://d2e9h3gjmozu47.cloudfront.net/Banner/ramaiah-our-logo-featured.jpg',
      // 'https://images.unsplash.com/photo-1602432893593-466bf35ad685?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=801&q=80',
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTag(
            backgroundColor: Colors.grey.withAlpha(150),
            children: [
              Text(
                'MSRIT',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            'All important notices at one place!',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold, height: 1.25, color: Colors.white),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(padding: EdgeInsets.zero),
            child: Row(
              children: [
                // Text(
                //   'Learn More',
                //   style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                //         color: Colors.white,
                //       ),
                // ),
                // const SizedBox(width: 10),
                // const Icon(
                //   Icons.arrow_right_alt,
                //   color: Colors.white,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
