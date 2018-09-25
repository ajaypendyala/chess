require 'spec_helper'
require_relative '../chess.rb'

# I have included various test cases for the chess pieces. Also, checked for
# invalid inputs and corner cases. Coverage is 100% shown by the simplecov tool.
# The results are in coverage/index.html

describe Chess do
  let(:chess) { Chess.new }

  it 'tests rook at invalid position a9' do
    pos = chess.chess_piece_positions('rook', 'a9')
    expect(pos).to eql nil
  end

  it 'tests rook at invalid position z1' do
    pos = chess.chess_piece_positions('rook', 'z1')
    expect(pos).to eql nil
  end

  it 'tests invalid piece commoner' do
    pos = chess.chess_piece_positions('commoner', 'a8')
    expect(pos).to eql nil
  end

  it 'tests rook at position a8' do
    pos = chess.chess_piece_positions('rook', 'a8')
    expect(pos.flatten).to match_array %w[a7 a6 a5 a4 a3 a2 a1 b8 c8 d8 e8 f8 g8 h8]
  end

  it 'tests rook at position h1' do
    pos = chess.chess_piece_positions('rook', 'h1')
    expect(pos.flatten).to match_array %w[h2 h3 h4 h5 h6 h7 h8 a1 b1 c1 d1 e1 f1 g1]
  end

  it 'tests rook at position d5' do
    pos = chess.chess_piece_positions('rook', 'd5')
    expect(pos.flatten).to match_array %w[d1 d2 d3 d4 d6 d7 d8 a5 b5 c5 e5 f5 g5 h5]
  end

  it 'tests queen at position e3' do
    pos = chess.chess_piece_positions('queen', 'e3')
    expect(pos.flatten).to match_array %w[e1 e2 e4 e5 e6 e7 e8 a3 b3 c3 d3 f3 g3 h3 d4 c5 b6 a7 d2 c1 f2 g1 f4 g5 h6]
  end

  it 'tests queen at position a1' do
    pos = chess.chess_piece_positions('queen', 'a1')
    expect(pos.flatten).to match_array %w[a2 a3 a4 a5 a6 a7 a8 b1 c1 d1 e1 f1 g1 h1 b2 c3 d4 e5 f6 g7 h8]
  end

  it 'tests knight at position h8' do
    pos = chess.chess_piece_positions('knight', 'h8')
    expect(pos.flatten).to match_array %w[f7 g6]
  end

  it 'tests knight at position c6' do
    pos = chess.chess_piece_positions('knight', 'c6')
    expect(pos.flatten).to match_array %w[a5 a7 b8 d8 e7 e5 b4 d4]
  end

  it 'tests bishop at position f3' do
    pos = chess.chess_piece_positions('bishop', 'f3')
    expect(pos.flatten).to match_array %w[g2 h1 e2 d1 g4 h5 e4 d5 c6 b7 a8]
  end

  it 'tests bishop at position d8' do
    pos = chess.chess_piece_positions('bishop', 'd8')
    expect(pos.flatten).to match_array %w[c7 b6 a5 e7 f6 g5 h4]
  end

  it 'tests check_validity_append method' do
    list = []
    list = chess.check_validity_append(list, 98, 5)
    expect(list).to match_array %w[b5]
  end

  it 'tests check_validity_append method with invalid input' do
    list = []
    list = chess.check_validity_append(list, 92, 5)
    expect(list).to eql nil
  end
end