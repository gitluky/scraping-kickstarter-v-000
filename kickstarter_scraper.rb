# require libraries/modules here
require 'nokogiri'
require 'pry'

def create_project_hash
  # write your code here
  html = File.read('fixtures/kickstarter.html')

  kickstarter = Nokogiri::HTML(html)

#projects: kickstarter.css('li.project.grid_4')
#title: projects.css("h2.bbcard_name strong a").text
#image link: projects.css('div.project-thumbnail a img').attribute('src').value
#description: projects.css('.bbcard_blurb').text
#location: projects.css('.project-meta li a').text
#funded: projects.css('.first.funded strong').text.to_i
  projects = {}
  kickstarter.css('li.project.grid_4').each.tap do |project|
    title = project.css("h2.bbcard_name strong a").text
    projects[title.to_sym] = {
      :image_link = project.css('div.project-thumbnail a img').attribute('src').value
      :description = project.css('.bbcard_blurb').text
      :location = project.css('.project-meta span.location-name').text
      :funded = project.css('.first.funded strong').text.gsub('%','').to_i
    }
  end
end

puts create_project_hash
