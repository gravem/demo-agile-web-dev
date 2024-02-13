class SayController < ApplicationController
  def hello
    @time = Time.now.ctime
  end

  def goodbye
  end
end
