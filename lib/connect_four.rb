# frozen_string_literal: true

require_relative 'connect_four/version'

module ConnectFour
  class Error < StandardError; end
  # Your code goes here...
end

require_relative './connect_four/cell'
require_relative './connect_four/board'
require_relative './connect_four/circle'
