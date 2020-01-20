class Article < ActiveRecord::Base
    has_many :comments, dependent: :destroy
    has_many :taggings, dependent: :destroy
    has_many :tags, through: :taggings
    validates :title, presence: {message: "is required"}, length: {maximum: 230}
	validates :body, presence: {message: "is required"}, length: {maximum: 1600}
	validates :tag_list, length: {maximum: 230}
    has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }
    validates_attachment_content_type :image, content_type:["image/jpg", "image/jpeg", "image/png", "image/gif"]
    



    
    def tag_list
        self.tags.collect do |tag|
			tag.name
        end.join(", ")
    end

    def tag_list=(tags_string)
        tag_names = tags_string.split(", ").collect{|s| s.strip.downcase}.uniq
        new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
        self.tags = new_or_found_tags
    end



end
