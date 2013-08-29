require "nestful"
require "json"

module OpenPhilologyClient
  class Morphology
    def initialize(base_url = 'http://sosol.perseus.tufts.edu')
      @endpoint = Nestful::Endpoint.new("#{base_url}/bsp/morphologyservice/")
    end

    def analyse_word(word)
      verbose = get_verbose(word)
      body = verbose.body
      parsed_body = JSON.parse(body)
      parsed_inner_body = parsed_body["RDF"]["Annotation"]["Body"]
      return nil if parsed_inner_body == nil

      if parsed_inner_body.is_a? Array
        parsed_inner_body.map { |element| get_entry(element) }
      else
        [get_entry(parsed_inner_body)]
      end
    end

    private

    def get_entry(inner_body)
      inner_body["rest"]["entry"]
    end

    def get_verbose(word)
      @endpoint['analysis']['word'].get(
        {"word" => word, "lang" => "lat", "engine" => "morpheus"},
        {"headers" => {"accept" => "application/json"}})
    end

    def parse_json(json)
      JSON.parse(json)
    end
  end
end
