# frozen_string_literal: true

class UserRepository < Hanami::Repository
  def find_by(**params)
    users.where(params).first
  end
end
