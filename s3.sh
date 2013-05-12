#!/bin/bash
set -x verbose

# favicon
s3cmd sync --acl-public --guess-mime-type build/favicon.ico s3://excellenteasy.com/website/favicon.ico

# site images
s3cmd sync --acl-public --add-header "Cache-Control: private, max-age=31536000" --guess-mime-type \
  -r build/img s3://excellenteasy.com/website/

# gzipped assets (css, js)

# site main.css
s3cmd sync --acl-public --mime-type "text/css" --add-header="Content-Encoding: gzip" \
  --add-header "Cache-Control: private, max-age=31536000" \
  --add-header "Expires: 31536000" \
  --add-header "Vary: Accept-Encoding" \
  build/css/main.css.gz s3://excellenteasy.com/website/css/main.css

# blog style.css
s3cmd sync --acl-public --mime-type "text/css" --add-header="Content-Encoding: gzip" \
  --add-header "Cache-Control: private, max-age=31536000" \
  --add-header "Expires: 31536000" \
  --add-header "Vary: Accept-Encoding" \
  build/blog/assets/css/style-4.css.gz s3://excellenteasy.com/website/blog/assets/css/style-4.css

# blog javascript
s3cmd sync --acl-public --mime-type "text/javascript" --add-header="Content-Encoding: gzip" \
  --add-header "Cache-Control: private, max-age=31536000" \
  --add-header "Expires: 31536000" \
  --add-header "Vary: Accept-Encoding" \
  build/blog/assets/js/c-1.js.gz s3://excellenteasy.com/website/blog/assets/js/c-1.js

# blog img assets
s3cmd sync --acl-public --guess-mime-type --add-header "Cache-Control: private, max-age=31536000" \
  --add-header "Expires: 31536000" \
  -r build/blog/assets/img s3://excellenteasy.com/website/blog/

# blog content images
s3cmd sync --acl-public --guess-mime-type --add-header "Cache-Control: private, max-age=31536000" \
  --add-header "Expires: 31536000" \
  -r build/blog/images s3://excellenteasy.com/website/blog/

# ATOM/RSS
s3cmd sync --acl-public --mime-type "application/atom+xml" build/blog/atom.xml s3://excellenteasy.com/website/blog/atom.xml
s3cmd sync --acl-public --mime-type "application/rss+xml" build/blog/rss.xml s3://excellenteasy.com/website/blog/rss.xml

echo "s3cmd: Done."
