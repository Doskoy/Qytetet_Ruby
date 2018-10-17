#encoding: utf-8
require "singleton"
module ModeloQytetet
  class Dado
      include Singleton
      attr_reader:valor
      
      def initialize
        @valor = 0
      end
      
      def tirar
        raise NotImplementedError        
      end
  end
end
