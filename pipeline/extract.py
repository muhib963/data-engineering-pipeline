import pandas as pd

def extract_data(file_path):
    df = pd.read_csv(file_path,engine="python",encoding="latin1")
    print("Data extracted successfully")
    return df