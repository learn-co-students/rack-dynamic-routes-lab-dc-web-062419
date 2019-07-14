require "pry"
class Application
    @@item = [Item.new("apples", 2), Item.new("guac", 3)]

    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
        
        if req.path.match(/items/)
            item_name = req.path.split("/items/").last
            if item_found = @@items.find {|item|
                item.name == item_name}
                resp.write item_found.price
            else
                resp.status = 400
                resp.write "Item not found"
            end
        else
        resp.write "Route not found"
        resp.status = 404
        end
        resp.finish
    end
end