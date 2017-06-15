require_relative '../lib/game_of_life_lib.rb'

require 'minitest/autorun'

class TestGame_of_life_read_string < MiniTest::Test

   def test_xy_coords_function

  sevenxfour=<<EOF
..**
..*.
..*.
..*.
..*.
..*.
....
EOF
     playing = Game_of_life.new()
     playing.loadstring(sevenxfour);
     #First Dimensional array is 2 
     assert_equal(".", playing.getatxy(0,0),"zerozero coord is dot");
     assert_equal("*", playing.getatxy(2,0),"two x, zero y is star");
     assert_equal("*", playing.getatxy(3,0),"three x, zero y is star");
     assert_equal(".", playing.getatxy(0,3),"zero x, three y is dot");
    
  end

   def test_toobig

   threexthree=<<EOF
...
...
..*
EOF

    playing = Game_of_life.new()
    playing.loadstring(threexthree);
    assert_raises RuntimeError do
      playing.getatxy(5,10);
    end

    assert_raises RuntimeError do
      playing.getatxy(0,10);
    end

    assert_raises RuntimeError do
      playing.getatxy(10,1);
    end

    assert_raises RuntimeError do
      playing.getatxy(-1,2);
    end

    assert_raises RuntimeError do
      playing.getatxy(2,-1);
    end

    val = playing.getatxy(2,2)
    assert_equal("*",val,"Yet the upper bound of the grid is fine");
  end

end
