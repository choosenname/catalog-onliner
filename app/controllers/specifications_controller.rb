class SpecificationsController < ApplicationController
  before_action :set_specification, only: %i[ show update destroy ]

  def index
    @specifications = Specification.all

    render json: @specifications
  end

  def show
    render json: @specification
  end

  def update
    if @specification.update(specification_params)
      render json: @specification
    else
      render json: @specification.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @specification.destroy
    head :no_content
  end

  private

  def set_specification
    @specification = Specification.find(params[:id])
  end
end