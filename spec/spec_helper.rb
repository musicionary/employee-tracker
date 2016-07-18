ENV['RACK_ENV'] = 'test'

require("sinatra/activerecord")
require('rspec')
require('pg')
require('division')
require('employee')
require('project')

RSpec.configure do |config|
  config.before(:each) do
    Division.all().each() do |division|
      division.destroy()
    end
    Employee.all().each() do |employee|
      employee.destroy()
    end
    Project.all().each() do |project|
      project.destroy()
    end
  end
  config.after(:each) do
    Division.all().each() do |division|
      division.destroy()
    end
    Employee.all().each() do |employee|
      employee.destroy()
    end
    Project.all().each() do |project|
      project.destroy()
    end
  end

end
