module Comments
  module Model
    extend ActiveSupport::Concern

    DEFAULT_AVATAR = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAPAAAADwCAMAAAAJixmgAAAAFVBMVEWkpKSnp6eqqqq3t7fS0tLV1dXZ2dmshcKEAAAAtklEQVR4Ae3XsRGAAAjAQFRk/5HtqaTz5H+DlInvAQAAAAAAAAAAAAAAAAAAAACymiveO6o7BQsWLFiwYMGCBS8PFixYsGDBggULFixYsGDBggULFixYsGDBggULFixYsGDBc4IFCxYsWLBgwYIFC14ZfOeAPRQ8IliwYMGCBQsWLFiwYMGCBQsWLFiwYMGCBQsWLFiwYMGCBQsWLFiwYMGCBQv+JQAAAAAAAAAAAAAAAAAAAOAB4KJfdHmj+kwAAAAASUVORK5CYII='

    included do
      acts_as_nested_set scope: [:commentable_type, :commentable_id]

      belongs_to :commentable, polymorphic: true, touch: true
      belongs_to :user, class_name: Comments.config.user_class

      validates :body, presence: true
    end

    def user_name
      return "" if self.user.blank?
      self.user.send(Comments.config.user_name_method)
    end

    def user_avatar_url
      return DEFAULT_AVATAR if Comments.config.user_avatar_url_method.blank?
      return DEFAULT_AVATAR if self.user.blank?
      self.user.send(Comments.config.user_avatar_url_method)
    end

    def user_profile_url
      return '#' if self.user.blank?
      self.user.send(Comments.config.user_profile_url_method)
    end

    def can_reply?
      self.depth <= Comments.config.max_reply_depth
    end
  end
end
