require "nestful"
require "json"

module OpenPhilologyClient
  class Morphology
    def initialize
      @endpoint = Nestful::Endpoint.new('http://sosol.perseus.tufts.edu/bsp/morphologyservice/analysis/word')
    end

    def get(word)
      verbose = get_verbose(word)
      body = verbose.body
      parsed_inner_body = parse_json(body)["RDF"]["Annotation"]["Body"]

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
      @endpoint.get({"word" => word, "lang" => "lat", "engine" => "morpheus"},
                    {"headers" => {"accept" => "application/json"}})
    end

    def parse_json(json)
      JSON.parse(json)
    end
  end
end
