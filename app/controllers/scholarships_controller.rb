class ScholarshipsController < ApplicationController
    before_action :set_scholarship, only: [:show, :edit, :update, :destroy]
  
    def index
      @scholarships = Scholarship.all
    end
  
    def show
    end
  
    def new
      @scholarship = Scholarship.new
    end
  
    def create
      @scholarship = Scholarship.new(scholarship_params)
  
      if @scholarship.save
        redirect_to @scholarship, notice: 'Scholarship was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @scholarship.update(scholarship_params)
        redirect_to @scholarship, notice: 'Scholarship was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @scholarship.destroy
      redirect_to scholarships_url, notice: 'Scholarship was successfully destroyed.'
    end
  
    private
  
    def set_scholarship
      @scholarship = Scholarship.find(params[:id])
    end
  
    def scholarship_params
      params.require(:scholarship).permit(
        :year,
        :client_id,
        :child_number,
        :child_first_name,
        :child_last_name,
        :child_ethnicity,
        :child_birth_date,
        :provider_id,
        :billing_cycle,
        :cycle_tuition,
        :cycle_discount,
        :cycle_state_voucher,
        :cycle_parent_copay,
        :start_date,
        :end_date,
        :length
      )
    end
  end
  