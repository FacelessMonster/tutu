class EconomyCarriage < Carriage
  after_initialize :default_values

  private
    def default_values
      self.seats ||= 54
    end

end