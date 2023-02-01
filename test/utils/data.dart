// ignore_for_file: lines_longer_than_80_chars

import 'package:planner_app/src/features/task_planner/data/model/category_model.dart';
import 'package:planner_app/src/features/task_planner/data/model/task_model.dart';

final taskJson = {
  'name': 'projects/applaudo-todo-app/databases/(default)/documents/tasks/'
      '00svU1nnYDZyiUQYKPfm',
  'fields': {
    'categoryId': {'stringValue': 'DDQeCPpZATcLfV9U3I0v'},
    'name': {'stringValue': 'Testing 2'},
    'isCompleted': {'booleanValue': true},
    'date': {'integerValue': '1664072803'}
  },
  'createTime': '2023-01-24T09:09:12.940738Z',
  'updateTime': '2023-01-24T16:50:20.742442Z'
};

const task = TaskModel(
  categoryId: 'DDQeCPpZATcLfV9U3I0v',
  date: '1664072803',
  name: 'Testing 2',
  id: '00svU1nnYDZyiUQYKPfm',
  isCompleted: true,
);

final categoryJson = {
  'name': 'projects/applaudo-todo-app/databases/(default)/documents/categories/'
      'x1ucdiTmzMWhm42pXZCX',
  'fields': {
    'color': {'stringValue': '#simple'},
    'name': {'stringValue': 'test'}
  },
  'createTime': '2022-07-24T20:53:19.311335Z',
  'updateTime': '2022-07-24T20:53:19.311335Z'
};

const category = CategoryModel(
  color: '#simple',
  name: 'test',
  id: 'x1ucdiTmzMWhm42pXZCX',
);

final tasksJson = {
  'documents': [
    {
      'name':
          'projects/applaudo-todo-app/databases/(default)/documents/tasks/00svU1nnYDZyiUQYKPfm',
      'fields': {
        'categoryId': {'stringValue': ' DDQeCPpZATcLfV9U3I0v'},
        'name': {'stringValue': 'Testing 2'},
        'isCompleted': {'booleanValue': true},
        'date': {'integerValue': '1664072803'}
      },
      'createTime': '2023-01-24T09:09:12.940738Z',
      'updateTime': '2023-01-24T16:50:20.742442Z'
    },
    {
      'name':
          'projects/applaudo-todo-app/databases/(default)/documents/tasks/18qidVHgK3Tu7htjrrWf',
      'fields': {
        'name': {'stringValue': 'testing'},
        'categoryId': {'stringValue': 'QgTclWhTuXSyrmU24iUo'},
        'isCompleted': {'booleanValue': true},
        'date': {'integerValue': '1664072803'}
      },
      'createTime': '2022-08-04T01:05:28.244030Z',
      'updateTime': '2023-01-24T16:49:20.492863Z'
    },
    {
      'name':
          'projects/applaudo-todo-app/databases/(default)/documents/tasks/1Ye86OlfuEnQBKVL3b0L',
      'fields': {
        'date': {'integerValue': '1673413200000'},
        'categoryId': {'stringValue': 'Kz87rr4eFqZKYlCRSCIa'},
        'isCompleted': {'booleanValue': true},
        'name': {'stringValue': 'Testing'}
      },
      'createTime': '2023-01-09T21:34:23.677832Z',
      'updateTime': '2023-01-24T16:57:53.764973Z'
    },
    {
      'name':
          'projects/applaudo-todo-app/databases/(default)/documents/tasks/3C6xsVPzMOoz4qivoztu',
      'fields': {
        'name': {'stringValue': 'Challenge Abel'},
        'categoryId': {'stringValue': ' DDQeCPpZATcLfV9U3I0v'},
        'isCompleted': {'booleanValue': true},
        'date': {'integerValue': '1673380405642'}
      },
      'createTime': '2023-01-10T19:53:26.788334Z',
      'updateTime': '2023-01-24T16:49:35.457968Z'
    },
    {
      'name':
          'projects/applaudo-todo-app/databases/(default)/documents/tasks/5FiWzW1R7jrwbd2J13tB',
      'fields': {
        'isCompleted': {'booleanValue': true},
        'name': {'stringValue': 'testing testing'},
        'date': {'integerValue': '1664072803'},
        'categoryId': {'stringValue': 'Kz87rr4eFqZKYlCRSCIa'}
      },
      'createTime': '2023-01-08T16:19:41.567041Z',
      'updateTime': '2023-01-24T16:57:56.377270Z'
    },
    {
      'name':
          'projects/applaudo-todo-app/databases/(default)/documents/tasks/5o56SzoSrqVjkwjTTi8j',
      'fields': {
        'name': {'stringValue': 'Taskmoin'},
        'date': {'integerValue': '1673378718700'},
        'isCompleted': {'booleanValue': true},
        'categoryId': {'stringValue': ' DDQeCPpZATcLfV9U3I0v'}
      },
      'createTime': '2023-01-10T19:25:19.960992Z',
      'updateTime': '2023-01-24T12:01:01.061587Z'
    },
    {
      'name':
          'projects/applaudo-todo-app/databases/(default)/documents/tasks/6AIAyuwQsAGD2EpHJ1VV',
      'fields': {
        'date': {'integerValue': '1674556046'},
        'name': {'stringValue': 'Prueba 1111'},
        'categoryId': {'stringValue': 'QgTclWhTuXSyrmU24iUo'},
        'isCompleted': {'booleanValue': true}
      },
      'createTime': '2023-01-24T10:27:36.577266Z',
      'updateTime': '2023-01-24T12:01:00.226543Z'
    },
    {
      'name':
          'projects/applaudo-todo-app/databases/(default)/documents/tasks/6dIfcorBYUVAuLTFQLou',
      'fields': {
        'date': {'integerValue': '1162023'},
        'name': {'stringValue': 'VP'},
        'categoryId': {'stringValue': 'Sy4aXMcxkHH2nDuGelEa'},
        'isCompleted': {'booleanValue': false}
      },
      'createTime': '2023-01-16T12:02:05.859390Z',
      'updateTime': '2023-01-24T16:59:33.018437Z'
    },
    {
      'name':
          'projects/applaudo-todo-app/databases/(default)/documents/tasks/7L3GnGwUdYc3G7ycWZEZ',
      'fields': {
        'categoryId': {'stringValue': ' DDQeCPpZATcLfV9U3I0v'},
        'isCompleted': {'booleanValue': true},
        'date': {'integerValue': '1664072803'},
        'name': {'stringValue': 'test123'}
      },
      'createTime': '2023-01-16T10:49:44.258409Z',
      'updateTime': '2023-01-24T12:38:48.053677Z'
    },
    {
      'name':
          'projects/applaudo-todo-app/databases/(default)/documents/tasks/8PtUhZ31LLOfYDh5T8ch',
      'fields': {
        'categoryId': {'stringValue': 'pktCoTflTBIYGM7xXFhS'},
        'name': {'stringValue': 'Kappa Kappa'},
        'date': {'integerValue': '1673240400000'},
        'isCompleted': {'booleanValue': false}
      },
      'createTime': '2023-01-09T20:50:25.547849Z',
      'updateTime': '2023-01-09T22:17:22.938886Z'
    },
    {
      'name':
          'projects/applaudo-todo-app/databases/(default)/documents/tasks/8YAAjIXSW0H1ZKbsisg3',
      'fields': {
        'date': {'integerValue': '1660021200000'},
        'isCompleted': {'booleanValue': true},
        'name': {'stringValue': 'another task of work '},
        'categoryId': {'stringValue': 'pktCoTflTBIYGM7xXFhS'}
      },
      'createTime': '2022-08-06T14:44:38.095896Z',
      'updateTime': '2023-01-24T16:51:11.129806Z'
    },
    {
      'name':
          'projects/applaudo-todo-app/databases/(default)/documents/tasks/BXF88SPeLByzIUr1So8M',
      'fields': {
        'date': {'integerValue': '25'},
        'categoryId': {
          'stringValue':
              'categoryId_here_i cannot find it in the GetCategories API response'
        },
        'name': {'stringValue': 'important'},
        'isCompleted': {'booleanValue': false}
      },
      'createTime': '2023-01-16T10:47:34.963755Z',
      'updateTime': '2023-01-16T10:47:34.963755Z'
    },
    {
      'name':
          'projects/applaudo-todo-app/databases/(default)/documents/tasks/CaebFSl4zxQGbquGWPtN',
      'fields': {
        'name': {'stringValue': 'TEst'},
        'date': {'integerValue': '1162023'},
        'categoryId': {
          'stringValue':
              'categoryId_here_i cannot find it in the GetCategories API response'
        },
        'isCompleted': {'booleanValue': false}
      },
      'createTime': '2023-01-16T11:50:44.461982Z',
      'updateTime': '2023-01-16T11:50:44.461982Z'
    },
    {
      'name':
          'projects/applaudo-todo-app/databases/(default)/documents/tasks/DbOM5ECFMh7DriUZ6FZa',
      'fields': {
        'categoryId': {'stringValue': 'QgTclWhTuXSyrmU24iUo'},
        'name': {'stringValue': 'complete my tasks '},
        'isCompleted': {'booleanValue': false},
        'date': {'integerValue': '1660021200000'}
      },
      'createTime': '2022-08-06T01:43:50.698706Z',
      'updateTime': '2023-01-24T11:49:20.637606Z'
    },
    {
      'name':
          'projects/applaudo-todo-app/databases/(default)/documents/tasks/Er5BlHZGazYiTYG9gY2h',
      'fields': {
        'isCompleted': {'booleanValue': true},
        'name': {'stringValue': 'Test app'},
        'date': {'integerValue': '1675123200'},
        'categoryId': {'stringValue': 'n9SrxDOVV2G82oDQRnwr'}
      },
      'createTime': '2023-01-24T16:58:54.685740Z',
      'updateTime': '2023-01-24T16:59:00.925938Z'
    },
    {
      'name':
          'projects/applaudo-todo-app/databases/(default)/documents/tasks/IF0Q6DJclPww6Dq1ilIr',
      'fields': {
        'name': {'stringValue': 'Prueba 123'},
        'isCompleted': {'booleanValue': true},
        'categoryId': {'stringValue': 'pktCoTflTBIYGM7xXFhS'},
        'date': {'integerValue': '1674555027'}
      },
      'createTime': '2023-01-24T10:10:36.569847Z',
      'updateTime': '2023-01-24T14:08:19.777450Z'
    },
    {
      'name':
          'projects/applaudo-todo-app/databases/(default)/documents/tasks/IKcgdH77wfMQ5PzDhF0r',
      'fields': {
        'isCompleted': {'booleanValue': false},
        'categoryId': {'stringValue': 'pktCoTflTBIYGM7xXFhS'},
        'date': {'integerValue': '1673326800000'},
        'name': {'stringValue': 'A new task'}
      },
      'createTime': '2023-01-09T21:38:32.098667Z',
      'updateTime': '2023-01-24T11:49:35.802604Z'
    },
    {
      'name':
          'projects/applaudo-todo-app/databases/(default)/documents/tasks/KLBWbWArYV4WQTmwpV3o',
      'fields': {
        'categoryId': {'stringValue': 'pktCoTflTBIYGM7xXFhS'},
        'isCompleted': {'booleanValue': true},
        'date': {'integerValue': '1660453200000'},
        'name': {'stringValue': 'task app'}
      },
      'createTime': '2022-08-06T01:50:04.572374Z',
      'updateTime': '2023-01-24T16:49:04.398390Z'
    },
    {
      'name':
          'projects/applaudo-todo-app/databases/(default)/documents/tasks/LbNomrmP7OJhGU5iJK0s',
      'fields': {
        'categoryId': {'stringValue': ' DDQeCPpZATcLfV9U3I0v'},
        'date': {'integerValue': '1664072803'},
        'name': {'stringValue': 'testing'},
        'isCompleted': {'booleanValue': false}
      },
      'createTime': '2023-01-14T14:13:21.976852Z',
      'updateTime': '2023-01-14T14:13:21.976852Z'
    },
    {
      'name':
          'projects/applaudo-todo-app/databases/(default)/documents/tasks/NImIJMATfIlCI2wcixto',
      'fields': {
        'name': {'stringValue': 'AAAA'},
        'date': {'integerValue': '1664072803'},
        'isCompleted': {'booleanValue': false},
        'categoryId': {'stringValue': ' AAADASD'}
      },
      'createTime': '2023-01-12T17:19:22.199381Z',
      'updateTime': '2023-01-12T17:19:22.199381Z'
    }
  ],
  'nextPageToken':
      'AFTOeJxGNgGp6M_mm0CvDF7HcSv6vVmxRXIrONqys7g6E15X25QPFvC4r922w0n2r5Ud0bn_zFnj0p1DkQ9PKyO-4MrwQ2nVQcxjDThmbTFrhfWplcU8tmwIIFf2PBw6'
};

final categoriesJson = {
  'documents': [
    {
      'name':
          'projects/applaudo-todo-app/databases/(default)/documents/categories/5CrugqSUMdGsjT6k3q8Q',
      'fields': {
        'color': {'stringValue': '#simple'},
        'name': {'stringValue': 'prueba'}
      },
      'createTime': '2023-01-15T20:06:25.779601Z',
      'updateTime': '2023-01-15T20:06:25.779601Z'
    },
    {
      'name':
          'projects/applaudo-todo-app/databases/(default)/documents/categories/67ijZOA6txeyDk8Kwp8t',
      'fields': {
        'name': {'stringValue': 'prueba'},
        'color': {'stringValue': '#simple'}
      },
      'createTime': '2023-01-13T02:32:04.144214Z',
      'updateTime': '2023-01-13T02:32:04.144214Z'
    },
    {
      'name':
          'projects/applaudo-todo-app/databases/(default)/documents/categories/6Mbslg2QrqNpKZHPanwn',
      'fields': {
        'color': {'stringValue': '#simple'},
        'name': {'stringValue': 'prueba1'}
      },
      'createTime': '2023-01-24T15:07:25.056408Z',
      'updateTime': '2023-01-24T15:07:25.056408Z'
    },
    {
      'name':
          'projects/applaudo-todo-app/databases/(default)/documents/categories/BoGhLxm4IaHz6btTxQ0Q',
      'fields': {
        'name': {'stringValue': 'prueba'},
        'color': {'stringValue': '#simple'}
      },
      'createTime': '2023-01-18T23:54:58.317206Z',
      'updateTime': '2023-01-18T23:54:58.317206Z'
    },
    {
      'name':
          'projects/applaudo-todo-app/databases/(default)/documents/categories/F3ez17K3qWZPwgAXE5Pc',
      'fields': {
        'color': {'stringValue': '#simple'},
        'name': {'stringValue': 'prueba'}
      },
      'createTime': '2023-01-13T03:25:19.164132Z',
      'updateTime': '2023-01-13T03:25:19.164132Z'
    },
    {
      'name':
          'projects/applaudo-todo-app/databases/(default)/documents/categories/INLGh61cKTOJiTLJZIa7',
      'fields': {
        'color': {'stringValue': '#simple'},
        'name': {'stringValue': 'prueba'}
      },
      'createTime': '2023-01-22T01:36:17.032629Z',
      'updateTime': '2023-01-22T01:36:17.032629Z'
    },
    {
      'name':
          'projects/applaudo-todo-app/databases/(default)/documents/categories/Kz87rr4eFqZKYlCRSCIa',
      'fields': {
        'color': {'stringValue': '#simple'},
        'name': {'stringValue': 'prueba'}
      },
      'createTime': '2023-01-06T04:39:42.747791Z',
      'updateTime': '2023-01-06T04:39:42.747791Z'
    },
    {
      'name':
          'projects/applaudo-todo-app/databases/(default)/documents/categories/Mt3c3RwwW6IwnRfziHhw',
      'fields': {
        'color': {'stringValue': '4282009914'},
        'name': {'stringValue': 'Category 2'}
      },
      'createTime': '2023-01-24T16:04:08.628601Z',
      'updateTime': '2023-01-24T16:04:08.628601Z'
    },
    {
      'name':
          'projects/applaudo-todo-app/databases/(default)/documents/categories/QgTclWhTuXSyrmU24iUo',
      'fields': {
        'color': {'stringValue': '4caf50'},
        'name': {'stringValue': 'important'}
      },
      'createTime': '2022-07-24T20:29:12.474971Z',
      'updateTime': '2022-07-24T20:29:12.474971Z'
    },
    {
      'name':
          'projects/applaudo-todo-app/databases/(default)/documents/categories/Sy4aXMcxkHH2nDuGelEa',
      'fields': {
        'name': {'stringValue': 'New category'},
        'color': {'stringValue': '4288350436'}
      },
      'createTime': '2023-01-24T16:59:21.600095Z',
      'updateTime': '2023-01-24T16:59:21.600095Z'
    },
    {
      'name':
          'projects/applaudo-todo-app/databases/(default)/documents/categories/TDY7E9RTMcXvUQr3rSo8',
      'fields': {
        'name': {'stringValue': 'personal'},
        'color': {'stringValue': '#29b6f6'}
      },
      'createTime': '2022-07-24T20:52:45.214118Z',
      'updateTime': '2022-07-24T20:52:45.214118Z'
    },
    {
      'name':
          'projects/applaudo-todo-app/databases/(default)/documents/categories/clUiaBycs8lfdj12pw3m',
      'fields': {
        'color': {'stringValue': '#simple'},
        'name': {'stringValue': 'prueba1'}
      },
      'createTime': '2023-01-22T01:36:28.641639Z',
      'updateTime': '2023-01-22T01:36:28.641639Z'
    },
    {
      'name':
          'projects/applaudo-todo-app/databases/(default)/documents/categories/n9SrxDOVV2G82oDQRnwr',
      'fields': {
        'color': {'stringValue': '4282661449'},
        'name': {'stringValue': 'Test cate'}
      },
      'createTime': '2023-01-24T16:02:32.673180Z',
      'updateTime': '2023-01-24T16:02:32.673180Z'
    },
    {
      'name':
          'projects/applaudo-todo-app/databases/(default)/documents/categories/pktCoTflTBIYGM7xXFhS',
      'fields': {
        'name': {'stringValue': 'work'},
        'color': {'stringValue': '#8e24aa'}
      },
      'createTime': '2022-07-24T20:28:05.101918Z',
      'updateTime': '2022-07-24T20:28:05.101918Z'
    },
    {
      'name':
          'projects/applaudo-todo-app/databases/(default)/documents/categories/rD6uH6c17T3zzeupYdlK',
      'fields': {
        'color': {'stringValue': '#simple'},
        'name': {'stringValue': 'prueba'}
      },
      'createTime': '2023-01-18T17:52:01.026497Z',
      'updateTime': '2023-01-18T17:52:01.026497Z'
    },
    {
      'name':
          'projects/applaudo-todo-app/databases/(default)/documents/categories/x1ucdiTmzMWhm42pXZCX',
      'fields': {
        'color': {'stringValue': '#simple'},
        'name': {'stringValue': 'prueba'}
      },
      'createTime': '2022-07-24T20:53:19.311335Z',
      'updateTime': '2022-07-24T20:53:19.311335Z'
    }
  ]
};
