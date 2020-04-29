module Inatra
  class << self
    def routes(&block)
      @route = {}
      instance_eval(&block)
    end

    def method_missing(method, arg, &block)
      method = method.to_s

      @route.store(method, {}) if @route[method].nil?
      @route[method].store(arg, block)
    end

    def call(env)
      method = env['REQUEST_METHOD'].to_s.downcase
      path = env['PATH_INFO'].to_s.downcase

      if @route[method][path].nil?
        return [404, {}, 'Not Found']
      else
        @route[method][path].call
      end
    end
  end
end
