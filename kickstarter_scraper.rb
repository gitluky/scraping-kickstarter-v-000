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
  projects = {}
  kickstarter.css('li.project.grid_4').each do |project|
    projects[project] = {}
    projects[project]itle = project.css("h2.bbcard_name strong a").text
    projects[project]= project.css('div.project-thumbnail a img').attribute('src').value
    projects[project] = project.css('.bbcard_blurb').text
    projects[project] = project.css('.project-meta span.location-name').text
    projects[project] = project.css('.first.funded strong').text.gsub('%','').to_i
  end
  projects
end

create_project_hash
