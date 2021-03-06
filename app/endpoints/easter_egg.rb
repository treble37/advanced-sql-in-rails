require 'zlib'
require 'base64'

# rack has a lobster, we have a...
class EasterEgg
  def call(_env)
    [200, text_plain, [title, body]]
  end

  def text_plain
    {"Content-Type" => "text/html"}
  end

  def title
    "<title>EF Codd</title>"
  end

  def body
    "<pre>#{inflate_codd}</pre>"
  end

  def inflate_codd
    Zlib::Inflate.inflate(Base64.decode64(codd))
  end

  #######
  private
  #######

  # http://en.wikipedia.org/wiki/Edgar_F._Codd
  def codd
    <<-CODD
    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
    5mbH6wjCyRTqHcoTBP8ABhHIsA==
    CODD
  end
end
