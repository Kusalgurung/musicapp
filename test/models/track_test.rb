require 'test_helper'

class TrackTest < ActiveSupport::TestCase
  setup do
    @album = albums(:one)
  end

  test 'should not save empty track' do
    track = Track.new

    track.save
    refute track.valid?
  end

  test 'should save valid track'   do
    track = Track.new

    track.title = 'Be Alrigt'
    track.album = @album

    track.save
    assert track.valid?
  end
end
