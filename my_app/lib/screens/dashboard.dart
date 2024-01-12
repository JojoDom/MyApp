import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/controllers/dashboard_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final db = Get.put(DashBoardController());

  @override
  void initState() {
    db.getCat();
    super.initState();
  }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body:  Obx(() => 
          db.isLoading.isTrue?  Center(child:  CircularProgressIndicator(color: Colors.blue,)): Column(
            children: [
              const Text('Meet Almighty'),
              Center(
                child: CachedNetworkImage(
                  imageUrl: db.catImage.value,
                  imageBuilder: (context, imageProvider) => Container(
                    height: MediaQuery.of(context).size.height*0.5,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      shape: BoxShape.rectangle,
                      image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                 
                  errorWidget: (context, url, error) => Container(
                      height: 50,
                      width: 50,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 208, 202, 219),
                        shape: BoxShape.rectangle,
                      ),
                      child: const Icon(Icons.person)),
                ),
              ),
            ],
          ),
        ));
  }
}
