class Post < ApplicationRecord
    acts_as_tenant :account
end
