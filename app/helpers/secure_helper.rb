module SecureHelper
  
  def encode_payload payload
    JWT.encode(payload, 'thisismytestsecret')
  end

  def decode_payload token
    payload, header = JWT.decode(token, 'thisismytestsecret')
    puts payload
    puts payload.to_h.symbolize_keys
    return payload.to_h.symbolize_keys
  end
end
