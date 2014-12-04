class Readme
  def call(_env)
    [200, text_plain, [the_readme]]
  end

  def text_plain
    {"Content-Type" => "text/plain"}
  end

  def the_readme
    IO.read(File.join(Rails.root, 'README.md'))
  end
end
