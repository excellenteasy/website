module Jekyll
  class ImageBlock < Liquid::Block
    def initialize(tag_name, filename, tokens)
      super
      @image_name = filename.strip
      ext = File.extname(@image_name)
      @low_res = @image_name.gsub /#{ext}$/, "_280#{ext}"
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
      "<img src='#{low_res_image}' data-src='#{image_url}' title='#{title}' alt='#{alt}' />"
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

    def image_src
      "https://d2b0jc4z1uybmh.cloudfront.net/website/blog/images"
    end

    def image_url
      "#{image_src}/#{@image_name}"
    end

    def low_res_image
      "#{image_src}/#{@low_res}"
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
