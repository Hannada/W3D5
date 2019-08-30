require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject
  def self.columns
    return @columns if @columns
   temp = DBConnection.execute2 <<-SQL
      SELECT 
        *
      FROM 
        cats
    SQL

    titles = temp[0]
    @columns = titles.map {|ele| ele.to_sym}
  end

  def self.finalize!
    self.columns.each do |column|
      define_method(column) do 
        self.attributes[column]
      end

      define_method("#{column}=") do |value|
        self.attributes[column] = value 
      end
    end

  end

  def self.table_name=(table_name)
    @table_name = table_name 
  end

  def self.table_name
    @table_name ||= self.name.underscore.pluralize 
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    params.each do |attr_name, value|
      attr_name = attr_name.to_sym 
      self.column.each do |name|
        
      end
    end
  end

  def attributes
    @attributes ||= {}
    
  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
