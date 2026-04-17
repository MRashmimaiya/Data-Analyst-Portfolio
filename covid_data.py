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

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# 1. Load Data
df = pd.read_csv('covid_data_project.csv')
df['date'] = pd.to_datetime(df['date'], dayfirst=True)

# 2. Filter for a specific country or aggregate
top_countries = df.groupby('country')['confirmed'].max().sort_values(ascending=False).head(5).index
df_top = df[df['country'].isin(top_countries)]

# 3. Visualization
plt.figure(figsize=(12, 6))
sns.lineplot(data=df_top, x='date', y='daily_cases', hue='country')
plt.title('Daily COVID-19 Cases: Top 5 Countries')
plt.xticks(rotation=45)
plt.tight_layout()
