countdown = angular.module 'countdown', []

countdown.directive 'countdown', [() ->
  restrict: "E"
  replace: true
  template: "<div class='countdown'>{{ countdown }}</div>"
  controller: ['$scope', '$attrs', '$interval', '$rootScope', ($scope, $attrs, $interval, $rootScope) ->
    start = $attrs.start
    interval = undefined

    $scope.countdown = start

    tick = ->
      $scope.countdown = $scope.countdown - 1
      if $scope.countdown == 0
        $interval.cancel interval
        $rootScope.$broadcast 'countdown:over'

    interval = $interval(tick, 1000)

  ]

]