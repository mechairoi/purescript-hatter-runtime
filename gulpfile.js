'use strict';

var gulp        = require('gulp')
  , gutil       = require('gulp-util')
  , purescript  = require('gulp-purescript')
  , run         = require('gulp-run')
  , path        = require("path")
  ;

var paths = {
  src: 'src/**/*.purs',
  doc: 'MODULE.md',
  bowerSrc: 'bower_components/purescript-*/src/**/*.purs',
  dest: 'output/node_modules',
  test: 'test/**/*.purs',
};

(function() {
  var nodePath = process.env.NODE_PATH;
  var buildPath = path.resolve(paths.dest);
  process.env["NODE_PATH"] = nodePath ? (buildPath + ":" + nodePath) : buildPath;
})();

function stringSrc(filename, contents) {
  var src = require('stream').Readable({ objectMode: true });
  src._read = function () {
    this.push(new gutil.File({ cwd: "", base: "", path: filename, contents: new Buffer(contents) }));
    this.push(null);
  };
  return src;
}

gulp.task('make', function() {
  return gulp.src([paths.src].concat(paths.bowerSrc))
    .pipe(purescript.pscMake({output: paths.dest}));
});

gulp.task('test-make', function() {
  return gulp.src([paths.src, paths.test].concat(paths.bowerSrc))
    .pipe(purescript.pscMake({output: paths.dest}));
});

gulp.task('test', ['test-make'], function() {
  return stringSrc("test/test.js", "require('Test').main()")
    .pipe(run('node').exec());
});

gulp.task('docs', function() {
  return gulp.src(paths.src)
    .pipe(purescript.pscDocs())
    .pipe(gulp.dest(paths.doc));
});

gulp.task('psci', function() {
  return gulp.src([paths.src, paths.test].concat(paths.bowerSrc))
    .pipe(purescript.dotPsci());
});

gulp.task('watch', function() {
  gulp.watch(paths.src, ['make', 'docs']);
});

gulp.task('default', ['make', 'docs']);
