class RequestApi
  def initialize(url)
    @url = url
  end

  def call
    check_status_code
  end

  private

  def check_status_code
    make_request.success?
  end

  def make_request
    Faraday.get(@url)
  end
end
