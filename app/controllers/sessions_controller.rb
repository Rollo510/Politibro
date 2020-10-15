class Devise::SessionsController < DeviseController

def new
    render layout: false
end

def destroy
    render layout: false
end

def create
    render layout: false
end

end