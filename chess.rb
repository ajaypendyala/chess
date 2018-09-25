class Chess
  # chess_piece_positions method takes in chess piece type and position
  # as input and returns an array of potential board positions for that
  # piece in one move.

  def chess_piece_positions(type, curr_position)
    positions = []
    char = curr_position.split('')
    ascii = char[0].ord
    pointer = char[1].to_i

    # check for invalid input like out of bounds position or invalid chess piece

    if ascii < 97 || ascii > 104 || pointer < 1 || pointer > 8 || !%w[rook queen bishop knight].include?(type)
      puts 'Invalid chess position or piece'
      return
    end

    case type
    when 'rook'
      positions = rook_moves(positions, ascii, pointer)
    when 'queen'
      positions = rook_moves(positions, ascii, pointer)
      positions = bishop_moves(positions, ascii, pointer)
    when 'bishop'
      positions = bishop_moves(positions, ascii, pointer)
    when 'knight'
      positions = knight_moves(positions, ascii, pointer)
    end
    positions
  end

  # rook_moves method returns the potential positions when the piece travels in
  # a horizontal or vertical direction. The arrays u, d, r, l stand for up, down,
  # right and left of the piece. They contain the board positions for that direction

  def rook_moves(positions, ascii, pointer)
    u = []
    d = []
    r = []
    l = []

    (1..7).each do |i|
      check_validity_append(u, ascii, pointer + i)

      check_validity_append(d, ascii, pointer - i)

      check_validity_append(l, ascii - i, pointer)

      check_validity_append(r, ascii + i, pointer)
    end
    positions << u + d + l + r
  end

  # bishop_moves method returns the potential positions when the piece travels
  # in a diagonal direction. The arrays ur, ul, dr, dl stand for up-right (northeast),
  # up-left (northwest) etc. They contain the board positions for that direction

  def bishop_moves(positions, ascii, pointer)
    ur = []
    dr = []
    ul = []
    dl = []

    (1..7).each do |i|
      check_validity_append(ur, ascii + i, pointer + i)

      check_validity_append(dr, ascii + i, pointer - i)

      check_validity_append(ul, ascii - i, pointer + i)

      check_validity_append(dl, ascii - i, pointer - i)
    end
    positions << ur + dr + ul + dl
  end

  # knight_moves returns the potential positions when the piece travels in
  # an 'L' on the board. The arrays x and y contain the general position increments
  # or decrements along the x (a, b, c..) and y (1, 2, 3..) axes for a knight

  def knight_moves(positions, ascii, pointer)
    x = [2, 1, -1, -2, -2, -1, 1, 2]
    y = [1, 2, 2, 1, -1, -2, -2, -1]

    (0..7).each do |i|
      check_validity_append(positions, ascii + x[i], pointer + y[i])
    end
    positions
  end

  # check_validity_append method checks if the x and y values are in the
  # required ranges and then appends the position to list

  def check_validity_append(list, x_val, y_val)
    list << x_val.chr + y_val.to_s if x_val.between?(97, 104) && y_val.between?(1, 8)
  end
end
