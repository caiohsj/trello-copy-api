class TestClient
  include Rack::Test::Methods

  def get(endpoint, query = {})
    super(endpoint, query, headers)
  end

  def post(endpoint, body = {})
    super(endpoint, body, headers)
  end

  def put(endpoint, body = nil)
    super(endpoint, body, headers)
  end

  def delete(endpoint)
    super(endpoint, {}, headers)
  end

  def headers
    {}
  end

  def app
    Rails.application
  end
end
