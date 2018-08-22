require 'digest'

class UrlShortener
  def self.shorten(url, with_salt: false)
    return shorten_with_salt(url) if with_salt

    # SHA256 hashing is okay for now, at larger volumes, speed of hashing
    # algorithm might justify changing to a faster algorithm
    Digest::SHA256.hexdigest(url)[0..5]
  end

  def self.shorten_with_salt(url)
    # Since hashing predictably maps input to output
    # we need to add a random 'salt' to the input if
    # we have a collision on the output
    salt = Random.rand(1_000_000).to_s
    shorten(url + salt)
  end
end
