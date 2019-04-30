class ConStruct
  def initialize(*args)
    @args = args
  end

  class << self
    def new(args)
      Class.new do
        def initialize(*attrs)
          arguments = "(given #{attrs.size}, expected #{args.size})"
          error_message = "wrong number of arguments #{arguments}"
          raise ArgumentError, error_message if attrs.size != @args.size

          args.each_with_index do |arg, i|
            instance_variable_set "@#{arg}", attrs[i]
            send attr_reader, "@#{arg}"
            send attr_accessor, "@#{arg}"
          end
        end

        # @args.each do |arg|
        #   define_method arg do
        #     instance_variable_get "@#{arg}"
        #   end

        #   define_method "#{arg}=" do |x|
        #     instance_variable_set "@#{arg}", x
        #   end
        # end
      end
    end
  end


end
