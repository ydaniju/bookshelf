# frozen_string_literal: true

class BookRepository < Hanami::Repository
  def created_by(user:)
    books.where(user_id: user.id).call
  end
end
