module Mocks
  class Routes

    def redirect(&block)
      block.call
    end

    def get(path, options)
    end

  end
end
