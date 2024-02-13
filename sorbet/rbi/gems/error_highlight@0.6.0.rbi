# typed: false

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `error_highlight` gem.
# Please instead update this file by running `bin/tapioca gem error_highlight`.

module ErrorHighlight
  class << self
    # source://error_highlight//lib/error_highlight/formatter.rb#16
    def formatter; end

    # source://error_highlight//lib/error_highlight/formatter.rb#20
    def formatter=(formatter); end

    # Identify the code fragment at that a given exception occurred.
    #
    # Options:
    #
    # point_type: :name | :args
    #   :name (default) points the method/variable name that the exception occurred.
    #   :args points the arguments of the method call that the exception occurred.
    #
    # backtrace_location: Thread::Backtrace::Location
    #   It locates the code fragment of the given backtrace_location.
    #   By default, it uses the first frame of backtrace_locations of the given exception.
    #
    # Returns:
    #  {
    #    first_lineno: Integer,
    #    first_column: Integer,
    #    last_lineno: Integer,
    #    last_column: Integer,
    #    snippet: String,
    #    script_lines: [String],
    #  } | nil
    #
    # Limitations:
    #
    # Currently, ErrorHighlight.spot only supports a single-line code fragment.
    # Therefore, if the return value is not nil, first_lineno and last_lineno will have
    # the same value. If the relevant code fragment spans multiple lines
    # (e.g., Array#[] of +ary[(newline)expr(newline)]+), the method will return nil.
    # This restriction may be removed in the future.
    #
    # source://error_highlight//lib/error_highlight/base.rb#33
    def spot(obj, **opts); end
  end
end

module ErrorHighlight::CoreExt
  # source://error_highlight//lib/error_highlight/core_ext.rb#27
  def to_s; end

  private

  # source://error_highlight//lib/error_highlight/core_ext.rb#5
  def generate_snippet; end
end

class ErrorHighlight::DefaultFormatter
  class << self
    # source://error_highlight//lib/error_highlight/formatter.rb#3
    def message_for(spot); end
  end
end

class ErrorHighlight::Spotter
  # @return [Spotter] a new instance of Spotter
  #
  # source://error_highlight//lib/error_highlight/base.rb#79
  def initialize(node, point_type: T.unsafe(nil), name: T.unsafe(nil)); end

  # source://error_highlight//lib/error_highlight/base.rb#104
  def spot; end

  private

  # source://error_highlight//lib/error_highlight/base.rb#538
  def fetch_line(lineno); end

  # Example:
  #   x.foo = 1
  #           ^
  #   x[42] = 1
  #     ^^^^^^^
  #   x[] = 1
  #     ^^^^^
  #
  # source://error_highlight//lib/error_highlight/base.rb#316
  def spot_attrasgn_for_args; end

  # Example:
  #   x.foo = 1
  #    ^^^^^^
  #   x[42] = 1
  #    ^^^^^^
  #
  # source://error_highlight//lib/error_highlight/base.rb#290
  def spot_attrasgn_for_name; end

  # Example:
  #   x.foo(42)
  #         ^^
  #   x[42]
  #     ^^
  #   x += 1
  #        ^
  #
  # source://error_highlight//lib/error_highlight/base.rb#275
  def spot_call_for_args; end

  # Example:
  #   x.foo
  #    ^^^^
  #   x.foo(42)
  #    ^^^^
  #   x&.foo
  #    ^^^^^
  #   x[42]
  #    ^^^^
  #   x += 1
  #     ^
  #
  # source://error_highlight//lib/error_highlight/base.rb#231
  def spot_call_for_name; end

  # Example:
  #   Foo::Bar
  #      ^^^^^
  #
  # source://error_highlight//lib/error_highlight/base.rb#494
  def spot_colon2; end

  # Example:
  #   foo(42)
  #       ^^
  #   foo 42
  #       ^^
  #
  # source://error_highlight//lib/error_highlight/base.rb#386
  def spot_fcall_for_args; end

  # Example:
  #   foo(42)
  #   ^^^
  #   foo 42
  #   ^^^
  #
  # source://error_highlight//lib/error_highlight/base.rb#372
  def spot_fcall_for_name; end

  # Example:
  #   x[1] += 42
  #     ^^^^^^^^
  #
  # source://error_highlight//lib/error_highlight/base.rb#439
  def spot_op_asgn1_for_args; end

  # Example:
  #   x[1] += 42
  #    ^^^    (for [])
  #   x[1] += 42
  #        ^  (for +)
  #   x[1] += 42
  #    ^^^^^^ (for []=)
  #
  # source://error_highlight//lib/error_highlight/base.rb#414
  def spot_op_asgn1_for_name; end

  # Example:
  #   x.foo += 42
  #            ^^
  #
  # source://error_highlight//lib/error_highlight/base.rb#482
  def spot_op_asgn2_for_args; end

  # Example:
  #   x.foo += 42
  #    ^^^     (for foo)
  #   x.foo += 42
  #         ^  (for +)
  #   x.foo += 42
  #    ^^^^^^^ (for foo=)
  #
  # source://error_highlight//lib/error_highlight/base.rb#461
  def spot_op_asgn2_for_name; end

  # Example:
  #   Foo::Bar += 1
  #      ^^^^^^^^
  #
  # source://error_highlight//lib/error_highlight/base.rb#512
  def spot_op_cdecl; end

  # Example:
  #   x + 1
  #       ^
  #
  # source://error_highlight//lib/error_highlight/base.rb#357
  def spot_opcall_for_args; end

  # Example:
  #   x + 1
  #     ^
  #   +x
  #   ^
  #
  # source://error_highlight//lib/error_highlight/base.rb#336
  def spot_opcall_for_name; end

  # Example:
  #   foo
  #   ^^^
  #
  # source://error_highlight//lib/error_highlight/base.rb#399
  def spot_vcall; end
end

# source://error_highlight//lib/error_highlight/base.rb#101
ErrorHighlight::Spotter::OPT_GETCONSTANT_PATH = T.let(T.unsafe(nil), FalseClass)
