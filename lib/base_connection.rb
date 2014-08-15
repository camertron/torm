module Torm
  class BaseConnection
    def initialize
    end

    def quote_table_name arg
      arg
    end

    def quote_column_name arg
      arg
    end

    def quote value, column = nil
      "'#{value.to_s}'"
    end

    def visitor
      connection.visitor
    end

    def connection
      @_adapter ||= Torm::Adapters::PostgresAdapter.new
    end
  end
end
