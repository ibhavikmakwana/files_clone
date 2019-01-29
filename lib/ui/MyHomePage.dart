import 'package:flutter/material.dart';
import 'package:flutter_files_clone/utils/strings.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              buildDrawerTitle(),
              Divider(
                height: 4,
                color: Colors.grey,
              ),
              buildCenterDrawerContent(),
              Divider(
                height: 4,
                color: Colors.grey,
              ),
              buildDrawerListTile(
                Icons.card_giftcard,
                "Help friends free up space",
              ),
              buildDrawerListTile(
                Icons.settings,
                "Settings",
              ),
              buildDrawerListTile(
                Icons.help_outline,
                "Help & feedback",
              ),
            ],
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, isScroll) {
            return <Widget>[
              buildAppBar(),
            ];
          },
          body: Stack(
            children: <Widget>[
              Container(
                height: 200,
                color: Color(0xFF0072F0),
                child: Column(
                  children: <Widget>[
                    buildRow(Icons.phone_android, "15.5 GB used",
                        "16 GB . Internal storage"),
                    buildRow(
                      Icons.sd_card,
                      "16 GB used",
                      "16 GB . SD card",
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 170,
                bottom: 0,
                left: 0,
                right: 0,
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    customCard("WhatsApp media", "", true),
                    customCard("WhatsApp videos", "", true),
                    customCard("Your unsused apps",
                        "Apps that haven't used in over 4 weeks", true),
                    customCard("Large Files", "", true),
                    Container(
                      width: double.maxFinite,
                      height: 150,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  customCard(String title, String desc, bool isImageVideoApps) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 8, right: 8, left: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
        boxShadow: <BoxShadow>[
          BoxShadow(
            spreadRadius: 2,
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding:
                const EdgeInsets.only(left: 16, top: 16, bottom: 8, right: 16),
            child: Text(
              title,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
          Visibility(
            visible: desc.isNotEmpty,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, bottom: 8, right: 16),
              child: Text(
                desc,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
          ),
          Visibility(
            visible: isImageVideoApps,
            child: Container(
              margin: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: 16,
              ),
              height: 75,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  horizontalImageWidget(Strings.img1),
                  horizontalImageWidget(Strings.img2),
                  horizontalImageWidget(Strings.img3),
                  horizontalImageWidget(Strings.img4),
                  horizontalImageWidget(Strings.img5),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: EdgeInsets.only(right: 16, top: 8, bottom: 16, left: 16),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left:8,right: 8,bottom: 4,top: 4),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.select_all,
                      color: Colors.blueAccent,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text("Select and free up 69.72 MB",style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static horizontalImageWidget(String img) {
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: ClipRRect(
        child: Image.network(
          img,
          width: 75,
          height: 75,
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
    );
  }

  buildRow(IconData icon, String used, String type) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                used,
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              Text(
                type,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          )
        ],
      ),
    );
  }

  ListTile buildDrawerListTile(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {},
    );
  }

  Padding buildCenterDrawerContent() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "1",
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 32),
                ),
                Text(
                  "Friend helped",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "10 GB",
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 32),
                ),
                Text(
                  "Space saved",
                  style: TextStyle(color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "0",
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 32),
                ),
                Text(
                  "Share recipients",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding buildDrawerTitle() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.purple,
                child: Container(
                  child: Text(
                    "B",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text("Bhavik Makwana"),
            ],
          ),
        ],
      ),
    );
  }

  buildAppBar() {
    return SliverAppBar(
      floating: true,
      snap: true,
      iconTheme: IconThemeData(color: Colors.black54),
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            "assets/icon/icon.png",
            height: 32,
            width: 32,
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            widget.title,
            style: TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }

  memoryUsedRow(IconData leadingIcon, String storageUsed, String typeAndTotal) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          leadingIcon,
          color: Colors.white,
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              storageUsed,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            LinearProgressIndicator(),
            Text(
              typeAndTotal,
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ],
        ),
      ],
    );
  }
}
