class Application 

    def call(env)
        req = Rack::Request.new(env)
        resp = Rack::Response.new

        if req.path.include? '/items/'
            requested_item = (req.path.split "/items/").last
            item = @@items.find{|item| item.name == requested_item}
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
