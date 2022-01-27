import Vapor

func routes(_ app: Application) throws {
    app.get { req in
        return "It works!"
    }
    
    //localhost:8080/hi
    app.get("hi") { req -> String in
        return "Hello, world!"
    }
    
    //localhost:8080/test/vapor
    app.get("test", "vapor") { req -> String in
        return "Hello Vapor!"
    }
    
    //localhost:8080/hello/tommy
    app.get("hello", ":name") { req -> String in
        guard let name = req.parameters.get("name") else {
            throw Abort(.internalServerError)
        }
        return "Hello, \(name)!"
    }
    
    app.post("info") { req -> String in
        let data = try req.content.decode(InfoData.self)
        return "Hello \(data.name)"
    }
    
    app.post("info-json") { req -> InfoResponse in
        let data = try req.content.decode(InfoData.self)
        return InfoResponse(request: data)
    }
}


