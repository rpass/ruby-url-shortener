require 'digest'

class UrlShortener
  def self.shorten(url)
    # SHA256 hashing is okay for now, at larger volumes, speed of hashing
    # algorithm might justify changing to a faster algorithm
    Digest::SHA256.hexdigest(url)[0..5]
  end
end
