import 'package:flutter/material.dart';

class PlaceWidget extends StatelessWidget {
  PlaceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    Widget imageSection = Image.asset('assets/img/place.jpeg', height: height * 0.3,width: width,fit: BoxFit.cover,);
    Widget imageSectionL = Image.asset('assets/img/place.jpeg', height: height ,width: width * 0.45,fit: BoxFit.cover,);
    Widget titleSection = Container(
      padding: EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 8),
                  child: Text("Playa de Cancún", style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Text("Quintana Roo, México", style: TextStyle(color: Colors.grey[500]))
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.amber,),
          Text("41")
        ],
      ),
    );
    Widget buttonsSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn("CALL", Icons.call, Colors.blue),
        _buildButtonColumn("ROUTE", Icons.near_me, Colors.blue),
        _buildButtonColumn("SHARE", Icons.share, Colors.blue),
      ],
    );
    Widget descriptionSection = Padding(
      padding: EdgeInsets.all(32),
      child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas a dui nec lorem maximus scelerisque sit amet eget turpis. Maecenas convallis neque id eleifend porta. Nullam vestibulum dui at diam blandit aliquet. Vestibulum quis laoreet mauris. Aliquam efficitur leo sed odio scelerisque, at fringilla nulla euismod. In hac habitasse platea dictumst. Integer in hendrerit nisl. Integer fringilla sapien nec sem luctus faucibus ac sed arcu. In fermentum libero vitae risus facilisis, vitae consectetur lorem condimentum. Duis eget volutpat dolor. Mauris pharetra ullamcorper ligula. Mauris vulputate diam nec magna congue aliquam et id mauris."
          "Donec sed aliquam augue. Vivamus massa ex, egestas ut rhoncus eu, tincidunt in ipsum. Proin accumsan commodo sapien, ac condimentum nulla. Cras ut rhoncus odio. Nam eu nisl cursus, auctor elit in, facilisis orci. Nunc sem tortor, dignissim vitae metus quis, blandit lobortis ante. Nunc quis vulputate tortor. Curabitur eget hendrerit neque."
         "Etiam placerat nisl augue, sed laoreet libero tincidunt ac. Nunc consequat enim ut dictum convallis. Quisque eget velit sit amet arcu varius feugiat. Nam eget fringilla ante. Praesent pulvinar nulla eget odio venenatis, vel sagittis orci aliquam. In egestas dolor vitae nibh auctor rhoncus. Curabitur nec tortor at sem bibendum luctus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Quisque blandit sagittis felis ut aliquam. Donec interdum velit dui, nec porta eros rhoncus nec. In accumsan odio sed mi finibus tincidunt. Vivamus non consectetur nisi. Nullam id neque vitae nulla dignissim rhoncus. Maecenas sed placerat justo, at scelerisque sapien. Nullam porta elit non quam luctus sagittis. Maecenas sem ligula, pellentesque a eros vitae, ultricies ultricies mauris.",
         textAlign: TextAlign.justify, ),
    );

    return Scaffold(
      body:OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {

          return orientation == Orientation.portrait ? SingleChildScrollView(
            child: Column(
              children: [
                imageSection,
                titleSection,
                buttonsSection,
                descriptionSection,
              ],
            ),
          ) : Row(
            children: [
              imageSectionL,
              SingleChildScrollView(
                child: Column(
                  children: [
                    titleSection,
                    buttonsSection,
                    descriptionSection,
                  ],
                ),
              )
            ],
          );
        }
      )

    );
  }

  Widget _buildButtonColumn(String title, IconData icon, Color color){
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color,),
        Container(
          padding: EdgeInsets.only(top:8),
          child: Text(title, style: TextStyle(color: color, fontSize: 12, fontWeight: FontWeight.w400),)
        )
      ],
    );
  }
}
