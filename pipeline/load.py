from sqlalchemy import create_engine
import pandas as pd
from .extract import extract_data
from .transform import transform_data

# Configure your database connection
def load_data(file_path):
    engine = create_engine("postgresql://muhib:muhib123@localhost:5432/ecommercedb")
    df = extract_data(file_path)
    df = transform_data(df)
    df.to_sql('sales', engine, if_exists='replace', index=False)
    print("Data loaded into PostgreSQL successfully")