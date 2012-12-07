%w(sinatra dino yaml json).each do |lib|
  require lib
end


board = Dino::Board.new(Dino::TxRx.new)
RED = Dino::Components::Led.new(pin: 4, board: board)
YELLOW = Dino::Components::Led.new(pin: 2, board: board)
GREEN = Dino::Components::Led.new(pin: 3, board: board)
RED.off
YELLOW.off
GREEN.off


get '/' do
  haml :index
end

get '/flash/all' do
  flash_all
end

get '/green' do
  go_green
end

get '/red' do
  go_red
end

get '/yellow' do
  go_yellow
end

get '/red/on' do
  RED.on
end

get '/red/off' do
  RED.off
end

get '/green/on' do
  GREEN.on
end

get '/green/off' do
  GREEN.off
end

get '/yellow/on' do
  YELLOW.on
end

get '/yellow/off' do
  YELLOW.off
end

def flash_all
  5.times do
    RED.on
    YELLOW.on
    GREEN.on
    sleep 0.1
    RED.off
    YELLOW.off
    GREEN.off
    sleep 0.1
  end
end

def go_red
  RED.on
  YELLOW.off
  GREEN.off
end

def go_yellow
  YELLOW.on
  GREEN.off
  RED.off
end

def go_green
  GREEN.on
  YELLOW.off
  RED.off
end


