countdown = angular.module 'countdown', []

countdown.directive 'countdown', [() ->
  restrict: "E"
  replace: true
  template: "<div class='countdown'>{{ countdown }}</div>"
  controller: ['$scope', '$attrs', '$interval', '$rootScope', ($scope, $attrs, $interval, $rootScope) ->
    start = $attrs.start
    interval = undefined

    # Main method of the directive, start the countdown using $interval
    startCountdown = ->
      $scope.countdown = start

      tick = ->
        $scope.countdown = $scope.countdown - 1
        if $scope.countdown == 0
          $interval.cancel interval
          $rootScope.$broadcast 'countdown:over'

      interval = $interval(tick, 1000)

    # Called from a controller to restart the countdown
    $scope.$on 'countdown:restart', ->
      $interval.cancel interval
      startCountdown()

    # Called from a controller to stop the countdown
    $scope.$on 'countdown:stop', ->
      $interval.cancel interval

    startCountdown()
  ]

]