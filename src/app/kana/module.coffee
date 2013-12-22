
modules = [
  'ui.router.state',

  'kana.hiragana'
]

home = angular.module 'nihongo.kana', modules

home.config ['$stateProvider', ($stateProvider) ->
  $stateProvider.state 'hiragana',
    url: '/hiragana'
    controller: 'HiraganaCtrl'
    templateUrl: 'kana/index.html'
    data:
      pageTitle: 'Hiragana'
]
