class Note < MongoRecord
  field :title, type: String
  field :content, type: String
  field :tags, type: Array, default: []

  validates :title, presence: true
end
