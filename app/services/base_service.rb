class BaseService
  @steps = []
  @stop

  def self.steps(*args)
    @steps = args
  end

  def initialize(*args)
  end

  def success?
    errors.full_messages.empty?
  end

  protected

  def self.call(*args, &block)
    @service = new(*args, &block)
    errors = ActiveModel::Errors.new(self)
    @service.define_singleton_method(:errors) { errors }
    @service.instance_variable_set('@stop', false)
    if args.present? && args.class == Array
      args.first.each do | key, value |
        @service.define_singleton_method(key.to_sym) { value }
      end
    end
    @steps.each do | step |
      break if @service.instance_variable_get('@stop')
      @service.public_send(step)
    end
    result = @service.call
    @service.define_singleton_method(:result) do
      result
    end
    @service
  end

  def fail(attr = :base, message)
    errors.add(attr, message)
  end

  def fail!(attr = :base, message)
    @stop = true
    errors.add(attr, message)
  end
end