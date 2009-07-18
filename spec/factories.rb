Factory.define :sheet do |factory|
  factory.sequence(:title) {|n| "my-awesome-title-#{n}" }
  factory.sequence(:body) {|n| "body-#{n}" }
  factory.created_at { 1.year.ago }
  factory.sequence(:updated_at) { |n| (1.day + n.minutes).ago }
end

Factory.define :recent_sheet, :parent => :sheet do |factory|
  factory.sequence(:updated_at) { |n| (n.minutes).ago }
end

Factory.define :old_sheet, :parent => :sheet do |factory|
  factory.sequence(:updated_at) { |n| (1.month + n.hours).ago }
end