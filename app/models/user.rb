class User < ActiveRecord::Base
    # Include default devise modules. Others available are:
    # :token_authenticatable, :confirmable,
    # :lockable, :timeoutable and :omniauthable
    devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :confirmable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:douban,:weibo,:renren,:qq_connect]
    has_many :books
    has_many :videos
    has_many :articles
    has_many :lists
    mount_uploader :thumbnail, ImageUploader
    def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
        user = User.where(:provider => auth.provider, :uid => auth.uid).first
        unless user
            user = User.create(name:auth.extra.raw_info.name,
                               provider:auth.provider,
                               uid:auth.uid,
                               email:auth.info.email,
                               password:Devise.friendly_token[0,20])
        end
        user
    end
    def self.find_for_weibo_oauth(auth, signed_in_resource=nil)
        user = User.where(:provider => auth.provider, :uid => auth.uid).first
        unless user
            user = User.create(name:auth.extra.raw_info.name,
                               provider:auth.provider,
                               uid:auth.uid,
                               email:auth.info.email,
                               remote_thumbnail_url: auth.info.image,
                               password:Devise.friendly_token[0,20])
        end
        user
    end
    def self.find_for_renren_oauth(auth, signed_in_resource=nil)
        user = User.where(:provider => auth.provider, :uid => auth.uid).first
        unless user
            user = User.create(name:auth.extra.raw_info.name,
                               provider:auth.provider,
                               uid:auth.uid,
                               remote_thumbnail_url: auth.info.image,
                               email:"",
                               password:Devise.friendly_token[0,20])
        end
        user
    end
    def self.find_for_douban_oauth(auth, signed_in_resource=nil)
        user = User.where(:provider => auth.provider, :uid => auth.uid).first
        unless user
            user = User.create(name:auth.extra.raw_info.name,
                               provider:auth.provider,
                               uid:auth.uid,
                               email:auth.info.email,
                               remote_thumbnail_url: auth.info.image,
                               password:Devise.friendly_token[0,20])
        end
        user
    end

    def self.find_for_qq_oauth(auth, signed_in_resource=nil)
        user = User.where(:provider => auth.provider, :uid => auth.uid).first
        unless user
            user = User.create(name:auth.info.nickname,
                               provider:auth.provider,
                               uid:auth.uid,
                               email:auth.info.email,
                               remote_thumbnail_url: auth.info.image,
                               password:Devise.friendly_token[0,20])
        end
        user
    end

    def role?(role)
      self.role == role
    end

    def roles
      ret = []
      if self.role ==  BLACKLIST
        ret.append('blacklist')
      elsif self.role == BEGINNER
        ret.append('beginner')
      elsif self.role == PRESCHOLAR
        ret.append('prescholar')
      elsif self.role == SCHOLAR
        ret.append('scholar')
      elsif self.role == PREADMIN
        ret.append('preadmin')
      elsif self.role == ADMIN
        ret.append('admin')
      elsif self.role == SUPERADMIN
        ret.append('superadmin')
      end

      # member or admin of xclub
      Xmember.where('user_id = ?', self.id).each do |m|
        ret.append(m.role)
      end

      return ret
    end
end
