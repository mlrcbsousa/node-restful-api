require 'rspec/autorun'
require 'byebug'

class ConStruct
  # def initialize(*args)
  #   @args = args
  # end

  # class << self
  #   def const_set(*)
  #     super
  #     new
  #   end
  # end

  def initialize(method_a, method_b)
    Object.const_set 'METHOD_A', method_a
    Object.const_set 'METHOD_B', method_b

    @temp = Class.new do
      def initialize(value_a, value_b)
        # arguments = "(given #{attrs.size}, expected #{args.size})"
        # error_message = "wrong number of arguments #{arguments}"
        # raise ArgumentError, error_message if attrs.size != args.size

        # args.each_with_index do |arg, i|
        #   instance_variable_set "@#{arg}", attrs[i]
        #   send attr_reader, "@#{arg}"
        #   send attr_accessor, "@#{arg}"
        # end

    byebug
        instance_variable_set "@#{METHOD_A}", value_a
        instance_variable_set "@#{METHOD_B}", value_b
      end
    end

    # build
    @temp.define_method(METHOD_A) { instance_variable_get "@#{METHOD_A}" }
    @temp.define_method(METHOD_B) { instance_variable_get "@#{METHOD_B}" }

    @temp.define_method("#{METHOD_A}=") { |x| instance_variable_set "@#{METHOD_A}", x }
    @temp.define_method("#{METHOD_B}=") { |x| instance_variable_set "@#{METHOD_B}", x }
  end

  def new(*)
    @temp
  end

  # def build
  # end

  # class << self
  #   def new(*args)
  #     new
  #     Class.new do

  #       # @args.each do |arg|
  #       #   define_method arg do
  #       #     instance_variable_get "@#{arg}"
  #       #   end

  #       #   define_method "#{arg}=" do |x|
  #       #     instance_variable_set "@#{arg}", x
  #       #   end
  #       # end
  #     end
  #   end
  # end
end

describe ConStruct do
  describe '.new' do
    it 'accepts one or more arguements and returns a new Class where those \
      arguments are attribute readers and accessors' do
      Foo = ConStruct.new(:bar, 'buzz')
      foo = Foo.new('Jerry Seinfeld', 54)

      expect(foo.bar).to eq 'Jerry Seinfeld'
      expect(foo.buzz).to eq 54

      foo.bar = Float(42)

      expect(foo.bar).to eq 42.0
    end
  end
end
