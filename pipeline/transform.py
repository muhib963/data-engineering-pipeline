import pandas as pd
from .extract import extract_data

def transform_data(df):

    # Remove cancelled invoices (InvoiceNo starting with C)
    df = df[~df["InvoiceNo"].astype(str).str.startswith("C")]

    # Remove negative quantities (returns)
    df = df[df["Quantity"] > 0]

    # Remove zero or negative price
    df = df[df["UnitPrice"] > 0]

    # Remove missing customer IDs
    df = df[df["CustomerID"].notna()]

    # Create revenue column
    df["Revenue"] = df["Quantity"] * df["UnitPrice"]

    # Convert date column
    df["InvoiceDate"] = pd.to_datetime(df["InvoiceDate"])

    print("Data cleaned successfully")

    return df