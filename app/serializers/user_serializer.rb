class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :searches
end
