class TestClient
  include Rack::Test::Methods

  def get(endpoint, query = {})
    parse_response(super(endpoint, query, headers))
  end

  def post(endpoint, body = {})
    parse_response(super(endpoint, body, headers))
  end

  def put(endpoint, body = nil)
    parse_response(super(endpoint, body, headers))
  end

  def delete(endpoint)
    parse_response(super(endpoint, {}, headers))
  end

  def login(user, password)
    response = post('/users/sign_in', { email: user.email, password: password })
    @email = response[:body][:email]
    @token = response[:body][:authentication_token]
  end

  def headers
    {
      'HTTP_USER_EMAIL' => @email,
      'HTTP_USER_TOKEN' => @token
    }
  end

  def app
    Rails.application
  end

  def parse_response(response)
    parsed_body = JSON.parse(response.body)
    body = parsed_body.instance_of?(Array) ? parsed_body : parsed_body.deep_symbolize_keys
    {
      status: response.status,
      headers: response.headers,
      body: body
    }
  end
end
