################################################
#
# Find and delete fields in attribute table
#
################################################

import arcpy

arcpy.env.workspace = "C:\ofaliaho\Work\example.gdb"

# List of fields to keep
excl_fields = ["Field1", "Field2", "Field3"]

# List all fields in feature class

fieldList = arcpy.ListFields("feature_class_name")

# Find unwanted fields and delete
del_fields = []

for field in fieldList:
  if field.baseName not in excl_fields:
    del_fields.append(field.basName)
    
arcpy.DeleteField_management("feature_class_name", del_fields)
