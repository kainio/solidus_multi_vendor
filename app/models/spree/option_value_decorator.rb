Spree::OptionValue.class_eval do
#   ((_validators[:name]).find { |v| v.is_a? ActiveRecord::Validations::UniquenessValidator }.attributes).delete(:name)

end
