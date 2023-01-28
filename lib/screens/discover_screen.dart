import 'package:flutter/material.dart';
import 'package:nexus_alpha/screens/screens.dart';
import 'package:nexus_alpha/widgets/image_container.dart';

import '../models/article_model.dart';
import '../widgets/bottom_nav_bar.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  static const routeName = '/discover';
  @override
  Widget build(BuildContext context) {
    List<String> tabs = [
      'Academics',
      'Clubs/Events',
      'Fests',
    ];

    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          // title: Text(
          //   'nexus MSRIT',
          // ),

          centerTitle: true,
          // leading: IconButton(
          //   onPressed: () {},
          //   icon: const Icon(
          //     Icons.menu,
          //     color: Colors.black,
          //   ),
          // ),
        ),
        bottomNavigationBar: BottomNavBar(index: 1),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            // child: ListView(
            //   children: [const _DiscoverNews(), _CategoryNews(tabs: tabs)],
            // ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  children: [
                    const _DiscoverNews(),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [_CategoryNews(tabs: tabs)],
                ),
                ArticleList(),
                // Column(
                //   children: [
                //     ListView.builder(
                //       itemCount: 11,
                //       itemBuilder: (context, index) {
                //         return ListTile();
                //       },
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ArticleList extends StatelessWidget {
  const ArticleList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final articles = Article.articles;
    final articles2 = Article.articlesl2;
    return Expanded(
      child: ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5.0,
              horizontal: 5.0,
            ),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30), // <-- Radius
              ),
              color: Colors.grey.shade100,
              child: ListTile(
                title: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 5.0,
                  ),
                  child: Text(
                    articles[index].title,
                    maxLines: 3,
                    overflow: TextOverflow.clip,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          // fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                  ),
                ),
                leading: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0.0),
                  child: ImageContainer(
                    width: 80,
                    height: 80,
                    // margin: const EdgeInsets.all(2.0),
                    borderRadius: 2,
                    imageUrl: articles[index].imageUrl,
                  ),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 5.0,
                  ),
                  child: Text(
                    'by ${articles[index].author}',
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 5,
                ),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    ArticleScreen.routeName,
                    arguments: articles[index],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CategoryNews extends StatefulWidget {
  const _CategoryNews({
    Key? key,
    required this.tabs,
  }) : super(key: key);

  final List<String> tabs;

  @override
  State<_CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<_CategoryNews>
    with TickerProviderStateMixin {
  int _index = 0;
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: widget.tabs.length,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final articles = Article.articles;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TabBar(
              controller: _tabController,
              onTap: (value) {
                setState(() {
                  _index = _tabController.index;
                });
              },
              isScrollable: true,
              indicatorColor: Colors.black,
              tabs: widget.tabs
                  .map(
                    (tab) => Tab(
                      icon: Text(
                        tab,
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                      ),
                    ),
                  )
                  .toList(),
            ),
            SizedBox(
              height: 15,
            ),

            // SizedBox(
            //   height: MediaQuery.of(context).size.height,
            //   child: ListView.builder(
            //     itemCount: 50,
            //     itemBuilder: (context, index) {
            //       return ListTile(
            //         title: Text('Hello $index'),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
        // Column(
        //   children: [
        //     ListView.builder(
        //       itemCount: 11,
        //       itemBuilder: (context, index) {
        //         return ListTile();
        //       },
        //     ),
        //   ],
        // ),
        // Column(
        //   children: [
        //     SizedBox(
        //       height: MediaQuery.of(context).size.height,
        //       child: TabBarView(
        //         children: tabs
        //             .map(
        //               (tab) => ListView.builder(
        //                 shrinkWrap: true,
        //                 itemCount: articles.length,
        //                 itemBuilder: ((context, index) {
        //                   return InkWell(
        //                     onTap: () {
        //                       Navigator.pushNamed(
        //                         context,
        //                         ArticleScreen.routeName,
        //                         arguments: articles[index],
        //                       );
        //                     },
        //                     child: Row(
        //                       children: [
        //                         ImageContainer(
        //                           width: 80,
        //                           height: 80,
        //                           margin: const EdgeInsets.all(10.0),
        //                           borderRadius: 5,
        //                           imageUrl: articles[index].imageUrl,
        //                         ),
        //                         Expanded(
        //                           child: Column(
        //                             crossAxisAlignment:
        //                                 CrossAxisAlignment.start,
        //                             mainAxisAlignment: MainAxisAlignment.center,
        //                             children: [
        //                               Text(
        //                                 articles[index].title,
        //                                 maxLines: 2,
        //                                 overflow: TextOverflow.clip,
        //                                 style: Theme.of(context)
        //                                     .textTheme
        //                                     .bodyLarge!
        //                                     .copyWith(
        //                                       fontWeight: FontWeight.bold,
        //                                     ),
        //                               ),
        //                               const SizedBox(height: 10),
        //                               Row(
        //                                 children: [
        //                                   const Icon(
        //                                     Icons.schedule,
        //                                     size: 18,
        //                                   ),
        //                                   const SizedBox(width: 5),
        //                                   Text(
        //                                     '${DateTime.now().difference(articles[index].createdAt).inHours} hours ago',
        //                                     style:
        //                                         const TextStyle(fontSize: 12),
        //                                   ),
        //                                   const SizedBox(width: 20),
        //                                   const Icon(
        //                                     Icons.visibility,
        //                                     size: 18,
        //                                   ),
        //                                   const SizedBox(width: 5),
        //                                   Text(
        //                                     '${articles[index].views} views',
        //                                     style:
        //                                         const TextStyle(fontSize: 12),
        //                                   ),
        //                                 ],
        //                               ),
        //                             ],
        //                           ),
        //                         ),
        //                       ],
        //                     ),
        //                   );
        //                 }),
        //               ),
        //             )
        //             .toList(),
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}

class _DiscoverNews extends StatelessWidget {
  const _DiscoverNews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Nexus RIT',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Colors.black, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 5),
          Text(
            'All important notices at one place',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Search',
              fillColor: Colors.grey.shade200,
              filled: true,
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              // suffixIcon: const RotatedBox(
              //   quarterTurns: 1,
              //   child: Icon(
              //     Icons.tune,
              //     color: Colors.grey,
              //   ),
              // ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
                borderSide: BorderSide.none,
              ),
            ),
          )
        ],
      ),
    );
  }
}
