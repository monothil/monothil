gulp = require 'gulp'
bowerFiles = require 'main-bower-files'
typescript = require 'gulp-tsc'
del = require 'del'

process.env.NODE_ENV = 'development'

paths = {
  scripts: 'src/typescript/**/*.ts'
  dest: 'grails-app/assets/javascripts'
  vendorDest: 'grails-app/assets/vendor'
}

gulp.task 'default', ['build']

gulp.task 'clean', (cb) ->
  del [paths.dest, paths.vendorDest], cb

gulp.task 'bower', ->
  gulp.src bowerFiles()
    .pipe gulp.dest(paths.vendorDest)

gulp.task 'compile', ->
  gulp.src paths.scripts
    .pipe typescript { emitError: false }
    .pipe gulp.dest(paths.dest)

gulp.task 'watch', ['build'], ->
  gulp.watch paths.scripts, ['compile']

gulp.task 'build', ['clean', 'bower', 'compile']
