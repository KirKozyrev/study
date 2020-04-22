module Inatra
  class << self
    def routes
    end

    def call(env)
      [200, {"Content-Type" => "text/html"}, ["Hello World"]]
    end
  end
end
