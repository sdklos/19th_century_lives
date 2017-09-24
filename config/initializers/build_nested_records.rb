ActionView::Helpers::FormBuilder.class_eval do

  def build_nested_records(association, options = {}, &block)
    minimum = options.delete(:minimum) || 5
    maximum = options.delete(:maximum) || nil
    buffer = options.delete(:buffer) || 2
    attributes = options # whatever is left
    collection = object.send(association)
    block ||= lambda { collection.build(attributes) }

    current_size = collection.size
    target_size = current_size + buffer
    target_size = [target_size, minimum].max
    target_size = [target_size, maximum].min if maximum

    gap = target_size - current_size

    # Can't use &block since `#times` calls it with the iteration as argument
    gap.times { block.call } if gap > 0
  end
end
