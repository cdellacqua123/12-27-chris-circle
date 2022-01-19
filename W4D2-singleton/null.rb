require 'singleton'
class Null
    attr_reader :symbol
    include Singleton

    def initialize
        @symbol = 'null'
    end
end
