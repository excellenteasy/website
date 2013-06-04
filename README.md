# excellenteasy-website

> generated static website

## Installation

```bash
npm install -g grunt-cli
npm install
sudo gem install rake
sudo gem install jekyll
sudo gem install therubyracer
sudo gem install jekyll-less
sudo gem install rdiscount
brew install s3cmd
```

## Configuration
You need to configure s3cmd in order to be able to update S3 assets.
This is required for using the `grunt dist` or `grunt shell:s3` commands.

`s3cmd --configure`

If you need access details, contact an administrator.


## Build

```bash
grunt build
```

## Distribution
Requires S3 credentials and SFTP access to EC2.
Requires EC2 SSH key `.pem` file. Store it in the root of the repo as `ec2.pem`.
```bash
grunt dist
```
