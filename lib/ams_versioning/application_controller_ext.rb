ActionController::Base.class_eval do 

  def get_serializer(resource, options = {})
    if resource.is_a?(ActiveRecord::Base)
      super(resource, options.reverse_merge(
        serializer: serializer_with_version("#{resource.class.name}Serializer")
      ))
    elsif resource.is_a?(ActiveRecord::Relation)
      super(resource, options.reverse_merge(
        each_serializer: serializer_with_version("#{resource.first.class.name}Serializer")
      ))
    else
      super
    end
  end

  def serializer_with_version(serializer_name)
    "V#{api_version}::#{serializer_name}".constantize
  end

  def api_version
    params[:api_version] || 1
  end
end
