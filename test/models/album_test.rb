require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  setup do
    @artist = artists(:one)
  end

  test 'should not save empty album' do
    album = Album.new

    album.save
    refute album.valid?
  end

  test 'should save valid album'   do
    album = Album.new

    album.title = 'Believe'
    album.artist = @artist

    album.save
    assert album.valid?
  end
end
