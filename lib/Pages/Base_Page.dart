import 'package:flutter/material.dart';
import 'package:personal_portfolio_flutter/lists/Nav_Buttons_List.dart';
import 'package:personal_portfolio_flutter/responsive_widget.dart';

class BasePage extends StatelessWidget {
  final Widget? largeScreenWidget, mediumScreenWidget, smallScreenWidget;
  const BasePage(
      {Key? key,
      this.largeScreenWidget,
      this.mediumScreenWidget,
      this.smallScreenWidget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget resLarge = largeScreenWidget ??
        const Center(
          child: Text('No largeScreenWidget found'),
        );
    Widget resMedium = mediumScreenWidget ??
        const Center(
          child: Text('No mediumScreenWidget found'),
        );
    Widget resSmall = smallScreenWidget ??
        const Center(
          child: Text('No smallScreenWidget found'),
        );

    return Container(
      color: ResponsiveWidget.isLargeScreen(context)
          ? Colors.black
          : ResponsiveWidget.isMediumScreen(context)
              ? Colors.black
              : Colors.black,
      // decoration: BoxDecoration(
      //   image: DecorationImage(
      //       image: AssetImage('assets/YellowStoneNationaParkPhoto.jpg'),
      //       fit: BoxFit.cover),
      // ),
      child: ResponsiveWidget(
        largeScreen: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: ResponsiveWidget.isSmallScreen(context)
              ? AppBar(
                  elevation: 0.0,
                  backgroundColor: Colors.black,
                )
              : null,
          drawer: ResponsiveWidget.isSmallScreen(context)
              ? const Drawer(
                  child: DrawerItems(),
                )
              : null,
          body: SingleChildScrollView(
            child: AnimatedPadding(
              duration: const Duration(seconds: 1),
              padding:
                  EdgeInsets.all(MediaQuery.of(context).size.height * 0.01),
              child: ResponsiveWidget(
                largeScreen: resLarge,
                mediumScreen: resMedium,
                smallScreen: resSmall,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerItems extends StatefulWidget {
  const DrawerItems({
    Key? key,
  }) : super(key: key);

  @override
  State<DrawerItems> createState() => _DrawerItemsState();
}

class _DrawerItemsState extends State<DrawerItems> {
  late ScrollController sc;

  @override
  void initState() {
    super.initState();
    sc = ScrollController();
  }

  @override
  void dispose() {
    sc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: sc,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
      children: navButtons(context),
    );
  }
}
