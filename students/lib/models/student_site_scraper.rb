require 'pry'
require 'nokogiri'
require 'open-uri'


class StudentSiteScraper
	attr_accessor :scraped_data

	def initialize(url)
		@scraped_data = Nokogiri::HTML(open(url))
	end

  def get_images
    image_arr = @scraped_data.css("div.blog-thumb a img").collect do |photo|
      photo.attr("src").include?("http") ? photo.attr("src") : "http://students.flatironschool.com/#{photo.attr("src")}"
    end
	end

	def get_names
    name_arr = @scraped_data.css("div.big-comment h3 a").collect do |name|
      name.text 
    end
	end

	def get_titles
    title_arr = @scraped_data.css("p.home-blog-post-meta").collect do |title|
      title.text 
    end
	end

	def get_blurbs
    blurb_arr = @scraped_data.css("div.excerpt p").collect do |blurb|
      blurb.text 
    end
	end

end

a = StudentSiteScraper.new("http://students.flatironschool.com/")
binding.pry