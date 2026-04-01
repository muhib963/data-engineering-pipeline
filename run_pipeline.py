from pipeline.extract import extract_data
from pipeline.transform import transform_data
from pipeline.load import load_data


file_path = "data/data.csv"
df = extract_data(file_path)
df = transform_data(df)
load_data(file_path)
print("Full ETL pipeline executed successfully!")