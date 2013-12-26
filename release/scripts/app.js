/**
 * Nihongo - v0.0.1 - 2013-12-26
 * By Vincent Prouillet
 */
(function(){var a,b;b=["templates","nihongo.kana","ui.router.state","countdown"],a=angular.module("nihongo",b),a.config(["$stateProvider","$urlRouterProvider",function(a,b){return b.otherwise("/hiragana")}]),a.controller("AppCtrl",["$scope","$location",function(a){return a.$on("$stateChangeSuccess",function(b,c){return angular.isDefined(c.data.pageTitle)&&(a.pageTitle=c.data.pageTitle),a.currentTab=c.name})}])}).call(this),function(){var a,b;b=["kana.service"],a=angular.module("kana.controller",b),a.controller("KanaCtrl",["$scope","$state","$timeout","kanaService",function(a,b,c,d){var e,f,g;return a.question=d.getQuestion(b.current.name),a.score={right:0,wrong:0},e=!1,f=function(){return a.correctAnswer=void 0,a.answer="",a.question=d.getQuestion(b.current.name),e=!1,a.$emit("countdown:restart")},g=function(){var b;return b=a.correctAnswer?1e3:4e3,a.$emit("countdown:stop"),c(f,b)},a.checkAnswer=function(){return a.answer&&!e?(e=!0,a.answer===a.question.kana||a.answer===a.question.answer?(a.correctAnswer=!0,a.score.right+=1):(a.score.wrong+=1,a.correctAnswer=!1),g()):void 0},a.$on("countdown:over",function(){return a.score.wrong+=1,a.correctAnswer=!1,g()})}])}.call(this),function(){var a,b;b=["ui.router.state","kana.controller"],a=angular.module("nihongo.kana",b),a.config(["$stateProvider",function(a){return a.state("hiragana",{url:"/hiragana",controller:"KanaCtrl",templateUrl:"kana/index.html",data:{pageTitle:"Hiragana"}}),a.state("katakana",{url:"/katakana",controller:"KanaCtrl",templateUrl:"kana/index.html",data:{pageTitle:"Katakana"}})}])}.call(this),function(){var a;a=angular.module("kana.service",[]),a.factory("kanaService",[function(){var a,b,c,d;return d={},a=function(a){var b;return b=Object.keys(a),b[b.length*Math.random()<<0]},b={あ:"a",い:"i",う:"u",え:"e",お:"o",か:"ka",き:"ki",く:"ku",け:"ke",こ:"ko",さ:"sa",し:"shi",す:"su",せ:"se",そ:"so",た:"ta",ち:"chi",つ:"tsu",て:"te",と:"to",な:"na",に:"ni",ぬ:"nu",ね:"ne",の:"no",は:"ha",ひ:"hi",ふ:"fu",へ:"he",ほ:"ho",ま:"ma",み:"mi",む:"mu",め:"me",も:"mo",や:"ya",ゆ:"yu",よ:"yo",ら:"ra",り:"ri",る:"ru",れ:"re",ろ:"ro",わ:"wa",を:"o",ん:"n",が:"ga",ぎ:"gi",ぐ:"gu",げ:"ge",ご:"go",ざ:"za",じ:"ji",ず:"zu",ぜ:"ze",ぞ:"zo",だ:"da",ぢ:"ji",づ:"zu",で:"de",ど:"do",ば:"ba",び:"bi",ぶ:"bu",べ:"be",ぼ:"bo",ぱ:"pa",ぴ:"pi",ぷ:"pu",ぺ:"pe",ぽ:"po",きゃ:"kya",きゅ:"kyu",きょ:"kyo",しゃ:"sha",しゅ:"shu",しょ:"sho",ちゃ:"cha",ちゅ:"chu",ちょ:"cho",にゃ:"nya",にゅ:"nyu",にょ:"nyo",ひゃ:"hya",ひゅ:"hyu",ひょ:"hyo",みゃ:"mya",みゅ:"myu",みょ:"myo",りゃ:"rya",りゅ:"ryu",りょ:"ryo",ぎゃ:"gya",ぎゅ:"gyu",ぎょ:"gyo",じゃ:"ja",じゅ:"ju",じょ:"jo",ぢゃ:"ja",ぢゅ:"ju",ぢょ:"jo",びゃ:"bya",びゅ:"byu",びょ:"byo",ぴゃ:"pya",ぴゅ:"pyu",ぴょ:"pyo"},c={ア:"a",イ:"i",ウ:"u",エ:"e",オ:"o",カ:"ka",キ:"ki",ク:"ku",ケ:"ke",コ:"ko",サ:"sa",シ:"shi",ス:"su",セ:"se",ソ:"so",タ:"ta",チ:"chi",ツ:"tsu",テ:"te",ト:"to",ナ:"na",ニ:"ni",ヌ:"nu",ネ:"ne",ノ:"no",ハ:"ha",ヒ:"hi",フ:"fu",ヘ:"he",ホ:"ho",マ:"ma",ミ:"mi",ム:"mu",メ:"me",モ:"mo",ヤ:"ya",ユ:"yu",ヨ:"yo",ラ:"ra",リ:"ri",ル:"ru",レ:"re",ロ:"ro",ワ:"wa",ヲ:"o",ン:"n",ガ:"ga",ギ:"gi",グ:"gu",ゲ:"ge",ゴ:"go",ザ:"za",ジ:"ji",ズ:"zu",ゼ:"ze",ゾ:"zo",ダ:"da",ヂ:"ji",ヅ:"zu",デ:"de",ド:"do",バ:"ba",ビ:"bi",ブ:"bu",ベ:"be",ボ:"bo",パ:"pa",ピ:"pi",プ:"pu",ペ:"pe",ポ:"po",キャ:"kya",キュ:"kyu",キョ:"kyo",シャ:"sha",シュ:"shu",ショ:"sho",チャ:"cha",チュ:"chu",チョ:"cho",ニャ:"nya",ニュ:"nyu",ニョ:"nyo",ヒャ:"hya",ヒュ:"hyu",ヒョ:"hyo",ミャ:"mya",ミュ:"myu",ミョ:"myo",リャ:"rya",リュ:"ryu",リョ:"ryo",ギャ:"gya",ギュ:"gyu",ギョ:"gyo",ジャ:"ja",ジュ:"ju",ジョ:"jo",ヂャ:"ja",ヂュ:"ju",ヂョ:"jo",ビャ:"bya",ビュ:"byu",ビョ:"byo",ピャ:"pya",ピュ:"pyu",ピョ:"pyo",イェ:"ye",ウィ:"wi",ウェ:"we",ウォ:"wo",ヴァ:"va",ヴィ:"vi",ヴ:"vu",ヴェ:"ve",ヴォ:"vo",シェ:"she",ジェ:"je",チェ:"che",ティ:"ti",トゥ:"tu",ディ:"di",ドゥ:"du",ツァ:"tsa",ツィ:"tsi",ツェ:"tse",ツォ:"tso",ファ:"fa",フィ:"fi",フェ:"fe",フォ:"fo",ヴャ:"vya",ヴュ:"vyu",ヴョ:"vyo",チュ:"tyu",ヂュ:"dyu",フュ:"fyu"},d.getQuestion=function(d){var e,f,g;return g="hiragana"===d?b:c,f=a(g),e={kana:f,answer:g[f]}},d}])}.call(this),function(){var a;a=angular.module("countdown",[]),a.directive("countdown",[function(){return{restrict:"E",template:"<div class='countdown'>{{ countdown }}</div>",controller:["$scope","$element","$attrs","$interval","$rootScope",function(a,b,c,d,e){var f,g,h;return g=parseInt(c.start,10),f=void 0,h=function(){var b;return a.countdown=g,b=function(){return a.countdown=a.countdown-1,0===a.countdown?(d.cancel(f),e.$broadcast("countdown:over")):void 0},f=d(b,1e3)},a.$on("countdown:restart",function(){return d.cancel(f),h()}),a.$on("countdown:stop",function(){return d.cancel(f)}),h(),b.bind("$destroy",function(){return d.cancel(f)})}]}}])}.call(this),angular.module("templates",["kana/index.html"]),angular.module("kana/index.html",[]).run(["$templateCache",function(a){a.put("kana/index.html",'\n\n<div class="question-container large-9 columns large-centered">\n\n  <div class="sidebar large-3 columns">\n    <countdown start="5"></countdown>\n\n    <span class="score correct">{{ score.right }} ✔</span>\n    <span class="score mistake">{{ score.wrong }} ✕</span>\n  </div>\n\n  <div class="question large-9 columns">\n    <strong>Recognize the kana (type in japanese or romaji and press enter)</strong>\n\n    <p>\n      {{ question.kana }}\n      <span class="correction" ng-if="correctAnswer==false">{{ question.answer }}</span>\n    </p>\n\n    <form ng-submit="checkAnswer()">\n      <input type="text" ng-model="answer" placeholder="Answer" ng-class="{correct: correctAnswer, mistake: correctAnswer==false}" />\n    </form>\n\n  </div>\n</div>\n')}]);