require("sinatra/activerecord")
require('sinatra')
require('sinatra/reloader')
require('./lib/division')
require('./lib/employee')
require('./lib/project')
require('pg')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/hr_manager') do
  @divisions = Division.all()
  @employees = Employee.all()
  erb(:hr_manager)
end

get('/pj_manager') do
  @projects = Project.all()
  erb(:pj_manager)
end

get('/pj_manager/projects/:id') do
  @project = Project.find(params.fetch('id').to_i())
  @employees = Employee.all()
  erb(:project)
end

get('/hr_manager/divisions/:id') do
  @division = Division.find(params.fetch('id').to_i())
  @employees = Employee.all()
  erb(:division)
end

get('/hr_manager/employees/:id') do
  @employee = Employee.find(params.fetch('id').to_i())
  @divisions = Division.all()
  @projects = Project.all()
  erb(:employee)
end

post('/pj_manager/projects') do
  client = params.fetch('client')
  description = params.fetch('description')
  due_date = params.fetch('due_date')
  project = Project.create({client: client, description: description, due_date: due_date})
  @projects = Project.all()
  @employees = Employee.all()
  erb(:pj_manager)
end

post('/hr_manager/divisions') do
  name = params.fetch('name')
  division = Division.create({name: name})
  @divisions = Division.all()
  @employees = Employee.all()
  erb(:hr_manager)
end

post('/hr_manager/employees') do
  first_name = params.fetch('first_name')
  last_name = params.fetch('last_name')
  email = params.fetch('email')
  division_id = params.fetch('division_id')
  employee = Employee.create({first_name: first_name, last_name: last_name, email: email, division_id: division_id})
  @divisions = Division.all()
  @employees = Employee.all()
  erb(:hr_manager)
end

patch('/pj_manager/projects/:id') do
  @employees = Employee.all()
  @project = Project.find(params.fetch('id').to_i())
  client = params.fetch("client")
  description = params.fetch("description")
  due_date = params.fetch("due_date")
  employee_id = params.fetch("employee_id", nil)
  if employee_id
    employee = Employee.find((employee_id).to_i())
    @project.employees.push(employee)
  end
  @project.update({client: client, description: description, due_date: due_date})

  erb(:project)
end

patch('/hr_manager/divisions/:id') do
  @division = Division.find(params.fetch('id').to_i())
  name = params.fetch("name")
  @division.update({name: name})
  erb(:division)
end

patch('/hr_manager/employees/:id') do
  @projects = Project.all()
  @employee = Employee.find(params.fetch('id').to_i())
  first_name = params.fetch("first_name")
  last_name = params.fetch('last_name')
  email = params.fetch('email')
  division_id = params.fetch('division_id', @employee.division_id())
  if division_id
    division = Division.find(division_id.to_i())
  end
  project_id = params.fetch("project_id", nil)
  if project_id
    project = Project.find(project_id.to_i())
    @employee.projects.push(project)
  end
  @employee.update({first_name: first_name, last_name: last_name, email: email, division_id: division_id})
  @divisions = Division.all()
  erb(:employee)
end

delete('/pj_manager/projects/:id') do
  @project = Project.find(params.fetch('id').to_i())
  @project.delete()
  @projects = Project.all()
  erb(:pj_manager)
end

delete('/hr_manager/divisions/:id') do
  @division = Division.find(params.fetch('id').to_i())
  @division.delete()
  @divisions = Division.all()
  @employees = Employee.all()
  erb(:hr_manager)
end

delete('/hr_manager/employees/:id') do
  @employee = Employee.find(params.fetch('id').to_i())
  @employee.delete()
  @employees = Employee.all()
  @divisions = Division.all()
  erb(:hr_manager)
end
