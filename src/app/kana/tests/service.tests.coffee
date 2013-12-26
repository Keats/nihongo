describe 'Service: kana', ->
  service = undefined

  beforeEach module('kana.service')

  beforeEach inject((kanaService) ->
    service = kanaService
  )

  it 'should have a function to get a question', ->
    expect(angular.isFunction(service.getQuestion)).to.be.ok

  it 'should get a question for hiragana', ->
    question = service.getQuestion 'hiragana'
    expect(angular.isObject(question)).to.be.ok
    expect(question).to.have.keys ['kana', 'answer']

  it 'should get a question for katakana', ->
    question = service.getQuestion 'katakana'
    expect(angular.isObject(question)).to.be.ok
    expect(question).to.have.keys ['kana', 'answer']

  it 'should get a katakana question given random type', ->
    question = service.getQuestion 'flying-ducks'
    expect(angular.isObject(question)).to.be.ok
    expect(question).to.have.keys ['kana', 'answer']