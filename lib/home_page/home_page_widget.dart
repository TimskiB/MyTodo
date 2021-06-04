import '../backend/api_requests/api_calls.dart';
import '../create_task/create_task_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../tasks/tasks_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.tertiaryColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () async {
            scaffoldKey.currentState.openDrawer();
          },
          icon: Icon(
            Icons.menu_rounded,
            color: Colors.black,
            size: 30,
          ),
          iconSize: 30,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
            child: IconButton(
              onPressed: () {
                print('IconButton pressed ...');
              },
              icon: Icon(
                Icons.calendar_today,
                color: Colors.transparent,
                size: 26,
              ),
              iconSize: 26,
            ),
          )
        ],
        centerTitle: true,
        elevation: 0,
      ),
      drawer: Drawer(
        elevation: 16,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 15, 0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text(
                  'Welcome Back!',
                  style: FlutterFlowTheme.subtitle1.override(
                    fontFamily: 'Poppins',
                    fontSize: 22,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                child: Text(
                  'Tim',
                  style: FlutterFlowTheme.title1.override(
                    fontFamily: 'Poppins',
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
                  child: GridView(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 20,
                      childAspectRatio: 1,
                    ),
                    scrollDirection: Axis.vertical,
                    children: [
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        color: Color(0xFF03A9F4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(5, 5, 5, 10),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Herzliya',
                                style: FlutterFlowTheme.subtitle1.override(
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF37474F),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  FutureBuilder<dynamic>(
                                    future: herzliyaWeatherCall(),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                            child: CircularProgressIndicator());
                                      }
                                      final textHerzliyaWeatherResponse =
                                          snapshot.data;
                                      return Text(
                                        getJsonField(
                                                textHerzliyaWeatherResponse,
                                                r'x.main.temp')
                                            .toString(),
                                        style:
                                            FlutterFlowTheme.subtitle1.override(
                                          fontFamily: 'Poppins',
                                          color: Color(0xFF3B3A3A),
                                          fontSize: 36,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      );
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(2, 0, 0, 0),
                                    child: Text(
                                      '°',
                                      style:
                                          FlutterFlowTheme.subtitle1.override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFF3B3A3A),
                                        fontSize: 36,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'max: ',
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                    ),
                                  ),
                                  FutureBuilder<dynamic>(
                                    future: herzliyaWeatherCall(),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                            child: CircularProgressIndicator());
                                      }
                                      final textHerzliyaWeatherResponse =
                                          snapshot.data;
                                      return Text(
                                        getJsonField(
                                                textHerzliyaWeatherResponse,
                                                r'x.main.temp_max')
                                            .toString(),
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                          fontSize: 16,
                                        ),
                                      );
                                    },
                                  ),
                                  Text(
                                    '°',
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'min: ',
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                    ),
                                  ),
                                  FutureBuilder<dynamic>(
                                    future: herzliyaWeatherCall(),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                            child: CircularProgressIndicator());
                                      }
                                      final textHerzliyaWeatherResponse =
                                          snapshot.data;
                                      return Text(
                                        getJsonField(
                                                textHerzliyaWeatherResponse,
                                                r'x.main.temp_min')
                                            .toString(),
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                          fontSize: 16,
                                        ),
                                      );
                                    },
                                  ),
                                  Text(
                                    '°',
                                    style: FlutterFlowTheme.bodyText1.override(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.scale,
                              alignment: Alignment.bottomCenter,
                              duration: Duration(milliseconds: 50),
                              reverseDuration: Duration(milliseconds: 50),
                              child: TasksWidget(),
                            ),
                          );
                        },
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: FlutterFlowTheme.secondaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(5, 5, 5, 10),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'My',
                                  style: FlutterFlowTheme.subtitle1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF3B3A3A),
                                  ),
                                ),
                                Text(
                                  'Tasks',
                                  style: FlutterFlowTheme.subtitle1.override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF3B3A3A),
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment(0, -0.05),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                    child: IconButton(
                                      onPressed: () async {
                                        await Navigator.push(
                                          context,
                                          PageTransition(
                                            type: PageTransitionType.fade,
                                            duration:
                                                Duration(milliseconds: 50),
                                            reverseDuration:
                                                Duration(milliseconds: 50),
                                            child: CreateTaskWidget(),
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.add_circle,
                                        color: Color(0xFF3B3A3A),
                                        size: 30,
                                      ),
                                      iconSize: 30,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
