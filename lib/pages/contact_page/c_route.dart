import 'package:go_router/go_router.dart';
import 'contact.dart';

final c_route = GoRoute(
    path: "/tasks",
    builder: (context, state) => ContactPage(),
    routes: [
  //     GoRoute(
  //       /// /tasks/NormalTask
  //         path: TaskType.NORMAL.nameSpace,
  //         routes: [
  //           // /tasks/NormalTask/detail/${taskId}
  //           GoRoute(path: "detail/:taskId", builder: ((context, state) => NormalTaskDetailPage(taskId: state.params["taskId"] ?? ""))),
  //           // /tasks/NormalTask/take_task/${taskId}
  //           GoRoute(path: "take_task/:taskId", builder: ((context,state)=>TakeTaskPage(state.params["taskId"]??""))),
  //           // /tasks/NormalTask/edit/${taskId}
  //           GoRoute(path: "edit/:taskId", builder: ((context, state) => EditNormalTaskPage(state.params["taskId"] ?? ""))),
  //           // /tasks/NormalTask/candidates/${taskId}
  //           GoRoute(path: "candidates/:taskId",
  //             builder: ((context, state) => TaskCandidatesPage(TaskType.NORMAL, state.params["taskId"]??"")),
  //             routes: [
  //               // /tasks/NormalTask/candidates/${taskId}/detail/${candidateId}
  //               GoRoute(path: "detail/:candidateId",builder: ((context, state) => CandidateDetailPage(TaskType.NORMAL, state.params["taskId"]??"", state.params["candidateId"]??"")))
  //             ]
  //           )
  //         ],
  //         builder: (_,s)=> ContactPage()
  //     ),
  // //    GoRoute(path: "candidates/${TaskType.NORMAL.nameSpace}/:taskId", builder: ((context, state) => TaskCandidatesPage(TaskType.NORMAL, state.params["taskId"]??""))),
  //     GoRoute(path: 'create', builder: ((context, state) => CreateTaskPage()))
    ]
);