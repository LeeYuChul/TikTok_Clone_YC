import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/users/widget/persistent_tabbar.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: const Text('유철'),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const FaIcon(
                      FontAwesomeIcons.gear,
                      size: Sizes.size20,
                    ),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const CircleAvatar(
                      radius: 50,
                      foregroundImage: NetworkImage(
                          'https://blog.kakaocdn.net/dn/tEMUl/btrDc6957nj/NwJoDw0EOapJNDSNRNZK8K/img.jpg'),
                      child: Text('유철'),
                    ),
                    Gaps.v20,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '@유철',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        Gaps.h5,
                        FaIcon(
                          FontAwesomeIcons.solidCircleCheck,
                          size: 16,
                          color: Colors.blue.shade500,
                        )
                      ],
                    ),
                    Gaps.v24,
                    SizedBox(
                      height: 55,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              const Text(
                                "97",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Gaps.v3,
                              Text(
                                "Following",
                                style: TextStyle(color: Colors.grey.shade500),
                              ),
                            ],
                          ),
                          VerticalDivider(
                            width: 32,
                            thickness: 1,
                            color: Colors.grey.shade400,
                            indent: 10,
                            endIndent: 10,
                          ),
                          Column(
                            children: [
                              const Text(
                                "10M",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Gaps.v3,
                              Text(
                                "Followers",
                                style: TextStyle(color: Colors.grey.shade500),
                              ),
                            ],
                          ),
                          VerticalDivider(
                            width: 32,
                            thickness: 1,
                            color: Colors.grey.shade400,
                            indent: 10,
                            endIndent: 10,
                          ),
                          Column(
                            children: [
                              const Text(
                                "194M",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                              Gaps.v3,
                              Text(
                                "like",
                                style: TextStyle(color: Colors.grey.shade500),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Gaps.v14,
                    FractionallySizedBox(
                      widthFactor: 0.33,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(4),
                          ),
                        ),
                        child: const Text(
                          'Follow',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Gaps.v14,
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        "All highlights and where to watch live matches on FIFA, I wonder how it would look",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Gaps.v14,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(
                          FontAwesomeIcons.link,
                          size: 12,
                        ),
                        Gaps.h4,
                        Text(
                          "http://toochu.com",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    Gaps.v20,
                  ],
                ),
              ),
              SliverPersistentHeader(
                delegate: PersistantTabBar(),
                pinned: true,
              ),
            ];
          },
          body: TabBarView(
            children: [
              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: EdgeInsets.zero,
                  itemCount: 20,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: Sizes.size2,
                    mainAxisSpacing: Sizes.size2,
                    childAspectRatio: 9 / 14,
                  ),
                  itemBuilder: (context, index) => Column(
                        children: [
                          AspectRatio(
                            aspectRatio: 9 / 14,
                            child: FadeInImage.assetNetwork(
                                fit: BoxFit.cover,
                                placeholderFit: BoxFit.cover,
                                placeholder: "assets/images/placholder.jpg",
                                image:
                                    "https://blog.kakaocdn.net/dn/rIYaJ/btriQ6hL8tM/2k6nmswXNka1ykfhO7G3WK/img.png"),
                          ),
                        ],
                      )),
              const Center(
                child: Text('2'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
