class SayController < ApplicationController
  def hello
    @time = Time.now.ctime
    @files = Dir.glob('*')
  end

  def goodbye
  end
end
