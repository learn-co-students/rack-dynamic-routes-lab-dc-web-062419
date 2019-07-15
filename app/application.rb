
class Application

    @@items = []

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
    
        if req.path.match(/items/) 
            item_path = req.path.split("/items/").last
            item = @@items.find {|i| i.name ==item_path }
            if item == nil
                resp.write "Item not found."
                resp.status = 400
            # elsif
                # IF a user requests an item that you don't have, then return a 400 and an error message
            else
                resp.write "#{item.price} IS THE ITEM PRICE"
                resp.status = 200 
            end
        else
            resp.write "Route not found."
            resp.status = 404
        end     
    
        resp.finish
    end



end