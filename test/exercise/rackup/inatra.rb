module Inatra
  class << self
    def routes(&block)
      @route = {}
      instance_eval(&block)
    end

    def method_missing(method, *args, &block)
      @route[method.to_s] = {}
      @route[method.to_s][args[0]] = block
    end

    def call(env)
      @route[env['REQUEST_METHOD'].downcase][env['PATH_INFO']].call
    end
  end
end
