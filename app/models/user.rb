class User < ApplicationRecord
  enum role: {
    user: 0,
    admin: 1
  }, _prefix: true
end
