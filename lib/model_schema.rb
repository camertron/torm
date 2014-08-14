module Torm
  module ModelSchema

    def schema_cache
      self.class.connection.schema_cache
    end

    def column_names
      @column_names ||= schema_cache.columns(self.class.table_name).map { |column| column.name }
    end

    def attributes_builder
      @attributes_builder ||= AttributeSet::Builder.new(column_types)
    end

    def column_types
      @column_types ||= schema_cache.columns_hash(self.class.table_name).transform_values(&:cast_type).tap do |h|
        h.default = Type::Value.new
      end
    end

    def type_for_attribute(attr_name)
      column_types[attr_name]
    end

    def default_attributes
      @default_attributes ||= attributes_builder.build_from_database(
          self.schema_cache.columns_hash(self.class.table_name))
    end

  end
end