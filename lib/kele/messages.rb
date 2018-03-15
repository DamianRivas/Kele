module Messages
  def get_messages(page = nil)
    url = @base_url + "/message_threads"
    
    options = {
      values: {
        "page": page
      },
      headers: {
        content_type: 'application/json',
        authorization: @auth_token
      }
    }
    
    JSON.parse(self.class.get(url, options).body)
  end
  
  def create_message(sender, recipient_id, body, subject = nil, token = nil)
    url = @base_url + "/messages"

    options = {
      values: {
        "sender": sender,
        "recipient_id": recipient_id,
        "token": token,
        "subject": subject,
        "stripped-text": body
      },
      headers: {
        content_type: 'application/json',
        authorization: @auth_token
      }
    }
    
    self.class.post(url, options)
  end
end