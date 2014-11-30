class VwTotalBattingAverages < ActiveRecord::Base
  # TODO: move this read_only? and other MySQL view specific stuff into own module.
  def read_only?
    true
  end
end
