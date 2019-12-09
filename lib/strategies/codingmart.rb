module OmniAuth
  module Strategies
    class Codingmart < OmniAuth::Strategies::OAuth2
      option :name, "codingmart"

      option :client_options, {
        :site => "http://localhost:3000"
      }

      uid { raw_info["id"] }

      info do
        {
          email: raw_info["email"]
        }
      end

      extra do
        {
          "raw_info": raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get("/api/v1/me").parsed
      end
    end
  end
end