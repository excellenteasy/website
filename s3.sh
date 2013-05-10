#!/bin/bash
set -x verbose
s3cmd sync build/favicon.ico s3://excellenteasy.com/website/favicon.ico
s3cmd sync -r build/img s3://excellenteasy.com/website/
s3cmd sync -r build/css s3://excellenteasy.com/website/
s3cmd sync -r build/blog/assets s3://excellenteasy.com/website/blog/
s3cmd sync -r build/blog/images s3://excellenteasy.com/website/blog/
s3cmd sync build/blog/atom.xml s3://excellenteasy.com/website/blog/atom.xml
s3cmd sync build/blog/rss.xml s3://excellenteasy.com/website/blog/rss.xml
echo "s3cmd: Done."
