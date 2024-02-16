import 'package:deep_dive_get_cli/app/shared/widgets/image_story.dart';
import 'package:deep_dive_get_cli/app/shared/widgets/post_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/model/story_model.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (context) {
      return SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                ),
                label: 'home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search, color: Colors.black),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.playlist_add, color: Colors.black),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined, color: Colors.black),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined, color: Colors.black),
                label: '',
              ),
            ],
          ),
          appBar: AppBar(
            leading: Image.asset('assets/images/logo_ig.png'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_outlined,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.message_outlined, color: Colors.black),
              ),
              const SizedBox(
                width: 5,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.add_box_outlined, color: Colors.black),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  height: 97.75,
                  child: ListView.builder(
                    itemCount: controller.storyModel.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      StoryModel data = controller.storyModel[index];
                      return Padding(
                        padding: const EdgeInsets.only(
                          right: 12,
                        ),
                        child: ImageStory(
                          story: data,
                          onTap: () {
                            controller.toStoryPageView(data.storyItems);
                          },
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Post(
                  postModel: controller.postModel,
                  onPressed: controller.changeIconLike,
                ),
                const SizedBox(
                  height: 18,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
