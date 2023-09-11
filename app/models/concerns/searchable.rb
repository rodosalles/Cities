module Searchable
  extend ActiveSupport::Concern

  included do
    class_attribute :searchable_fields

    scope :search_by, lambda { |query|
      unless searchable_fields.empty? || query.blank?
        first_searchable_field = searchable_fields.first
        result = public_send("search_by_#{first_searchable_field}", query)

        other_searchable_fields = searchable_fields.drop(1)
        other_searchable_fields.each do |field|
          result = result.or(public_send("search_by_#{field}", query))
        end

        result
      end
    }
  end
end
