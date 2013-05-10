module Jekyll
  class ImageBlock < Liquid::Block
    def initialize(tag_name, filename, tokens)
      super
      @image_name = filename.strip
    end

    def render(context)
      load_options block_contents

      if link?
        "<a href='#{link_url}'>#{image_tag}</a>"
      else
        image_tag
      end
    end

    def image_tag
      "<img src='https://d2b0jc4z1uybmh.cloudfront.net/website/blog/assets/img/blank.png' data-src='#{image_url}' title='#{title}' alt='#{alt}' width='660px' />"
    end

    def load_options(contents)
      contents.each do |line|
        variable, value = parse_line(line)
        instance_variable_set("@#{variable}", value)
      end
    end

    def block_contents
      text = @nodelist[0]
      result = text.split(/\n/).map {|x| x.strip }.reject {|x| x.empty? }
      result
    end

    # turn " blah: bloop bleep" into ["blah", "bloop bleep"]
    def parse_line(line)
      matches = line.match(/^\s*(\S+):(.*)/)
      [matches.captures[0], matches.captures[1].strip]
    end

    def image_url
      "https://d2b0jc4z1uybmh.cloudfront.net/website/blog/images/#{@image_name}"
    end

    def link?
      !link_url.nil?
    end

    def link_url
      @link
    end

    def title
      @title || @image_name
    end

    def alt
      @alt || title
    end
  end
end

Liquid::Template.register_tag('image', Jekyll::ImageBlock)