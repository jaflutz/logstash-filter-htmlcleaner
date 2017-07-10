# encoding: utf-8
require "logstash/filters/base"
require "logstash/namespace"
require "nokogiri"

# This  filter will replace the contents of the default
# message field with whatever you specify in the configuration.
#
# It is only intended to be used as an .
class LogStash::Filters::Htmlcleaner < LogStash::Filters::Base

  # Setting the config_name here is required. This is how you
  # configure this filter from your Logstash config.
  #
  # filter {
  #    {
  #     message => "My message..."
  #   }
  # }
  #
  config_name "htmlcleaner"

  # Replace the message with this value.
  #config :message, :validate => :string, :default => "Hello World!"

  config :input_field, :validate => :string
  config :output_field, :validate => :string

  public
  def register
    # Add instance variables
  end # def register

  public
  def filter(event)

    conteudo_html = event.get(@input_field)

    doc = Nokogiri::HTML(conteudo_html)

    doc.xpath('//text()').each do |node|
        node.content = node.content.gsub("\n","")
        node.content = " " + node.content + " "
    end

    # Replace the event message with our message as configured in the
    # config file.
    event.set(@output_field, doc.text)

    # filter_matched should go in the last line of our successful code
    filter_matched(event)
  end # def filter
end # class LogStash::Filters::Htmlcleaner
