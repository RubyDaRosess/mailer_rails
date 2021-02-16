class Event < ApplicationRecord
    validates :start_date, presence: true, if: :expiration_date_cannot_be_in_the_past
    validates :duration, presence: true, if: :is_multiple_of_5_and_positive?
    validates :title, presence: true, if: :title_is_between_5_and_140_characters
    validates :desc, presence: true, if: :desc_is_between_20_and_1000_characters
    validates :price, presence: true, if: :price_is_between_1_and_1000
    validates :location, presence: true

  def expiration_date_cannot_be_in_the_past
    errors.add(:start_date, "can't be in the past") unless start_date > DateTime.now
  end
    
  def is_multiple_of_5_and_positive?
   unless duration.positive? && duration % 5 == 0
    errors.add(:duration,"can't be negative and not a multiple of 5")
   end
  end
  def title_is_between_5_and_140_characters
    if title.length < 5 || title.length > 140
      errors.add(:title, "title need to be between 5 and 140 characters")
    end
  end
  def desc_is_between_20_and_1000_characters
    if desc.length < 20 || desc.length > 1000
      errors.add(:desc, "desc need to be between 20 and 1000 characters")
    end
  end
  def price_is_between_1_and_1000
    if price < 1 || price > 1000
      errors.add(:price, "price need to be between 1 and 1000")
    end
  end
end
