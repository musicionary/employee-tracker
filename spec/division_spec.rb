require('spec_helper')

describe(Division) do
  describe('#employees') do
    it("tells which employees are in the division") do
      test_division = Division.create({name: "Operations"})
      test_employee = Employee.create({first_name: "John", last_name: "Jacob", email: "johnjacob@jingleheimer.schmidt", division_id: test_division.id})
      expect(test_division.employees()).to(eq([test_employee]))
    end
  end
end
