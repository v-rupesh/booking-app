class BookingResource < Avo::BaseResource
  self.title = :id
  self.includes = []
  # self.search_query = -> do
  #   scope.ransack(id_eq: params[:q], m: "or").result(distinct: false)
  # end

  field :id, as: :id
  field :room, as: :belongs_to
  field :user, as: :belongs_to
  field :booked_at, as: :date_time
  field :booked_for, as: :select, options: {
    '1 day': 1,
    '2 days': 2,
  }
end
