gulp       = require 'gulp'
sass       = require 'gulp-ruby-sass'
coffee     = require 'gulp-coffee'
plumber    = require 'gulp-plumber'
notify     = require 'gulp-notify'
open       = require 'gulp-open'
webserver  = require 'gulp-webserver'
protractor = require('gulp-protractor').protractor
karma      = require('karma').server

files =
  coffee: './src/scripts/**/*.coffee'
  sass  : './src/styles/**/*.sass'
  spec  : './spec/**/*.spec.js'
  app   : './app/scripts/**/*.js'
  coverage: './coverage/PhantomJS 1.9.8 (Mac OS X)/index.html'
  e2e: './e2e/**/*.spec.js'

errorHandler = ->
  notify.onError("Error: <%= error.message %>")


gulp.task 'coffee', ->
  gulp.src files.coffee
    .pipe plumber({errorHandler: errorHandler()})
    .pipe coffee({bare:false})
    .pipe gulp.dest('app/scripts')

gulp.task 'sass', ->
  plumber({errorHandler: notify.onError("Error: <%= error.message %>")})
    .pipe sass('./src/styles/')
    .pipe gulp.dest('app/style')

gulp.task 'karma', (done) ->
  karma.start
      configFile: __dirname + '/karma.conf.js'
      singleRun: true
    , done

gulp.task 'coverage', ->
  gulp.src files.coverage
  .pipe open('<%file.path%>')

gulp.task 'protractor', ->
  gulp.src [ files.e2e ]
    .pipe(protractor
      configFile: './protractor.conf.js'
      args: [
        '--baseUrl'
        'http://localhost:8080'
      ]
    ).on 'error', (e) ->
      console.log e

gulp.task 'webserver', ->
  gulp.src '.'
    .pipe(webserver
      port: 8080
    )

gulp.task 'watch', ['build'], ->
  gulp.watch files.coffee, ['coffee']
  gulp.watch files.sass, ['sass']
  gulp.watch [files.spec, files.app], ['karma']
  gulp.watch [files.e2e, files.app], ['karma']

gulp.task 'build', ['coffee', 'sass']
gulp.task 'default', ['webserver', 'watch']
