require 'yaml'

# Login data must be configured in 'login.yaml' before running your tests
login_data = YAML.load_file('login.yaml')

describe Kele do
  let(:kele_client) { Kele.new(login_data[:email], login_data[:password]) }
  
  describe "#get_me" do
    it "returns a hash" do
      user_data = kele_client.get_me
      
      expect(user_data).to be_a(Hash)
    end
  end
  
  describe "#get_mentor_availabily" do
    it "returns a hash" do
      mentor_id = 2292457
      
      mentor_availability = kele_client.get_mentor_availability(mentor_id)
      
      expect(mentor_availability).to be_an(Array)
    end
  end
  
  describe "#deep_symbolize_keys" do
    it "converts all string keys to symbol keys" do
      hash = {
        "key1": "value1",
        "key2": {
          "key3": "value2"
        }
      }
      
      expect( kele_client.send(:deep_symbolize_keys, hash) ).to eq(
        {
          key1: "value1",
          key2: {
            key3: "value2"
          }
        }
      )
    end
  end
end