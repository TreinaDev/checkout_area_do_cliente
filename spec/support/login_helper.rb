module LoginHelper
  def client_login
    client = Client.create!(email: 'client@client.com.br', password: '12345678')
    login_as client, scope: :client
    client
  end  
end