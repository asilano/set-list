class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 after_create :send_admin_mail

 def send_admin_mail
   AdminMailer.approval_needed(self).deliver
 end

  def active_for_authentication?
    super && approved?
  end

  def inactive_message
    if !approved?
      :not_approved
    else
      super
    end
  end

  def unauthenticated_message
    if !approved?
      :not_approved
    else
      super
    end
  end
end
