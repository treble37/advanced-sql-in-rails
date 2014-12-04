class SqlLoader

  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def compile(context)
    ERB.new(template.gsub(/^\s+/, ""), nil, '%').result(context)
  end

  def template
    IO.read(file_location).squish
  end

  def file_location
    File.join(Rails.root, 'app', 'sql', "#{filename}.sql.erb")
  end
end
