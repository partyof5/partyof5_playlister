require_relative './spec_helper'

describe "Song" do
  it "can initialize a song" do
    Song.new.should be_an_instance_of(Song)
  end

  it "can have a name" do
    song = Song.new
    song.name = "Rolling in the Deep"
    song.name.should eq("Rolling in the Deep")
  end

  it "can have a genre" do
    genre = Genre.new
    genre.name = 'folk'
    genre.name.should eq('folk')
  end

  it "has an artist" do
    artist = Artist.new
    artist.name = "Adele"
    artist.name.should eq("Adele")
  end
end
