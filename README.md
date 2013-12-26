[![Build Status](https://drone.io/github.com/Keats/nihongo/status.png)](https://drone.io/github.com/Keats/nihongo/latest)

# 日本語 (Nihongo)
Nihongo is an angular app made to review some parts of japanese (only kana for now, kanji later).

This is not a replacement of SRS tools like Anki or Memrise, this is meant to quickly review things you already know.

The app itself doesn't have a backend at all and uses my version of ng-boilerplate (https://github.com/Keats/ng-boilerplate)

# Dev setup
If you want to run the app yourself, you can follow the steps below (you will need ruby for compass/foundation gems).
```bash
  gem install compass
  gem install zurb-foundation
  npm install
  npm install -g grunt-cli
  npm install -g bower
  bower install
  grunt dev
```

And then open the index.html in the build directory.

# Next
I will try to add the N5, N4, N3 kanji relatively soon
