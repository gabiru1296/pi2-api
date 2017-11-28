class TankSerializer < ActiveModel::Serializer
  attributes :id, :name, :current_type_name, :number_of_fish, :number_of_days, :current_tca, :average_tca
  has_many :clusters

  def current_type_name
    c = object.clusters.where(:is_done => false).first
    if c != nil
      return c.fish_type.name
    else
      return 'Sem peixe'
    end
  end

  def number_of_fish
    c = object.clusters.where(:is_done => false).first
    if c != nil
      return c.current_total
    else
      return 0
    end
  end

  def current_tca
    c = object.clusters.where(:is_done => false).first
    if c != nil
      return c.current_tca
    else
      return nil
    end
  end

  def average_tca
    c = object.clusters.where(:is_done => false).first
    if c != nil
      return c.average_tca
    else
      return nil
    end
  end

  def number_of_days
    c = object.clusters.where(:is_done => false).first
    if c != nil
      startDate = c.created_at.to_date
      endDate = Date.today
      return (endDate - startDate).to_i
    else
      return nil
    end
  end
end
