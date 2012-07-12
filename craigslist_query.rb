require 'rubygems'
require 'open-uri'
require 'nokogiri'
require './listing.rb'

class CraigslistQuery

  attr_reader :query_list

  def initialize(url)
     @doc = Nokogiri::HTML(open(url))
     @query_list = []
     parse_doc
  end
  
  def parse_doc()
    # puts @doc.inspect
    @doc.css('p.row a').each do |link_css|
      url  = link_css.attr('href')
      posting_doc = Nokogiri::HTML(open(url))
      email_css = posting_doc.css('span.returnemail a')
      @query_list << Listing.new(title(link_css), url, email_address(email_css), price(link_css)) if email_css
    end #end each
  end #end parse_url
  
  def title(link_css)
    # puts link_css.content
    link_css.content
  end
  
  def email_address(email_css)
    email_address = email_css.children.text
  end
  
  def price(link_css)
    if link_css.content.scan(/^\$(\s*\d+)/).first == nil 
      price = nil
    else
      price = link_css.content.scan(/^\$(\s*\d+)/).first.first
    end
    price
  end

end #end CraigslistQuery


