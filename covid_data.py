# pandas:
import pandas as pd
df=pd.read_csv("covid_data_project.csv")
print(df)

# missing values:
import pandas as pd
df=pd.read_csv('covid_data_project.csv')
df.dropna()
df.fillna(0)
print(df.loc[0,"date"])
print(df.iloc[0,1])

