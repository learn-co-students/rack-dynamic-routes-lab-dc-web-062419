
class Application

   @@items = []

   def call(env)
    req = Rack::Request.new(env)
    resp = Rack::Response.new

     if req.path.match(/items/)
        items_cart = req.path.split("/items/").last
       if
        it = @@items.find { |i| i.name == items_cart }
              resp.write it.price
          else
          resp.write "Item not found"
          resp.status = 400
        end
    else
      resp.write "Route not found"
      resp.status = 404
    end

     resp.finish
  end
end
