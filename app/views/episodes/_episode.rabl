object @episode
attributes :id, :db_id, :name, :show_id, :watched, :downloaded, :s_num, :e_num

child(:show) do
  attributes :_name
end
