json.array!(@hack_tips) do |hack_tip|
  json.extract! hack_tip, :id, :title, :description, :user_id
  json.url hack_tip_url(hack_tip, format: :json)
end
