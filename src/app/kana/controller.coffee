
modules = [
  'kana.service'
]

kana = angular.module 'kana.controller', modules

kana.controller 'KanaCtrl', ['$scope', '$state', '$timeout', 'kanaService', ($scope, $state, $timeout, kanaService) ->
  $scope.question = kanaService.getQuestion $state.current.name
  $scope.score =
    right: 0
    wrong: 0
  answered = false

  resetQuestion = ->
    $scope.correctAnswer = undefined
    $scope.answer = ''
    $scope.question = kanaService.getQuestion($state.current.name)
    answered = false

    # restart the countdown as well
    $scope.$emit 'countdown:restart'

  # Stops the countdown and setup the next question in X ms (X == delay)
  transitionToNextQuestion = ->
    delay = if $scope.correctAnswer then 1000 else 4000
    $scope.$emit 'countdown:stop'

    $timeout(resetQuestion, delay)

  $scope.checkAnswer = () ->
    if $scope.answer and not answered
      answered = true
      if $scope.answer is $scope.question.kana or $scope.answer is $scope.question.answer
        $scope.correctAnswer = true
        $scope.score.right += 1
      else
        $scope.score.wrong += 1
        $scope.correctAnswer = false

      transitionToNextQuestion()

  # Event will be emitted by the directive when the countdown reaches 0
  $scope.$on 'countdown:over', ->
    $scope.correctAnswer = false
    transitionToNextQuestion()
]