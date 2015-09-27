require 'rspec'
require_relative './lexi'

describe Lexiconomitron do 

	before :each do 
		@lexi = Lexiconomitron.new
	end

  describe "#eat_t" do
    it "removes every letter t from the input" do 
      expect(@lexi.eat_t("great scott!")).to eq("grea sco!")
    end
    it "removes every letter T from the input" do 
      expect(@lexi.eat_t("greaT scoTT!")).to eq("grea sco!")
    end
  end

  describe "#shazam" do
  	it "returns an array witht he first and last words reversed (selected words don't have T's)" do
  		expect(@lexi.shazam(["his", "is", "a", "boring", "bless"])).to eq ["sih", "sselb"]
  	end
  	it "returns an array with he first and last words with eaten ts and reversed (have T's)" do
  		expect(@lexi.shazam(["This", "is", "a", "boring", "test"])).to eq ["sih", "se"]
  	end
  end

  describe "#oompa_loompa" do
  	it "returns words smaller than three letters - original words don't have T's" do
  		expect(@lexi.oompa_loompa(["if", "you", "wanna", "be", "my", "lover"])).to eq ["if", "you", "be", "my"]
  	end
  	it "returns words smaller than three letters (words that would  become three letter words after removing the T's)" do
  		expect(@lexi.oompa_loompa(["if", "you", "want", "best", "my", "lover"])).to eq ["if", "you", "my"]
  	end
  	it "returns words smaller than three letters after having T's eaten" do
  		expect(@lexi.oompa_loompa(["if", "yot", "best", "my", "lover"])).to eq ["if", "yo", "my"]
  	end
  	it "returns empty array when no words match" do
  		expect(@lexi.oompa_loompa(["lover"])).to eq []
  	end
  	it "returns empty array when empty array is passed" do
  		expect(@lexi.oompa_loompa([])).to eq []
  	end
  end

end



 