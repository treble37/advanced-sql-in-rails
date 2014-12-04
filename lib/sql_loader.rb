class SqlLoader

  attr_reader :filename

  def initialize(filename)
    @filename = filename
  end

  def compile(context = nil)
    ERB.new(template, nil, '%').result(context || binding)
  end

  def template
    uncompiled_sql_string.squish
  end

  def uncompiled_sql_string
    IO.read(path_to_sql_file)
  end

  def path_to_sql_file
    File.join(Rails.root, 'app', 'sql', "#{filename}.sql.erb")
  end
end
