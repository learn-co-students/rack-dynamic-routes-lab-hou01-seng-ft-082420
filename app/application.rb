require 'pry'
class Application
    require_relative "./item"

    @@items = []

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)

        if req.path.match(/items/)
            term = req.path.split("/items/").last
            # search_term = req.params["item"]
            item = @@items.find{|s| s.name == term}

            if item == nil
                resp.write "Item not found"
                resp.status = 400
            else
            resp.write item.price
            end 

        else
           resp.write "Route not found"  
           resp.status = 404
        end
        resp.finish
    end 
end 