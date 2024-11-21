import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:smarthome/services/home-services.dart';
import 'package:smarthome/shared/switchcard.dart';
import 'package:smarthome/shared/tile.dart';

import '../shared/ColorConfig.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ValueNotifier<bool> val1 = ValueNotifier<bool>(true);
  final ValueNotifier<bool> val2 = ValueNotifier<bool>(false);
  final ValueNotifier<bool> val3 = ValueNotifier<bool>(false);
  final ValueNotifier<bool> val4 = ValueNotifier<bool>(false);

  Future? loading;

  @override
  void initState() {
    super.initState();
    loading = HomeinfoServices().getHomeinfo();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "Smart Home",
            style: GoogleFonts.kanit(fontSize: 24, fontWeight: FontWeight.w500),
          ),
          bottom: TabBar(
            isScrollable: true,
            padding: const EdgeInsets.only(left: 30),
            tabAlignment: TabAlignment.start,
            dividerColor: Colors.transparent,
            indicatorColor: indicatorColor,
            labelColor: indicatorColor,
            unselectedLabelColor: unselectedLabelColor,
            labelStyle:
                GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
            tabs: const [
              Tab(
                text: "Living Room",
              ),
              Tab(
                text: "Kitchen",
              ),
              Tab(
                text: "Bathroom",
              ),
              Tab(
                text: "Bedroom",
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
          future: loading,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Gap(20),
                          Container(
                            width: 364,
                            height: 144,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(
                                    0,
                                    2.0,
                                  ),
                                  blurRadius: 8,
                                  spreadRadius: 0,
                                )
                              ],
                              gradient: LinearGradient(
                                colors: [
                                  shadowColor,
                                  textSwitchColor,
                                ],
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 25.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Tile(
                                        leading: SvgPicture.asset(
                                          "assets/icons/temprature.svg",
                                        ),
                                        title: "26 C",
                                        subtitle: "Temprature",
                                      ),
                                      Tile(
                                        leading: SvgPicture.asset(
                                          "assets/icons/humid.svg",
                                        ),
                                        title: "35 %",
                                        subtitle: "Humidtity",
                                      ),
                                    ],
                                  ),
                                  const Gap(30),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Tile(
                                        leading: SvgPicture.asset(
                                          "assets/icons/energy.svg",
                                        ),
                                        title: "256 k",
                                        subtitle: "Energy Usages",
                                      ),
                                      Tile(
                                        leading: SvgPicture.asset(
                                          "assets/icons/light.svg",
                                        ),
                                        title: "26 C",
                                        subtitle: "Light intensity",
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Gap(50),
                          Padding(
                              padding:
                                  const EdgeInsets.only(left: 20.0, right: 20),
                              child: GridView.count(
                                padding: const EdgeInsets.only(
                                    left: 10.0, right: 10),
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                crossAxisCount: 2,
                                children: [
                                  ValueListenableBuilder(
                                    valueListenable: val1,
                                    builder: (BuildContext context,
                                        dynamic value, Widget? child) {
                                      return SwitchCard(
                                        leading: SvgPicture.asset(
                                          "assets/icons/light.svg",
                                          height: 50,
                                          width: 50,
                                          colorFilter: ColorFilter.mode(
                                            val1.value == true
                                                ? textSwitchColor
                                                : secondaryColor,
                                            BlendMode.srcATop,
                                          ),
                                        ),
                                        title: "Light",
                                        subtitle: "Phillips hue",
                                        value: val1.value,
                                        onChanged: (val) {
                                          val1.value = val;
                                        },
                                      );
                                    },
                                  ),
                                  ValueListenableBuilder(
                                    valueListenable: val2,
                                    builder: (BuildContext context,
                                        dynamic value, Widget? child) {
                                      return SwitchCard(
                                        leading: SvgPicture.asset(
                                          "assets/icons/aircon.svg",
                                          height: 30,
                                          width: 30,
                                          colorFilter: ColorFilter.mode(
                                            val2.value == true
                                                ? textSwitchColor
                                                : secondaryColor,
                                            BlendMode.srcATop,
                                          ),
                                        ),
                                        title: "Air Conditioner",
                                        subtitle: "LG S3",
                                        value: val2.value,
                                        onChanged: (val) {
                                          val2.value = val;
                                        },
                                      );
                                    },
                                  ),
                                  ValueListenableBuilder(
                                    valueListenable: val3,
                                    builder: (BuildContext context,
                                        dynamic value, Widget? child) {
                                      return SwitchCard(
                                        leading: SvgPicture.asset(
                                          "assets/icons/tv.svg",
                                          height: 60,
                                          width: 60,
                                          colorFilter: ColorFilter.mode(
                                            val3.value == true
                                                ? textSwitchColor
                                                : secondaryColor,
                                            BlendMode.srcATop,
                                          ),
                                        ),
                                        title: "Smart TV",
                                        subtitle: "LG A1",
                                        value: val3.value,
                                        onChanged: (val) {
                                          val3.value = val;
                                        },
                                      );
                                    },
                                  ),
                                  ValueListenableBuilder(
                                    valueListenable: val4,
                                    builder: (BuildContext context,
                                        dynamic value, Widget? child) {
                                      return SwitchCard(
                                        leading: SvgPicture.asset(
                                          "assets/icons/router.svg",
                                          height: 60,
                                          width: 60,
                                          colorFilter: ColorFilter.mode(
                                            val4.value == true
                                                ? textSwitchColor
                                                : secondaryColor,
                                            BlendMode.srcATop,
                                          ),
                                        ),
                                        title: "Router",
                                        subtitle: "D-link 422",
                                        value: val4.value,
                                        onChanged: (val) {
                                          val4.value = val;
                                        },
                                      );
                                    },
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return const SafeArea(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
