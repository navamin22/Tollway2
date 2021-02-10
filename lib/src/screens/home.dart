import 'package:Tollway2/src/screens/change_payment.dart';
import 'package:Tollway2/src/screens/history.dart';
import 'package:Tollway2/src/screens/information.dart';
import 'package:Tollway2/src/screens/luckydraw.dart';
import 'package:Tollway2/src/screens/promotions.dart';
import 'package:Tollway2/src/screens/user.dart';
import 'package:Tollway2/src/widgets/CustomImage.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _pages = [
    InformationScreen(),
    PromotionsScreen(),
    HistoryScreen(),
    UserScreen(),
  ];
  final key = GlobalKey<AnimatedListState>();
  // final items = List.from(Data.paymentList);
  final double tabBarHeight = 80;
  final panelController = PanelController();
  final List<String> payMethodList = ["Coupon", "Credit Card"];
  int _selectedIndex = 0;

  final List<Widget> paymentList = [
    Container(
      width: double.infinity,
      child: Card(
        child: Container(
          margin: EdgeInsets.all(0.0),
          child: Column(
            children: <Widget>[
              Text('My Coupon'),
              Text('Balance 700.00 Baht'),
            ],
          ),
        ),
      ),
    ),
  ];

  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void changePayDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Stack(
                alignment: Alignment.topCenter,
                // ignore: deprecated_member_use
                overflow: Overflow.visible,
                children: <Widget>[
                  Container(
                    height: 250,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              alignment: Alignment.centerRight,
                              child: IconButton(
                                icon: Icon(Icons.close_rounded),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )),
                          //SizedBox(height: 10,),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Payment Method',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomCenter,
                            width: double.infinity,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  side: BorderSide(color: Colors.purple[800])),
                              child: Text('+ Add Credit/Debit cards'),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      top: -50,
                      child: CircleAvatar(
                        child: ClipRRect(
                          //child: CustomImage(width: 50, height: 50, margin: 0, image_path: 'assets/icons/barcode.png',),
                          child: Icon(
                            Icons.qr_code_scanner,
                            color: Colors.white,
                            size: 50,
                          ),
                        ),
                        radius: 45,
                        backgroundColor: Colors.purple[800],
                      ))
                ]),
          );
        });
  }

  void couponClick() => print("Clicked");

  Widget buildSlidingPanel({
    @required PanelController panelController,
    @required ScrollController scrollController,
  }) =>
      Scaffold(
        body: _pages[_selectedIndex],
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,

          // child: Icon(
          //   Icons.settings_overscan_outlined,
          //   size: 32,
          // ),
          child: Image.asset(
            "assets/icons/barcode.png",
            width: 30.0,
            height: 30.0,
            color: Colors.purple[800],
          ),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => LuckyDrawScreen()));
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: bottomNav2(),
      );

  Widget payMethod() {
    return Container(
      child: ListView.builder(
        itemCount: payMethodList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Card(
              child: Column(
                children: <Widget>[
                  Text(index.toString()),
                  Text(payMethodList[index]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget routeScreen() => _pages[_selectedIndex];

  Widget bottomNav() => BottomNavigationBar(
          backgroundColor: Colors.purple[200],
          currentIndex: _selectedIndex,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.shifting,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_outlined,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_basket_outlined,
              ),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.article_outlined,
              ),
              label: 'History',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.account_box_outlined,
              ),
              label: 'Account',
            ),
          ]);

  Widget bottomNav2() => BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.home_outlined,
                          color: _selectedIndex == 0
                              ? Colors.purple[800]
                              : Colors.grey,
                        ),
                        Text(
                          'หน้าหลัก',
                          style: TextStyle(
                            color: _selectedIndex == 0
                                ? Colors.purple[800]
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.shopping_basket_outlined,
                          color: _selectedIndex == 1
                              ? Colors.purple[800]
                              : Colors.grey,
                        ),
                        Text(
                          'โปรโมชั่น',
                          style: TextStyle(
                            color: _selectedIndex == 1
                                ? Colors.purple[800]
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),

              // Right Tab bar icons

              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.article_outlined,
                          color: _selectedIndex == 2
                              ? Colors.purple[800]
                              : Colors.grey,
                        ),
                        Text(
                          'การชำระ',
                          style: TextStyle(
                            color: _selectedIndex == 2
                                ? Colors.purple[800]
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    //minWidth: 40,
                    onPressed: () {
                      setState(() {
                        _selectedIndex = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.account_box_outlined,
                          color: _selectedIndex == 3
                              ? Colors.purple[800]
                              : Colors.grey,
                        ),
                        Text(
                          'บัญชี',
                          style: TextStyle(
                            color: _selectedIndex == 3
                                ? Colors.purple[800]
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      );

  Widget dragIcon() => Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(8),
        ),
        width: 52,
        height: 8,
        // child: FlatButton(
        //   onPressed: (){
        //     panelController.open();
        //   },
        // ),
      );

  Widget buildTabBar({
    @required VoidCallback onClicked,
  }) =>
      PreferredSize(
        preferredSize: Size.fromHeight(tabBarHeight - 8),
        child: GestureDetector(
          onTap: onClicked,
          child: AppBar(
            title: dragIcon(), // Icon(Icons.drag_handle),
            centerTitle: true,
          ),
        ),
      );

  Widget _mainWidget() {
    return Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Center(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                    ),
                    CustomImage(
                      width: 50,
                      height: 50,
                      margin: 10,
                      image_path: 'assets/icons/qr-code-scan.png',
                    ),
                    Text("Scan")
                  ],
                ),
              ),
              // child: Row(
              //   children: <Widget>[
              //     SizedBox(width: 75, height: 150,),
              //     Column(
              //       children: <Widget>[
              //         CustomImage(width: 50, height: 50, margin: 10, image_path: 'assets/icons/qr-code-scan.png',),
              //         Text("Scan")
              //       ],
              //     ),
              //     Spacer(flex: 2),
              //     Column(
              //       children: <Widget>[
              //         FlatButton(
              //           onPressed: (){
              //             Navigator.of(context)
              //                 .push(
              //                 MaterialPageRoute(builder: (context) => LuckyDrawScreen())
              //             );
              //           },
              //           child: CustomImage(
              //             width: 50,
              //             height: 50,
              //             margin: 10,
              //             image_path: 'assets/icons/barcode.png',
              //           ),
              //         ),
              //         Text("Pay")
              //       ],
              //     ),
              //     SizedBox(width: 75, height: 150,),
              //   ],
              // ),
            ),
            //Box of Payment Detail
            Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                            offset: Offset(
                                1.0, 1.5), // shadow direction: bottom right
                          )
                        ],
                      ),
                      child: Container(
                        margin: EdgeInsets.all(12),
                        //color: Colors.white,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 2.0,
                              spreadRadius: 0.0,
                              offset: Offset(
                                  1.0, 1.5), // shadow direction: bottom right
                            )
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(
                                  top: 10.0, right: 10.0, bottom: 5.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Icon(
                                    Icons.cached_outlined,
                                    color: Colors.black,
                                    size: 40,
                                  ),
                                  Text(
                                    '10.00',
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            CustomImage(
                              width: 150,
                              height: 150,
                              margin: 0,
                              image_path: 'assets/images/qrcode.png',
                            ),
                            Row(
                              children: <Widget>[
                                Container(
                                    padding: EdgeInsets.only(
                                        right: 10,
                                        left: 20,
                                        bottom: 10,
                                        top: 10),
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          'Payment Type',
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          'Remain Income',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    )),
                                Spacer(flex: 2),
                                Container(
                                  padding: EdgeInsets.all(5),
                                  child: FlatButton(
                                      child: Text(
                                        'Change',
                                        style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontSize: 16,
                                        ),
                                      ),
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PaymentMethodScreen()));
                                      }),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                    top: 15,
                    child: CircleAvatar(
                      child: ClipRRect(
                        child: CustomImage(
                          width: 80,
                          height: 80,
                          margin: 0,
                          image_path: 'assets/logos/logo_changed.png',
                        ),
                        // child: Icon(
                        //   Icons.qr_code_scanner,
                        //   color: Colors.white,
                        //   size: 50,
                        // ),
                      ),
                      radius: 45,
                      backgroundColor: Colors.purple[400],
                    ))
              ],
            ),
          ],
        ),
        //showPaymentMethod(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    BorderRadiusGeometry radius = BorderRadius.only(
        topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0));
    return Scaffold(
        body: SlidingUpPanel(
      backdropTapClosesPanel: true,
      backdropEnabled: true,
      borderRadius: radius,
      controller: panelController,
      maxHeight: MediaQuery.of(context).size.height - tabBarHeight,
      panelBuilder: (scrollController) => buildSlidingPanel(
        scrollController: scrollController,
        panelController: panelController,
      ),
      //Sliding up Icon
      collapsed: Container(
        decoration:
            BoxDecoration(color: Colors.purple[400], borderRadius: radius),
        child: Container(
            alignment: Alignment.topCenter,
            child: Column(
              children: <Widget>[
                FlatButton(
                  onPressed: () => openPanel(),
                  child: dragIcon(),
                ),
                FlatButton(
                    padding: EdgeInsets.only(bottom: 20.0),
                    onPressed: () => openPanel(),
                    child: Text(
                      'Click to Homepage',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )),
              ],
            )),
      ),
      body: _mainWidget(),
    ));
  }

  void openPanel() {
    panelController.open();
  }
}
