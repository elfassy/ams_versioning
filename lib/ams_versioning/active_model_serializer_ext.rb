ActiveModel::Serializer.class_eval do 
  class << self  
    def has_many_with_versioning(name, options = {}, &block)
      serializer = serializer_with_version(name, options)
      has_many_without_versioning(name, options.merge(serializer: serializer), &block)
    end
    def has_one_with_versioning(name, options = {}, &block)
      serializer = serializer_with_version(name, options)
      has_one_without_versioning(name, options.merge(serializer: serializer), &block)
    end
    def belongs_to_with_versioning(name, options = {}, &block)
      serializer = serializer_with_version(name, options)
      belongs_to_without_versioning(name, options.merge(serializer: serializer), &block)
    end
    alias_method_chain :has_many, :versioning
    alias_method_chain :has_one, :versioning
    alias_method_chain :belongs_to, :versioning


    def serializer_with_version(name, options = {})
      name = options[:serializer] || "#{name.to_s.classify}Serializer"
      serializer = api_version ? "#{api_version}::#{name}" : name
      serializer.constantize
    end

    def api_version
      self.name.split('::')[-2]
    end
  end
end
