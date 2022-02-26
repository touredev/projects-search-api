class MainController < ApplicationController
  def search
    results = Project.search(search_params[:q], search_params)

    projects = results.map do |r|
      r.merge(r.delete('_source')).merge('id': r.delete('_id'))
    end

    render json: { projects: projects }, status: :ok
  end

  private

  def search_params
    params.permit(:q, :tech_stack)
  end
end
