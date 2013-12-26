describe 'Controller: kana', ->
  scope = undefined
  kanaCtrl = undefined

  beforeEach module('ui.router.state')
  beforeEach module('kana.controller')

  beforeEach inject(($rootScope, $controller) ->
    scope = $rootScope.$new()
    kanaCtrl = $controller('KanaCtrl',
      $scope: scope
    )
  )

  it 'should have gotten a question', ->
    expect(angular.isObject(scope.question)).to.be.ok
    expect(scope.question).to.have.keys ['kana', 'answer']

  it 'should increment the right score with a correct answer', ->
    scope.answer = scope.question.answer
    scope.checkAnswer()

    expect(scope.correctAnswer).to.be.ok
    expect(scope.score.right).to.equal 1
    expect(scope.score.wrong).to.equal 0

  it 'should also accept the anser in japanese', ->
    scope.answer = scope.question.kana
    scope.checkAnswer()

    expect(scope.correctAnswer).to.be.ok
    expect(scope.score.right).to.equal 1
    expect(scope.score.wrong).to.equal 0

  it 'should increment the wrong score with a wrong answer', ->
    scope.answer = 'roasted-ducks'
    scope.checkAnswer()

    expect(scope.correctAnswer).to.not.be.ok
    expect(scope.score.wrong).to.equal 1
    expect(scope.score.right).to.equal 0

  it 'should not allow someone to change his answer', ->
    scope.answer = 'roasted-ducks'
    scope.checkAnswer()
    scope.answer = scope.question.answer
    scope.checkAnswer()

    expect(scope.correctAnswer).to.not.be.ok
    expect(scope.score.wrong).to.equal 1
    expect(scope.score.right).to.equal 0

  it 'should emit an event to stop the countdown after an answer', ->
    emitStub = sinon.stub(scope, '$emit')
    scope.answer = 'roasted-ducks'
    scope.checkAnswer()

    expect(emitStub.called).to.be.ok

  it 'should have a small delay before next question if the answer was correct', inject(($timeout) ->
    firstQuestion = scope.question
    scope.answer = scope.question.answer
    scope.checkAnswer()
    $timeout.flush 1000

    expect(scope.question).to.not.deep.equal firstQuestion
  )

  it 'should have a bigger delay before next question if the answer was correct', inject(($timeout) ->
    firstQuestion = scope.question
    scope.answer = 'flying-potatoes'
    scope.checkAnswer()

    # Should still be equal at that time
    $timeout.flush 1000
    expect(scope.question).to.deep.equal firstQuestion

    $timeout.flush 3000
    expect(scope.question).to.not.deep.equal firstQuestion
  )
