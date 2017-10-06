class User < ApplicationRecord
    has_many :posts
    has_many :comments

    def screen
        logger.info " @@@@@@@@@@@@@@@@@  FIELD ARE: #{self.name}"
        #split name into 2 parts
        nameArray = self.name.split(' ')
        #capitalize each part
        nameArray.each do |name|
            name.capitalize!
        end
        #re-join the names
        self.name = nameArray.join(' ')
    end
    # #2
    before_save { self.email = email.downcase if email.present? }
    before_save :screen
    before_save { self.role ||= :member }

    # #3
    validates :name, length: { minimum: 1, maximum: 100 }, presence: true

    # #4
    validates :password, presence: true, length: { minimum: 6}, if: "password_digest.nil?"
    validates :password, length: { minimum: 6 }, allow_blank: true

    # #5
    validates :email,
                presence: true,
                uniqueness: {case_sensitive: false},
                length: {minimum: 3, maximum: 254}

    # #6
    has_secure_password

    enum role: [:member, :admin]
end
