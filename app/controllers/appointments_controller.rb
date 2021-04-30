class AppointmentsController < ApplicationController
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
        @appointment = Appointment.find_by(params[:id])
    end

    def update
        @appointment = Appointment.find_by(params[:id])
        if @appointment.update(task_params)
            redirect_to task_path(@task)
        end
    end

    def show
        @appointment = Appointment.find_by_id(params[:id])
    end

    def destroy
        @appointment = Appointment.find_by(params[:id])
        @appointment.destroy
        
        redirect_to appointments_path
    end
    
    private
    def appointment_params
        params.require(:appointment).permit(:title, :content, :completed, :client_id)
    end
end
