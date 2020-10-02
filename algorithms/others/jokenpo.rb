def jokenpo(times)
  options = ['rock', 'paper', 'scissors']
  one = 0
  two = 0

  while times > 0
    player_one = options.sample
    player_two = options.sample

    if player_one == player_two
      puts "Both chose #{player_one}. That's a tie, try again"
    elsif player_one == 'rock' && player_two == 'paper'
      two += 1
      puts "Player one chose: #{player_one} and Player Two chose: #{player_two}. Player Two Wins!"
    elsif player_one == 'rock' && player_two == 'scissors'
      one += 1
      puts "Player one chose: #{player_one} and Player Two chose: #{player_two}. Player One Wins!"
    elsif player_one == 'paper' && player_two == 'scissors'
      two += 1
      puts "Player one chose: #{player_one} and Player Two chose: #{player_two}. Player Two Wins!"
    elsif player_one == 'paper' && player_two == 'rock'
      one += 1
      puts "Player one chose: #{player_one} and Player Two chose: #{player_two}. Player One Wins!"
    elsif player_one == 'scissors' && player_two == 'rock'
      two += 1
      puts "Player one chose: #{player_one} and Player Two chose: #{player_two}. Player Two Wins!"
    else player_one == 'scissors' && player_two == 'paper'
      one += 1
      puts "Player one chose: #{player_one} and Player Two chose: #{player_two}. Player One Wins!"
    end

    times -= 1
  end

  if one > two
    puts 'Player One is the winner!'
  elsif two > one
    puts 'Player Two is the winner!'
  elsif two == one
    puts 'A boring tie'
  end
end

puts 'Enter the number of matches: '

times = gets.chomp.to_i

jokenpo(times)
