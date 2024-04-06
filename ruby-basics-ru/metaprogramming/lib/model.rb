# frozen_string_literal: true

# BEGIN
module Model
  def self.included(base)
    base.extend ClassMethods
    base.include InstanceMethods
  end

  module InstanceMethods
    def initialize(attrs = {})
      all_attributes = self.class.instance_variable_get('@attritutes').keys
      attrs.each do |key, value|
        instance_variable_set("@#{key}", value) if all_attributes.include? key.to_sym
      end
    end

    def attributes
      all_attributes = self.class.instance_variable_get('@attritutes').keys
      all_attributes.to_h { |name| [name, send(name)] }
    end
  end

  module ClassMethods
    def attribute(name, options)
      attritutes = instance_variable_get('@attritutes') || {}
      instance_variable_set('@attritutes', attritutes.merge(name => options))
      convert = get_convert(options[:type])

      define_method(name) do
        value = if instance_variables.include?(:"@#{name}")
                  instance_variable_get("@#{name}")
                else
                  options[:default]
                end
        value.nil? ? nil : convert.call(value)
      end

      define_method("#{name}=") do |v|
        instance_variable_set("@#{name}", v)
      end
    end

    private

    def get_convert(type)
      case type
      when :string
        ->(value) { value.to_s }
      when :integer
        ->(value) { value.to_i }
      when :datetime
        ->(value) { DateTime.parse(value) }
      when :boolean
        ->(value) { value.to_s.downcase == 'true' }
      else
        ->(value) { value }
      end
    end
  end
end
# END
