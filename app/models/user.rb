class User < ApplicationRecord
  authenticates_with_sorcery!

  attr_accessor :password, :password_confirmation

  validates_presence_of :email, message: "邮箱不能为空"
  validates :email, uniqueness: true 

  validates_presence_of :password, message: "密码不能为空",
    if: :need_validate_password
  validates_presence_of :password_confirmation, message: "密码确认不能为空",
    if: :need_validate_password
  validates_confirmation_of :password, message: "密码不一致",
    if: :need_validate_password
  validates_length_of :password, message: "密码最短为6位", minimum: 6,
    if: :need_validate_password

  def username 
    self.email.split("@").first
  end

  private 
    # 邮箱字段，数据库中是有值的。密码是虚拟属性，数据库中没有值。所以有些修改情况下，参数对象中是没有密码的
    def need_validate_password
      self.new_record? || (!self.password.nil? || !self.password_confirmation.nil?)
    end
end
