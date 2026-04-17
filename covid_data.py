# dictionary:
# data={"name":"John","age":25}
# print(data["name"])

# list comprehension:
# squares=[x**2 for x in range(5)]
# print(squares)

# append() and extend():
# a=[1,2]
# a.append(3)
# print(a)

# numpy:
# import numpy as np
# arr=np.array([1,2,3])
# print(arr)

# pandas:
import pandas as pd
df=pd.read_csv("covid_data_project.csv")
print(df)

# missing values:
# import pandas as pd
# df=pd.read_csv('covid_data_project.csv')
# df.dropna()
# df.fillna(0)
# print(df.loc[0,"date"])
# print(df.iloc[0,1])

