class ProjectsController < ApplicationController
    def index
        render json: Project.all, status: :ok
    end

    def show
        project = Project.find_by(id: params[:id])

        if project
            render json: project, status: :found
        else
            render json: { error: "Application does not exist" }, status: :unprocessable_entity
        end
    end

    def create
        project = Project.create!(project_params)
        if project.valid?
            render json: project, status: :created
        else
            render json: { errors: Project.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
        project = Project.find_by(id: params[:id])
        
        if project
            project.update(project_params)
            render json: project, status: :accepted
        else
            render json: {error: "Application not found"}, status: :unprocessable_entity
        end
    end

    def destroy
        project = Project.find_by(id: params[:id])
        if project
            Project.destroy
            render json: {success: "Deleted"}, status: :ok
        else
            render json: {error: "Product not found"}, status: :unprocessable_entity
        end
    end
    

    private

    def project_params
        params.permit(:title, :description, :picture, :date, :tags,)
    end

end
