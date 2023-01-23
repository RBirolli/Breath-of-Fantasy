require_relative "./game"
require_relative "./interface"
require "pry-byebug"

players = []

for i in 0..1 do
    ###  Coletar os dados básicos de cada jogados
    players[i] = get_player(i)
end

puts "O jogo começou\nBatalha entre #{players[0][:name]} e #{players[1][:name]}"

defender = 0
while players[defender][:energy_points] > 0
    for attacker in 0..1 do
        defender = attacker.zero? ? 1 : 0

        puts "#{players[attacker][:name]} atacou #{players[defender][:name]}"
        result = play_round(rand(0..100), players[attacker][:power_points])

        players[defender][:energy_points] -= result[:hp]
        puts "#{result[:message]}"
        break if players[defender][:energy_points] <= 0
    end
end

attacker = defender.zero? ? 1 : 0
puts "\nJogo acabou, o vencedor foi #{players[attacker][:name]} com HP restante de #{players[attacker][:energy_points]}\n"
