module Torm
  class Model
    def self.create(params = {})
    end

    def self.update(params = {})
    end

    def self.destroy(params)
    end

    def self.find(id)
      where(id: id)
    end

    def self.table
      @_table ||= Arel::Table.new(self.name.downcase + 's', Torm::Engine.new)
    end
  end
end
