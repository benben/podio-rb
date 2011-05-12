module Podio
  module Email
    include Podio::ResponseWrapper
    extend self

    def get_groups()
      member Podio.connection.get { |req|
        req.url("/email/group/", {})
      }.body
    end

    def update_groups(options)
      Podio.connection.put { |req|
        req.url "/email/group/"
        req.body = options
      }.body
    end

    def unsubscribe(username)
      Podio.connection.post("/email/unsubscribe/#{username}").status
    end

  end
end