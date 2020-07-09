module LoginHelper
  def client_login
    client = create(:client)
    login_as client, scope: :client
    client
  end

  def employee_login(employee = create(:employee))
    login_as employee, scope: :employee
    employee
  end
end
