require 'nokogiri'
module Nokogiri
  module XML
    class NodeSet
      def method_missing(m, *args)
        xpath(m.to_s)
      end
      def to_s
        text
      end
      def name
        method_missing(:name)
      end
    end
    class Element
      def method_missing(m, *args)
        xpath(m.to_s)
      end
      def to_s
        text
      end
      def name
        method_missing(:name)
      end
    end
  end
end