class FeatureFlagsController < ApplicationController
  def show
    name = params[:id]
    @feature_flag = FeatureFlag.find_by({ name: name })

    if @feature_flag.nil?
      return render json: FeatureFlag.new({
        :name => name,
        :enabled => false
      })

    render json: @feature_flag
  end
end
