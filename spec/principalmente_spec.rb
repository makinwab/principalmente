require "spec_helper"

describe Principalmente::Mastermind do

  let(:color_map) {
    {
      p: %W(a r v m),
      i: %W(a r v m n c),
      a: %W(a r v m n c g p)
    }
  }

  let(:princip) { Principalmente::Mastermind }
  subject { Principalmente::Mastermind.new :p, 4 }

  context "version number" do
	  it "tiene un numero version" do
      expect(Principalmente::VERSION).not_to be nil
    end
  end

  describe ".generate_color_code" do

    context "beginner level" do
      let(:result) { princip.generate_color_code(:p, 4) }

      it "has color code of length 4" do
        expect(result.length).to be 4
      end

      it "should fall within the set in color_map[:p]" do
        expect(result.split("") & color_map[:p]).not_to be_empty
      end
    end

    context "intermediate level" do
      let(:result) { princip.generate_color_code(:i, 5) }

      it "has color code of length 5" do
        expect(result.length).to be 5
      end

      it "should fall within the set in color_map[:i] " do
        expect(result.split("") & color_map[:i]).not_to be_empty
      end
    end

    context "advanced level" do
      let(:result) { princip.generate_color_code(:a, 6) }

      it "has color code of length 6" do
        expect(result.length).to be 6
      end

      it "should fall within the set in color_map[:a] " do
        expect(result.split("") & color_map[:a]).not_to be_empty
      end
    end
  end

  describe "#execute" do

    context "valid but incorrect color code" do
      it "returns status continue" do
        subject.random_color_code = "arvm"
        expect(subject.execute "rvar").to be :continue
      end
    end

    context "correct color code" do
      it "returns status won" do
        subject.random_color_code = "arvm"
        expect(subject.execute "arvm").to be :won
      end
    end

    context "other entries" do
      it "returns status quit for entry 'd'" do
        expect(subject.execute "d").to be :quit
      end

      it "returns status quit for entry 'dejar'" do
        expect(subject.execute "dejar").to be :quit
      end
    end 
  end
end
