
modules = [
  'kana.service'
]

kana = angular.module 'kana.controller', modules

kana.controller 'KanaCtrl', ['$scope', '$state', '$timeout', 'kanaService', ($scope, $state, $timeout, kanaService) ->
  $scope.question = kanaService.getQuestion($state.current.name)
  $scope.answered = false
  $scope.score =
    right: 0
    wrong: 0

  $scope.resetQuestion = () ->
    $scope.mistake = undefined
    $scope.correctAnswer = undefined
    $scope.answered = false
    $scope.answer = ''
    $scope.question = kanaService.getQuestion($state.current.name)


  $scope.checkAnswer = () ->
    delay = 1000

    if $scope.answer and not $scope.answered
      $scope.answered = true
      if $scope.answer is $scope.question.kana or $scope.answer is $scope.question.answer
        # Do animation and stuff
        $scope.score.right += 1
        $scope.mistake = undefined
        $scope.correctAnswer = true
      else
        $scope.score.wrong += 1
        delay = 5000
        $scope.mistake =
          entered: $scope.answer
          question: $scope.question.kana
          answer: $scope.question.answer

      $timeout($scope.resetQuestion, delay)

]