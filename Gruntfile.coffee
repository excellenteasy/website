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
  grunt.loadNpmTasks 'grunt-contrib-uglify'
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
      mid:
        options:
          width: 470
          overwrite: no
        files: getImageFilesArray 470
      iphone:
        options:
          width: 280
          overwrite: no
        files: getImageFilesArray 280
      low:
        options:
          width: 150
          overwrite: no
        files: getImageFilesArray 150

    imagemin:
      src:
        options:
          optimizationLevel: 7
        files: [
          expand: on
          cwd: 'src/blog/_images'
          src: ['*']
          dest: 'src/blog/_images'
        ]
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
          { expand: on, cwd: 'src/img/', src: ['sprites.png', 'sprites@2x.png'], dest: 'build/img' }
          'build/robots.txt': 'src/robots.txt'
          'build/sitemap.xml': 'src/sitemap.xml'
        ]

    cssmin:
      blog:
        files: [
          'build/blog/assets/css/style-4.css': 'build/blog/assets/css/style.css'
          'build/blog/assets/css/search-1.css': 'build/blog/assets/css/search.css'
        ]

    concat:
      options:
        separator: ';'
      build:
        dest: 'build/blog/assets/js/c-1.js'
        src: [
          'src/blog/assets/_js/jquery.min.js'
          'src/blog/assets/_js/jquery.unveil.min.js'
          'src/blog/assets/_js/enquire.js'
          'src/blog/assets/_js/custom.js'
        ]
      search:
        dest: 'build/blog/assets/js/search-2.js'
        src: [
          'src/blog/assets/_js/lodash.custom.js'
          'src/js/lib/jquery.min.js'
          'src/blog/assets/_js/jquery.autogrow.js'
          'src/blog/assets/_js/jquery.fuzzymatch.js'
          'src/blog/assets/_js/search.js'
        ]
      contact:
        dest: 'build/js/contact.js'
        src: [
          'src/js/lib/jquery.min.js'
          'src/js/lib/nod.min.js'
          'src/js/contact.js'
        ]

    uglify:
      dist:
        files:
          'build/blog/assets/js/c-1.js': [
            'src/blog/assets/_js/jquery.min.js'
            'src/blog/assets/_js/jquery.unveil.min.js'
            'src/blog/assets/_js/enquire.js'
            'src/blog/assets/_js/custom.js'
          ]
          'build/blog/assets/js/search-2.js': [
            'src/blog/assets/_js/lodash.custom.js'
            'src/js/lib/jquery.min.js'
            'src/blog/assets/_js/jquery.autogrow.js'
            'src/blog/assets/_js/search.js'
          ]
      contact:
        files: 'build/js/contact.js': [
          'src/js/lib/jquery.min.js'
          'src/js/lib/nod.min.js'
          'src/js/contact.js'
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
      dist:
        options: mode: 'gzip'
        files: [
          expand: on
          cwd: 'build/'
          src: ['**/*.html','**/*.css','**/*.js']
          dest: 'build'
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
        tasks: ['build']
      less:
        files: ['src/less/**/*']
        tasks: ['build']
      jade:
        files: ['src/jade/**/*']
        tasks: ['build']
      jekyll:
        files: ['src/blog/**/*']
        tasks: ['build']

  grunt.registerTask '_build', [
    'copy:build'
    'less:build'
    'jade:build'
    'concat:contact'
    'shell:jekyll'
    'cssmin:blog'
    'htmlmin:blog'
  ]

  grunt.registerTask 'build', [
    '_build'
    'concat:build'
    'concat:search'
  ]

  grunt.registerTask 'images', [
    'imagemin:src'
    'image_resize'
    'imagemin:dist'
  ]

  grunt.registerTask 'dist', [
    'clean:build'
    '_build'
    'uglify:contact'
    'uglify:dist'
    'compress:dist'
    'images'
    'shell:s3'
  ]

  grunt.registerTask 'default', [
    'build'
    'watch'
  ]
