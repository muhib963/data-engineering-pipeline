import pandas as pd

def extract_data(file_path):
    df = pd.read_csv(file_path,engine="python",encoding="latin1")
    print("Data extracted successfully")
    return df

def transform_data(df):
    # Example transformations
    df['InvoiceDate'] = pd.to_datetime(df['InvoiceDate'])
    df['total_price'] = df['Quantity'] * df['UnitPrice']
    
    # Remove any nulls
    df = df.dropna()
    
    print("Data transformed successfully")
    return df
#%%
from sqlalchemy import create_engine

# Configure your database connection
engine = create_engine("postgresql://muhib:muhib123@localhost:5432/ecommercedb")

df = extract_data("/Users/muhiburrahman/Desktop/Projects/data_engineering_pipeline/data/data.csv")
df = transform_data(df)
    
df.to_sql('sales', engine, if_exists='replace', index=False)
print("Data loaded into PostgreSQL successfully")