require 'csv'

# -----------------------------------------------------------------------------
# READ CSV FILES
# -----------------------------------------------------------------------------

def load_power_table(file)
  CSV.parse(File.read(file), headers: true, converters: :numeric)
end

def eficiency_table(file)
  CSV.parse(File.read(file), headers: true, converters: :numeric)
end

load_power_table = load_power_table("lab05-MC-PL.csv")
eficiency_table = eficiency_table("lab05-MC-eta.csv")

# -----------------------------------------------------------------------------
# CALCULATE MEAN AVERAGE
# -----------------------------------------------------------------------------

def mean_average(list)
  list.sum(0.0) / list.size
end

mean_load_power = mean_average(load_power_table["PL"])
mean_eficiency = mean_average(eficiency_table["eta"])

puts "potência na carga [média]: " + mean_load_power.to_s
puts "eficiência [média]: " + mean_eficiency.to_s

# -----------------------------------------------------------------------------
# CALCULATE VARIANCE
# -----------------------------------------------------------------------------

def variance(list, mean)
  numerator = list.sum(0.0) { |e| (e - mean) ** 2 }
  denominator = list.size
  numerator / denominator
end

load_power_variance = variance(load_power_table["PL"], mean_load_power)
eficiency_variance = variance(eficiency_table["eta"], mean_eficiency)

puts "potência na carga [variância]: " + load_power_variance.to_s
puts "eficiência [variância]: " + eficiency_variance.to_s

# -----------------------------------------------------------------------------
# CALCULATE STANDARD DEVIATION
# -----------------------------------------------------------------------------

def standard_deviation(variance)
  Math.sqrt(variance)
end

load_power_deviation = standard_deviation(load_power_variance)
eficiency_deviation = standard_deviation(eficiency_variance)

puts "potência na carga [desvio padrão]: " + load_power_deviation.to_s
puts "eficiência [desvio padrão]: " + eficiency_deviation.to_s