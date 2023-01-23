def get_player(i)
    player = {}
    print "Entre a #{(i == 0 ? 'primeira ' : 'segunda ')} personagem: \n > "
    player[:name] = gets.chomp rescue ''
    print " E > "
    player[:energy_points] = gets.chomp.to_i rescue 0
    print " P > "
    player[:power_points] = gets.chomp.to_i rescue 0

    return player
end