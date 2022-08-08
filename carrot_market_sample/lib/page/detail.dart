import 'package:carousel_slider/carousel_slider.dart';
import 'package:carrot_market_sample/components/manor_temperature_widget.dart';
import 'package:flutter/material.dart';

class DetailContentView extends StatefulWidget {
  late final Map<String, String> data;
  DetailContentView({Key? key, required this.data}) : super(key: key);

  @override
  State<DetailContentView> createState() => _DetailContentViewState();
}

class _DetailContentViewState extends State<DetailContentView> {
  late Size size;
  late List<String> imgList;
  late int _current;
  final CarouselController _controller = CarouselController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    size = MediaQuery.of(context).size;
    _current = 0;
    imgList = [
      widget.data["image"] as String,
      widget.data["image"] as String,
      widget.data["image"] as String,
      widget.data["image"] as String,
      widget.data["image"] as String,
    ];
  }

  PreferredSizeWidget _appbarWidget() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.share,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.more_vert,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _makeSliderImage() {
    return Container(
      child: Stack(
        children: [
          Hero(
            tag: widget.data['cid'] as String,
            child: CarouselSlider(
              items: imgList.map((i) {
                // List.generate(5, (index) {
                return Image.asset(
                  widget.data['image'] as String,
                  width: size.width,
                  fit: BoxFit.fill,
                );
              }).toList(),
              options: CarouselOptions(
                height: size.width,
                initialPage: 0,
                enableInfiniteScroll: false,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  //print(index);
                  setState(() {
                    _current = index;
                  });
                },
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imgList.asMap().entries.map((entry) {
                return GestureDetector(
                  onTap: () => _controller.animateToPage(entry.key),
                  child: Container(
                    width: 10.0,
                    height: 10.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.white.withOpacity(0.4))
                            .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sellerSimpleInfo() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundImage: Image.asset('assets/images/user.png').image,
          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '개발하는남자',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                '제주시 도남동',              
              ),
            ],
          ),
          Expanded(
            child: ManorTemperature(manorTemp: 37.5),
            ),
        ],
      ),
    );
  }

  Widget _bodyWidget() {
    return Column(
      children: [
        _makeSliderImage(),
        _sellerSimpleInfo(),
      ],
    );
  }

  Widget _bottomBarWitget() {
    return Container(
      height: 55,
      width: size.width,
      color: Colors.red,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _appbarWidget(),
      body: _bodyWidget(),
      bottomNavigationBar: _bottomBarWitget(),
    );
  }
}
