class Product < ApplicationRecord

  validates :category_id, presence: { message: "分类不能为空" }
  validates :title, presence: { message: "名称不能为空" }
  validates :status, inclusion: { in: %w[on off], message: "商品状态必须为on | off" }
  validates :amount, numericality: { only_integer: true, message: "库存必须为整数" }
  validates :msrp, presence: { message: "MSRP不能为空" }
  validates :msrp, numericality: { message: "MSRP必须为数字" },
    if: proc { |product| !product.msrp.blank? }
  validates :price, presence: { message: "价格不能为空" }
  validates :price, numericality: { message: "价格必须为数字" },
    if: proc { |product| !product.price.blank? }
  validates :description, presence: { message: "描述不能为空" }


  belongs_to :category

  scope :onshelf, -> { where(status: Status::On) }

  module Status
    On = 'on'
    Off = 'off'
  end

  before_create :set_default_attrs

  private
    def set_default_attrs
      self.uuid = RandomCode.generate_product_uuid
    end
end
