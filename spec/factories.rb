# FactoryGirl.define do  factory :user_club do

#   end

#   #binding.pry
#   # factory(:event) do
#   #   name('Mikes Club')
#   # end

# # FactoryGirl.define do  factory :user_club do

#   end


#   factory :club do
#     sequence(:name) {|n| "Mike's Club #{n}" }
#   end

# #   factory :event do
# #     sequence(:name) {|n| "account group #{n}"}
# #     description('Mikes Event')
# #     event_date('')
# #     location('')
# #     latitude('')
# #     longitude('')
# #     region('')
# #     status('')
# #     publish('')
# #     event_type_id('')
# #     club_id()
# #     after(:build) do |event, evaluator|
# #       event.club = evaluator.club || create(:club)
# #     end
# #   end

#   factory :user do
#     username('littlekitty')
#     first_name('Little')
#     last_name('Kitty')
#     sequence(:email)      {|n| "littlekitty#{n}@qanda.com" }
#     password "WetKittyFood"
#     password_confirmation {|user| user.password }

#     trait :athlete do
#       role('athlete')
#       type('Athlete')
#     end

#     trait :manager do
#       # transient { club nil }

#       # after(:build) do |user, evaluator|
#       #   user = if evaluator.club
#       #     binding.pry
#       #     build(:user, club: evaluator.club)
#       #     binding.pry
#       #   else
#       #     build(:user)
#       #   end
#       # end
#       role('manager')
#       type('Manager')
#     end

#     trait :admin do
#       role('admin')
#       type('Admin')
#     end
#   end
# end

# # trait :vendor do
# #       after(:build) do |user|
# #         user.vendor = build(:vendor)
# #       end
# #     end






