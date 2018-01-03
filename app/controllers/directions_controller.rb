class DirectionsController < ApplicationController
  def index
    @directions = Direction.page(params[:page]).per(10)

    render("directions/index.html.erb")
  end

  def show
    @direction = Direction.find(params[:id])

    render("directions/show.html.erb")
  end

  def new
    @direction = Direction.new

    render("directions/new.html.erb")
  end

  def create
    @direction = Direction.new

    @direction.director_id = params[:director_id]
    @direction.actor_id = params[:actor_id]

    save_status = @direction.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/directions/new", "/create_direction"
        redirect_to("/directions")
      else
        redirect_back(:fallback_location => "/", :notice => "Direction created successfully.")
      end
    else
      render("directions/new.html.erb")
    end
  end

  def edit
    @direction = Direction.find(params[:id])

    render("directions/edit.html.erb")
  end

  def update
    @direction = Direction.find(params[:id])

    @direction.director_id = params[:director_id]
    @direction.actor_id = params[:actor_id]

    save_status = @direction.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/directions/#{@direction.id}/edit", "/update_direction"
        redirect_to("/directions/#{@direction.id}", :notice => "Direction updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Direction updated successfully.")
      end
    else
      render("directions/edit.html.erb")
    end
  end

  def destroy
    @direction = Direction.find(params[:id])

    @direction.destroy

    if URI(request.referer).path == "/directions/#{@direction.id}"
      redirect_to("/", :notice => "Direction deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Direction deleted.")
    end
  end
end
