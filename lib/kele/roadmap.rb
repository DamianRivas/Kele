module Roadmap
  def get_roadmap(chain_id)
    url = @base_url + "/roadmaps/#{chain_id}"
    
    options = {
      values: {
        id: chain_id
      },
      headers: {
        content_type: 'application/json',
        authorization: @auth_token
      }
    }
    
    JSON.parse(self.class.get(url, options).body)
  end
  
  def get_checkpoint(checkpoint_id)
    url = @base_url + "/checkpoints/#{checkpoint_id}"
    
    options = {
      headers: {
        content_type: 'application/json',
        authorization: @auth_token
      }
    }
    
    JSON.parse(self.class.get(url, options).body)
  end
  
  def get_remaining_checkpoints(chain_id)
    url = @base_url + "/enrollment_chains/#{chain_id}/checkpoints_remaining_in_section"
    
    options = {
      headers: {
        content_type: 'application/json',
        authorization: @auth_token
      }
    }
    
    JSON.parse(self.class.get(url, options).body)
  end
end