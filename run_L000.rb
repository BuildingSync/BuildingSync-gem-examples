require 'buildingsync'
require 'buildingsync/generator'  # This will not be needed in the future. The BuildingSync gem will include this by default in the next version
require 'buildingsync/translator'

xml_file = 'L000_OpenStudio_Pre-Simulation_01.xml'
output_folder = "output/#{File.basename(xml_file, '.*')}"
# EPW file path has to be the full path.
epw_file_path = File.expand_path('weather/USA_IL_Chicago-OHare.Intl.AP.725300_TMY3.epw')
# Remove the old results
if Dir.exist?(output_folder)
  FileUtils.rm_rf(output_folder)
end
FileUtils.mkdir_p(output_folder)

selection_tool = BuildingSync::SelectionTool.new(xml_file, '2.2.0')
validity = selection_tool.validate_schema
puts "The instance #{xml_file} validity was #{validity}"

unless validity
  puts "The BuildingSync file was not valid for the use case specified on the Selection Tool, will not continue"
  exit(1)
end

# Now translate to OpenStudio
translator = BuildingSync::Translator.new(xml_file, output_folder, epw_file_path)

# setup and run the sizing run
translator.setup_and_sizing_run

# now generate all of the osws
translator.write_osws

# run all simulations
translator.run_osws

# There is only one model in this example file. See the L100 for a simulation with multiple scenarios.
# translator.gather_results(output_folder)

# Add in UserDefinedFields, which contain information about the
# OpenStudio model run
translator.prepare_final_xml

# write results to xml
# currently the save is relative to where the simulations run. I don't think that should be the case
save_file_name = "#{File.basename(xml_file, '.*')}_results.xml"
translator.save_xml(File.join(save_file_name))
