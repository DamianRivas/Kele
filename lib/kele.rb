require 'httparty'
require 'json'

class Kele
  include HTTParty
  
  def initialize(email, password)
    @base_url = 'https://www.bloc.io/api/v1'
    
    url = @base_url + '/sessions'
    
    options = {
      body: {
        email: email,
        password: password
      }
    }
    
    @auth_token = self.class.post(url, options).parsed_response["auth_token"]
  end
  
  def set_base_url(url)
    @base_url = url
  end
  
  def get_me
    url = @base_url + '/users/me'
    
    options = {
      headers: {
        content_type: 'application/json',
        authorization: @auth_token
      }
    }
    
    deep_symbolize_keys(JSON.parse(self.class.get(url, options).body))
  end
  
  def get_mentor_availability(mentor_id)
    url = @base_url + "/mentors/#{mentor_id}/student_availability"
    
    options = {
      values: {
        id: mentor_id
      },
      headers: {
        content_type: 'application/json',
        authorization: @auth_token
      }
    }
    
    # Returns an array of hashes and symbolizes the hashes
    JSON.parse(self.class.get(url, options).body).map { |element|
      deep_symbolize_keys(element) if element.class == Hash
    }
  end
  
  private
  
  def deep_symbolize_keys(hash)
    hash.keys.each do |key|
      if hash[key].class == Hash
        hash[(key.to_sym rescue key) || key] = hash.delete(key)

        deep_symbolize_keys(hash[key.to_sym])
      else
        hash[(key.to_sym rescue key) || key] = hash.delete(key)
      end
    end
    # Return the symbolized hash
    hash
  end
end
