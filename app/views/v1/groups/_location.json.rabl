object @gps_statistic

attributes :id, :latitude, :longitude, :address, :city, :county, :country

node :created_at do |object|
  object.created_at.to_time.to_i
end

node :updates_at do |object|
  object.created_at.to_time.to_i
end