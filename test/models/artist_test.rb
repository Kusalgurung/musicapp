require 'test_helper'

class ArtistTest < ActiveSupport::TestCase
  
  setup do
    @user = users(:one)
  end

  test 'should not save empty artist' do
    artist = Artist.new

    artist.save
    refute artist.valid?

  end

  test 'should save valid artist' do
    artist = Artist.new

    artist.title = 'Jason Marz'
    artist.biography = 'Demo'
    artist.user = @user

    artist.save
    assert artist.valid?

  end

  test 'should not save duplicate artist' do
    artist1 = Artist.new
    artist1.title = 'Olly Murs'
    artist1.biography = 'British Singer.'
    artist1.user = @user
    artist1.save
    assert artist1.valid?

    artist2 = Artist.new
    artist2.title = 'Olly Murs'
    artist2.biography = 'British Singer.'
    artist2.user = @user
    artist2.save
    refute artist2.valid?

  end

end
