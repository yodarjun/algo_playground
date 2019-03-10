class Boggle
  def initialize(board, dictionary)
    @board = board
    @dictionary = dictionary
    @results = []
  end

  def find_words
    board_dimension.times do |i|
      board_dimension.times do |j|
        positions = []
        str = ""

        find_all_words(str, positions, i, j)
      end
    end

    @results
  end

  def find_all_words(string, positions, i, j)
    string += @board[i][j]

    cloned_positions = positions.dup
    if valid_word?(string)
      puts string
      @results << string
    end

    cloned_positions << "#{i}-#{j}"

    adjacent_positions(cloned_positions, i, j).each do |pos|
      pos_i = pos[0]
      pos_j = pos[1]

      find_all_words(string, cloned_positions, pos_i, pos_j)
    end
  end

  def board_dimension
    @board_dimension ||= @board.length
  end

  def adjacent_positions(positions, i, j)
    adj_positions = []
    incremented_i = i + 1 unless (i + 1 >= board_dimension)
    incremented_j = j + 1 unless (j + 1 >= board_dimension)
    decremented_i = i - 1 unless (i - 1 < 0)
    decremented_j = j - 1 unless (j - 1 < 0)

    [decremented_i, i, incremented_i].compact.each do |i_pos|
      [decremented_j, j, incremented_j].compact.each do |j_pos|
        adj_positions << [i_pos, j_pos] unless (positions.include?("#{i_pos}-#{j_pos}"))
      end
    end

    adj_positions
  end

  def valid_word?(string)
    return false if (string.length == 1)
    @dictionary.include?(string)
  end
end
