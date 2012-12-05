object @homw, :object_root => "home"

code :dramas do
  @dramas
end

code :streak do |m|
  @streak
end

code :days_without_drama do |m|
  begin
    @dramas.first ? Drama.days_without_drama(@dramas.first) : 365
  rescue
     0
  end
end
