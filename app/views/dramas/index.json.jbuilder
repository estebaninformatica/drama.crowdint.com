json.array!(@dramas) do |drama|
  json.(drama, :description, :drama_at)
end
