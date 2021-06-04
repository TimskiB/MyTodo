import '../backend/backend.dart';
import '../create_task/create_task_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../home_page/home_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class TasksWidget extends StatefulWidget {
  TasksWidget({Key key}) : super(key: key);

  @override
  _TasksWidgetState createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
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
            await Navigator.pushAndRemoveUntil(
              context,
              PageTransition(
                type: PageTransitionType.scale,
                alignment: Alignment.bottomCenter,
                duration: Duration(milliseconds: 10),
                reverseDuration: Duration(milliseconds: 10),
                child: HomePageWidget(),
              ),
              (r) => false,
            );
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 25,
          ),
          iconSize: 25,
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(25, 15, 15, 15),
              child: Text(
                'Tasks',
                style: FlutterFlowTheme.title1.override(
                  fontFamily: 'Poppins',
                  fontSize: 36,
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<List<TasksRecord>>(
                stream: queryTasksRecord(
                  queryBuilder: (tasksRecord) =>
                      tasksRecord.orderBy('deadline', descending: true),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  List<TasksRecord> listViewTasksRecordList = snapshot.data;
                  // Customize what your widget looks like with no query results.
                  if (snapshot.data.isEmpty) {
                    // return Container();
                    // For now, we'll just include some dummy data.
                    listViewTasksRecordList = createDummyTasksRecord(count: 4);
                  }
                  return Padding(
                    padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewTasksRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewTasksRecord =
                            listViewTasksRecordList[listViewIndex];
                        return StreamBuilder<List<TasksRecord>>(
                          stream: queryTasksRecord(
                            singleRecord: true,
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(child: CircularProgressIndicator());
                            }
                            List<TasksRecord> cardTasksRecordList =
                                snapshot.data;
                            // Customize what your widget looks like with no query results.
                            if (snapshot.data.isEmpty) {
                              // return Container();
                              // For now, we'll just include some dummy data.
                              cardTasksRecordList =
                                  createDummyTasksRecord(count: 1);
                            }
                            final cardTasksRecord = cardTasksRecordList.first;
                            return Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Colors.white,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                width: double.infinity,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    StreamBuilder<List<TasksRecord>>(
                                      stream: queryTasksRecord(
                                        singleRecord: true,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }
                                        List<TasksRecord>
                                            toggleIconTasksRecordList =
                                            snapshot.data;
                                        // Customize what your widget looks like with no query results.
                                        if (snapshot.data.isEmpty) {
                                          // return Container();
                                          // For now, we'll just include some dummy data.
                                          toggleIconTasksRecordList =
                                              createDummyTasksRecord(count: 1);
                                        }
                                        final toggleIconTasksRecord =
                                            toggleIconTasksRecordList.first;
                                        return ToggleIcon(
                                          onPressed: () async {
                                            final completed =
                                                !toggleIconTasksRecord
                                                    .completed;

                                            final tasksRecordData =
                                                createTasksRecordData(
                                              completed: completed,
                                            );

                                            await toggleIconTasksRecord
                                                .reference
                                                .update(tasksRecordData);
                                          },
                                          value:
                                              toggleIconTasksRecord.completed,
                                          onIcon: Icon(
                                            Icons.check_box,
                                            color: Colors.green,
                                            size: 25,
                                          ),
                                          offIcon: Icon(
                                            Icons.check_box_outline_blank,
                                            color: Color(0xFF3B3A3A),
                                            size: 25,
                                          ),
                                        );
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          StreamBuilder<List<TasksRecord>>(
                                            stream: queryTasksRecord(
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                    child:
                                                        CircularProgressIndicator());
                                              }
                                              List<TasksRecord>
                                                  textTasksRecordList =
                                                  snapshot.data;
                                              // Customize what your widget looks like with no query results.
                                              if (snapshot.data.isEmpty) {
                                                // return Container();
                                                // For now, we'll just include some dummy data.
                                                textTasksRecordList =
                                                    createDummyTasksRecord(
                                                        count: 1);
                                              }
                                              final textTasksRecord =
                                                  textTasksRecordList.first;
                                              return Text(
                                                textTasksRecord.name,
                                                style: FlutterFlowTheme
                                                    .bodyText2
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                  color: Colors.black,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              );
                                            },
                                          ),
                                          StreamBuilder<List<TasksRecord>>(
                                            stream: queryTasksRecord(
                                              singleRecord: true,
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                    child:
                                                        CircularProgressIndicator());
                                              }
                                              List<TasksRecord>
                                                  textTasksRecordList =
                                                  snapshot.data;
                                              // Customize what your widget looks like with no query results.
                                              if (snapshot.data.isEmpty) {
                                                // return Container();
                                                // For now, we'll just include some dummy data.
                                                textTasksRecordList =
                                                    createDummyTasksRecord(
                                                        count: 1);
                                              }
                                              final textTasksRecord =
                                                  textTasksRecordList.first;
                                              return Text(
                                                textTasksRecord.description,
                                                style: FlutterFlowTheme
                                                    .subtitle1
                                                    .override(
                                                  fontFamily: 'Poppins',
                                                  fontSize: 14,
                                                ),
                                              );
                                            },
                                          ),
                                          Card(
                                            clipBehavior:
                                                Clip.antiAliasWithSaveLayer,
                                            color: Color(0x8203A9F4),
                                            child: StreamBuilder<
                                                List<TasksRecord>>(
                                              stream: queryTasksRecord(
                                                singleRecord: true,
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                      child:
                                                          CircularProgressIndicator());
                                                }
                                                List<TasksRecord>
                                                    textTasksRecordList =
                                                    snapshot.data;
                                                // Customize what your widget looks like with no query results.
                                                if (snapshot.data.isEmpty) {
                                                  // return Container();
                                                  // For now, we'll just include some dummy data.
                                                  textTasksRecordList =
                                                      createDummyTasksRecord(
                                                          count: 1);
                                                }
                                                final textTasksRecord =
                                                    textTasksRecordList.first;
                                                return Padding(
                                                  padding: EdgeInsets.fromLTRB(
                                                      4, 2, 4, 2),
                                                  child: Text(
                                                    dateTimeFormat(
                                                        'MMMMEEEEd',
                                                        textTasksRecord.deadline
                                                            .toDate()),
                                                    style: FlutterFlowTheme
                                                        .bodyText1
                                                        .override(
                                                      fontFamily: 'Poppins',
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.leftToRight,
                          duration: Duration(milliseconds: 10),
                          reverseDuration: Duration(milliseconds: 10),
                          child: CreateTaskWidget(),
                        ),
                      );
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
