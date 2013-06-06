#!/bin/bash
set -x verbose

# site images
s3cmd sync --acl-public --add-header "Cache-Control: private, max-age=31536000" --guess-mime-type \
  --add-header "Expires: 31536000" \
  -r build/img s3://excellenteasy.com/website/

# blog content images
s3cmd sync --acl-public --guess-mime-type --add-header "Cache-Control: private, max-age=31536000" \
  --add-header "Expires: 31536000" \
  -r build/blog/images s3://excellenteasy.com/website/blog/

# blog img assets
s3cmd sync --acl-public --guess-mime-type --add-header "Cache-Control: private, max-age=31536000" \
  --add-header "Expires: 31536000" \
  -r build/blog/assets/img s3://excellenteasy.com/website/blog/assets/


# gzipped assets (css, js)

# site style
s3cmd sync --acl-public --mime-type "text/css" --add-header="Content-Encoding: gzip" \
  --add-header "Cache-Control: private, max-age=31536000" \
  --add-header "Expires: 31536000" \
  --add-header "Vary: Accept-Encoding" \
  build/css/main.css.gz s3://excellenteasy.com/website/css/main.css

# site javascript
s3cmd sync --acl-public --mime-type "text/css" --add-header="Content-Encoding: gzip" \
  --add-header "Cache-Control: private, max-age=31536000" \
  --add-header "Expires: 31536000" \
  --add-header "Vary: Accept-Encoding" \
  build/js/contact.js.gz s3://excellenteasy.com/website/js/contact.js

# blog style
s3cmd sync --acl-public --mime-type "text/css" --add-header="Content-Encoding: gzip" \
  --add-header "Cache-Control: private, max-age=31536000" \
  --add-header "Expires: 31536000" \
  --add-header "Vary: Accept-Encoding" \
  build/blog/assets/css/style-5.css.gz s3://excellenteasy.com/website/blog/assets/css/style-5.css

s3cmd sync --acl-public --mime-type "text/css" --add-header="Content-Encoding: gzip" \
  --add-header "Cache-Control: private, max-age=31536000" \
  --add-header "Expires: 31536000" \
  --add-header "Vary: Accept-Encoding" \
  build/blog/assets/css/search-1.css.gz s3://excellenteasy.com/website/blog/assets/css/search-1.css

# blog javascript
s3cmd sync --acl-public --mime-type "text/javascript" --add-header="Content-Encoding: gzip" \
  --add-header "Cache-Control: private, max-age=31536000" \
  --add-header "Expires: 31536000" \
  --add-header "Vary: Accept-Encoding" \
  build/blog/assets/js/c-3.js.gz s3://excellenteasy.com/website/blog/assets/js/c-3.js

s3cmd sync --acl-public --mime-type "text/javascript" --add-header="Content-Encoding: gzip" \
  --add-header "Cache-Control: private, max-age=31536000" \
  --add-header "Expires: 31536000" \
  --add-header "Vary: Accept-Encoding" \
  build/blog/assets/js/search-4.js.gz s3://excellenteasy.com/website/blog/assets/js/search-4.js



echo "s3cmd: Done."
