module LoginHelper
  def client_login
    client = create(:client)
    login_as client, scope: :client
    client
  end
end
