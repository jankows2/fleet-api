object @diagnostic_statistic => :diagnostic_statistic

attributes :id, :kmh, :rpm, 'l/100km'

node :created_at do |object|
  object.created_at.to_time.to_i
end

node :updates_at do |object|
  object.created_at.to_time.to_i
end
