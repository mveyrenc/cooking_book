module RecipeImport
  module Parsers
    def self.register(tag_name, parser)
      @@parsers ||= {}
      @@parsers[tag_name.to_sym] = parser
    end

    def self.unregister(tag_name)
      @@parsers.delete(tag_name.to_sym)
    end

    def self.lookup(url)
      url = "http://#{url}" if URI.parse(url).scheme.nil?
      host = URI.parse(url).host.downcase
      tag_name = host.start_with?('www.') ? host[4..-1] : host

      @@parsers[tag_name.parameterize.underscore.to_sym] or raise UnknownTagError, "unknown tag: #{tag_name}"
    end
  end
end