class Post < ApplicationRecord
    validate :clickbait?

    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }

    CLICKBAIT_WORDS = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i
      ]

    CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top \d/i,
    /Guess/i
    ]

    # def clickbait?
    #     if :CLICKBAIT_WORDS.none? { |wrd| wrd.match title }
    #         errors.add(:title, "must be clickbait")
    #     end 
    # end
    
    def clickbait?
        if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
          errors.add(:title, "must be clickbait")
        end
      end
end
