module Display
  def introduction
    <<~HEREDOC
      Welcome to Connect Four!
      This is a PvP game. Match the same colour in four consecutive cells to win!
      Goodluck!
      Type any to continue:
    HEREDOC
    gets.chomp
  end

  def ask_player_name(number)
    "Enter player#{number} name: "
    gets.chomp
  end

  def set_player_name
    @player1.name = ask_player_name(1)
    @player2.name = ask_player_name(2)
  end
end
