# require libraries/modules here
require 'nokogiri'
require 'pry'

def create_project_hash
  # write your code here
  html = File.read('fixtures/kickstarter.html')

  kickstarter = Nokogiri::HTML(html)
  binding.pry

#project: kickstarter.css('li.project.grid_4')
#title: project.css("h2.bbcard_name strong a").text
#image link: project.css('div.project-thumbnail a img').attribute('src').value
#description: project.css('.bbcard_blurb').text
#location: project.css('.project-meta li a').text
#funded: project.css('.first.funded').text

end

create_project_hash
