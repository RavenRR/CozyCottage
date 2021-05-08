class AppointmentsController < ApplicationController
    before_action :redirect_if_not_logged_in
    before_action :set_appointment, only: [:show, :edit, :update, :destroy]
    before_action :redirect_if_not_appointment_creator, only: [:edit, :update]
    def new
        if params[:client_id] && @client = Client.find_by_id(params[:client_id])
            @appointment = @client.appointments.build
        else
            @appointment = Appointment.new
    end
end

    def index 
        if params[:client_id] && @client = Client.find_by_id(params[:client_id]) 
            @appointments = @client.appointments
        else
            @appointments = Appointment.all
        end
    end

    def create
        @appointment = current_user.appointments.build(appointment_params)
        if @appointment.save
            redirect_to appointments_path
        else
            render :new
        end
    end

    def edit
    end

    def update
        if @appointment.update(appointment_params)
            redirect_to appointment_path(@appointment)
        end
    end

    def show
    end

    def destroy
        @appointment.destroy
        
        redirect_to appointments_path
    end
    
    private
    def appointment_params
        params.require(:appointment).permit(:title, :content, :completed, :client_id)
    end

    def set_appointment
        @appointment = Appointment.find_by_id(params[:id])
        if !@appointment
            flash[:message] = "Appointment not found"
            redirect_to appointments_path
        end
    end

    def redirect_if_not_appointment_creator
        redirect_to appointments_path if @appointment.user != current_user
    end
end
