# require libraries/modules here
require 'nokogiri'
require 'pry'

def create_project_hash
  # write your code here
  html = File.read('fixtures/kickstarter.html')

  kickstarter = Nokogiri::HTML(html)
  binding.pry

#projects: kickstarter.css('li.project.grid_4')
#title: projects.css("h2.bbcard_name strong a").text
#image link: projects.css('div.project-thumbnail a img').attribute('src').value
#description: projects.css('.bbcard_blurb').text
#location: projects.css('.project-meta li a').text
#funded: projects.css('.first.funded strong').text.to_i

  projects.each do |project_info|
    project = Project.New
    project.title = project_info.css("h2.bbcard_name strong a").text
    project.img_link = project_info_info.css('div.project-thumbnail a img').attribute('src').value
    project.description = project_info.css('.bbcard_blurb').text
    project.location = project_info.css('.project-meta li a').text
    project.funded = project_info.css('.first.funded strong').text.to_i
  end
end

create_project_hash
