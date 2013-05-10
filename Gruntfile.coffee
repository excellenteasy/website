getImageFilesArray = (width) ->
  [
    expand: on
    cwd: 'src/blog/_images'
    src: ['*']
    dest: 'build/blog/images'
    rename: (destBase, destPath) ->
      ext = destPath.match /\.[0-9a-z]+$/i
      dest = destPath.replace /\.[0-9a-z]+$/i, "_#{width}#{ext}"
      dest = destBase+'/'+dest
  ]

module.exports = (grunt) ->

  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-compress'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-htmlmin'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-shell'
  grunt.loadNpmTasks 'grunt-image-resize'
  grunt.loadNpmTasks 'grunt-contrib-imagemin'
  grunt.loadNpmTasks 'grunt-contrib-concat'

  grunt.initConfig
    clean:
      build: ['build']

    image_resize:
      full:
        options:
          width: 660
          overwrite: no
        files: getImageFilesArray 660
      iphone:
        options:
          width: 280
          overwrite: no
        files: getImageFilesArray 280

    imagemin:
      dist:
        options:
          optimizationLevel: 7
        files: [
          expand: on
          cwd: 'build/blog/images'
          src: ['*']
          dest: 'build/blog/images'
        ]

    copy:
      build:
        files: [
          { expand: on, cwd: 'src/img/', src: ['sprites.png', 'sprites@2x.png'], dest: 'build/img' }
          { expand: on, cwd: 'src/img/', src: ['favicon.ico'], dest: 'build' }
          'build/robots.txt': 'src/robots.txt'
          'build/sitemap.xml': 'src/sitemap.xml'
        ]
      blog:
        files: [
          { expand: on, cwd: 'src/blog/_site/', src: ['**'], dest: 'build/blog'}
        ]

    cssmin:
      blog:
        files: [
          'build/blog/assets/css/style.css': 'build/blog/assets/css/style.css'
        ]

    concat:
      options:
        separator: ';'
      blogjs:
        files: [
          cwd: 'src/blog/assets/_js/'
          src: [
            'jquery.custom.min.js'
            'jquery.unveil.min.js'
            'enquire.min.js'
            'custom.js'
          ]
          dest: 'build/blog/assets/js/a.js'
        ]

    htmlmin:
      blog:
        options:
          removeComments: on
          collapseWhitespace: off
        files: [
          { expand: on, cwd: 'build/blog/', src: ['**/*.html'], dest: 'build/blog'}
        ]

    less:
      build:
        options:
          yuicompress: on
          optimization: 1
        files: [
          'build/css/main.css': 'src/less/main.less'
        ]

    jade:
      build:
        files: [
          'build/index.html': 'src/jade/index.jade'
          'build/contact/index.html': 'src/jade/contact/index.jade'
          'build/legal/index.html': 'src/jade/legal/index.jade'
        ]

    compress:
      build:
        options: mode: 'gzip'
        files: [
          { expand: on, cwd: 'build/', src: ['**/*.html','**/*.css'], dest: 'build' }
        ]

    shell:
      jekyll:
        command: 'jekyll build -s src/blog -d build/blog'
        stdout: on
        stderr: on
        failOnError: on
      s3:
        command: 'sh s3.sh'
        stdout: on
        stderr: on
        failOnError: on

    watch:
      img:
        files: ['src/img/**/*']
        tasks: ['copy:build']
      less:
        files: ['src/less/**/*']
        tasks: ['less:build']
      jade:
        files: ['src/jade/**/*']
        tasks: ['jade:build']
      jekyll:
        files: ['src/blog/**/*']
        tasks: ['shell:jekyll']

  grunt.registerTask 'build', [
    'clean:build'
    'copy:build'
    'less:build'
    'jade:build'
    'shell:jekyll'
    'concat:blogjs'
    'cssmin:blog'
    'htmlmin:blog'
    'compress:build'
  ]

  grunt.registerTask 'images', [
    'image_resize'
    'imagemin'
  ]

  grunt.registerTask 'dist', [
    'build'
    'images'
    'shell:s3'
  ]

  grunt.registerTask 'default', [
    'build'
    'watch'
  ]
