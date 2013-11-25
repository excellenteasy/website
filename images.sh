#!/bin/bash
set -ex verbose

# blog content images
s3cmd sync --acl-public  --guess-mime-type \
  --add-header "Cache-Control: public, max-age=31536000" \
  --add-header "Expires: 31536000" \
  -r build/blog/images s3://excellenteasy.com/website/blog/

echo "Image upload: Done."
