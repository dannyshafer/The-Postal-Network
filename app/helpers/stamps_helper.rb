require 'nokogiri'
require 'open-uri'

module StampsHelper
  def get_country_urls(country)
    country_name = country.name.split(" ")
    country_name = country_name.join("+")
    url = "http://search.aol.com/aol/image?s_it=searchbox.imagehome&v_t=na&q=" + country_name +"+postage"
    doc = Nokogiri::HTML(open(url))
    urls = []
    doc.css('div:nth-child(1) :nth-child(1) img').each do |image|
      if image['src'] != nil
        urls << image['src']
      end
    end
    return urls
  end

  def get_subject_urls(subject)
    subject_content = subject.split(" ")
    subject_content = subject_content.join("+")
    url = "http://search.aol.com/aol/image?s_it=searchbox.imagehome&v_t=na&q=" + subject_content +"+postage"
    doc = Nokogiri::HTML(open(url))
    urls = []
    doc.css('div:nth-child(1) :nth-child(1) img').each do |image|
      if image['src'] != nil
        urls << image['src']
      end
    end
    return urls
  end
end

