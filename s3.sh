#!/bin/bash
set -x verbose

# site images
s3cmd sync --acl-public  --guess-mime-type \
  --add-header "Cache-Control: public, max-age=31536000" \
  --add-header "Expires: 31536000" \
  -r build/img s3://excellenteasy.com/website/

# blog img assets
s3cmd sync --acl-public  --guess-mime-type \
  --add-header "Cache-Control: public, max-age=31536000" \
  --add-header "Expires: 31536000" \
  -r build/assets/img s3://excellenteasy.com/website/assets/

# gzipped assets

# css
s3cmd sync --acl-public --mime-type "text/css" \
  --add-header="Content-Encoding: gzip" \
  --add-header "Cache-Control: public, max-age=31536000" \
  --add-header "Expires: 31536000" \
  --add-header "Vary: Accept-Encoding" \
  -r s3/css/website s3://excellenteasy.com/

# javascript
s3cmd sync --acl-public --mime-type "text/javascript" \
  --add-header="Content-Encoding: gzip" \
  --add-header "Cache-Control: public, max-age=31536000" \
  --add-header "Expires: 31536000" \
  --add-header "Vary: Accept-Encoding" \
  -r s3/js/website s3://excellenteasy.com/

echo "s3cmd: Done."
