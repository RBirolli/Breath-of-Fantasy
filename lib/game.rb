def play_round(power_factor, attacker_power)
    range_table = [
        {min_factor: 97, max_factor: 100, message: "Crítico!", factor: 2},
        {min_factor: 0, max_factor: 15, message: "Errou", factor: 0},
        {min_factor: 16, max_factor: 70, message: "Normal", factor: 0.33333},
        {min_factor: 71, max_factor: 96, message: "Sorte!!!", factor: 1.2}
    ]

    result_hash = {}
    factor_range = range_table.select{|r| power_factor >= r[:min_factor] and power_factor <= r[:max_factor]}
    result_hash[:hp] = (attacker_power * factor_range[0][:factor]).to_i rescue 0
    result_hash[:message] = "#{factor_range[0][:message]} - #{result_hash[:hp]} HP"
    return result_hash
end
