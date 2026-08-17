# need to format all charts with sns after all analysis!
import pandas as pd

customer_df = pd.read_excel(
    r'c:\Users\Adesola Badmos\Documents\practice folder\customer.xlsx'
)

print(customer_df.head(3))

import pandas as pd

orders_df = pd.read_excel(
    r'c:\Users\Adesola Badmos\Documents\practice folder\Order.xlsx'
)

print(orders_df.head(3))

merged_df = pd.merge(
    customer_df,
    orders_df,
    on='Customer_id',
    how='inner'
)

print(merged_df.head(5))


print(merged_df.tail(5))

print(merged_df.columns.tolist())
print(merged_df['Location'].head(5))

print(merged_df[['Season', 'Frequency_of_Purchases']].head(5))

print(type('season'))

print(merged_df.head())

print(len('season'))

print(len(merged_df['Season']))

# Checking for missing values
print(merged_df.isnull().sum())

# Dropping missing values
print("Number of rows before dropping missing values:", merged_df.shape[0])
merged_df = merged_df.dropna()
print("Number of rows after dropping missing values:", merged_df.shape[0])

print(merged_df.isnull().sum()) # count of missing values for each column after dropping missing values

# Checking for duplicate values
print(merged_df.duplicated().sum())

# Checking duplicated 'customer_id' values
print(merged_df['Customer_id'].duplicated())

# Dropping duplicated 'customer_id' values
merged_df = merged_df.drop_duplicates(subset='Customer_id')
print(merged_df['Customer_id'].duplicated())

# Checking duplicated 'customer_id' values
print(merged_df['Customer_id'].duplicated().sum())

merged_df = merged_df.drop_duplicates(
    subset='Customer_id',
    keep='first'
) # dropping duplicates based on 'Customer_id' column and keeping the first occurrence

print(merged_df.head(5))

merged_df = merged_df.drop_duplicates(keep='first') # dropping duplicates based on all columns and keeping the first occurrence

print(merged_df[['Sub_Category', 'Location']].head(5)) # displaying the first 5 rows of 'Sub_Category' and 'Location' columns


import seaborn as sns
import matplotlib.pyplot as plt

category_data = (
    merged_df
    .groupby(['Category', 'Sub_Category'])
    .size()
    .reset_index(name='Sales')
)

# Sort by Sales from highest to lowest
category_data = category_data.sort_values('Sales', ascending=False)

# Get the ordered sub-categories
sub_category_order = category_data['Sub_Category'].tolist()

plt.figure(figsize=(12, 6))

sns.barplot(
    data=category_data,
    x='Sub_Category',
    y='Sales',
    hue='Category',
    order=sub_category_order
)

plt.title('Sales by Product and Product_Category')
plt.xlabel('Products')
plt.ylabel('Number of Sales')
plt.xticks(rotation=45)

plt.tight_layout()
plt.show()


top_5_products = merged_df['Sub_Category'].value_counts().head(5)
print(top_5_products) # displaying the top 5 products based on the number of sales

top_5_Locations = merged_df['Location'].value_counts().head(5)
print(top_5_Locations) # displaying the top 5 locations based on the number of sales


# Framing top 5 products based on the average review rating
top_5_reviewed_products= (
merged_df[['Sub_Category', 'Review_Rating']]\
.groupby('Sub_Category')\
.mean()\
.sort_values('Review_Rating', ascending=False)\
.head(5)
)


# frequency of purchases by season
seasonal_frequency = (merged_df.groupby('Season')['Frequency_of_Purchases']\
                      .count().reset_index()
                      )
print(seasonal_frequency) # displaying the total frequency of purchases for each season

# sortig the seasonal frequency data by the number of purchases in descending order
seasonal_frequency = seasonal_frequency.sort_values('Frequency_of_Purchases', ascending=False)

print(merged_df[['Order_Date', 'Ship_Mode']].head(5))

Highest_ship_mode = merged_df['Ship_Mode'].value_counts().head(3)
print(Highest_ship_mode) # displaying the most frequently used shipping mode

# which products were shipped using the most common shipping mode, and season?
highest_ship_mode = merged_df['Ship_Mode'].mode()[0]
products_shipped = merged_df[
    merged_df['Ship_Mode'] == highest_ship_mode
]
print(products_shipped[['Sub_Category', 'Ship_Mode', 'Season']].head(5)) # displaying the products shipped using the most common shipping mode and their corresponding season


# The most frequent order_date and number of orders on that date
most_frequent_order_date_and_number = merged_df['Order_Date'].value_counts().head(1)
print(most_frequent_order_date_and_number)

# The most frequent order_date alone.
most_frequent_order_date = merged_df['Order_Date'].mode()[0]
print(most_frequent_order_date.strftime('%d/%m/%Y'))
    

# Checking the value of subscription status.
print(merged_df['Subscription_Status'].value_counts().head(5))

# Checking the % of subscription status.
print(merged_df['Subscription_Status'].value_counts(normalize=True) * 100)






#CHARTS

# Plotting the top products by sales
import matplotlib.pyplot as plt
top_5_products = merged_df['Sub_Category'].value_counts(ascending=False).head(5)
plt.figure(figsize=(10, 6))
plt.bar(top_5_products.index, top_5_products.values, color='navy')
plt.title('Top 5 Products by Sales')
plt.xlabel('Products')
plt.ylabel('Number of Sales')
plt.xticks(rotation=45)

plt.tight_layout()
plt.show()


# Plotting the top locations by sales
import matplotlib.pyplot as plt
top_5_Locations = merged_df['Location'].value_counts().head(5)
plt.figure(figsize=(10, 6))
plt.bar(top_5_Locations.index, top_5_Locations.values, color='navy')
plt.title('Top 5 Locations by Sales')
plt.xlabel('Location')
plt.ylabel('Number of Sales')
plt.xticks(rotation=45)

plt.tight_layout()
plt.show()


# Plotting the top products by average review rating. did some chasnges to the title label
import matplotlib.pyplot as plt

top_5_reviewed_products = (
    merged_df[['Sub_Category', 'Review_Rating']]
    .groupby('Sub_Category')
    .mean()
    .sort_values('Review_Rating', ascending=False)
    .head(5)
)

plt.figure(figsize=(10, 6))

plt.pie(
    top_5_reviewed_products['Review_Rating'],
    labels=top_5_reviewed_products.index,
    autopct='%1.1f%%'
)

plt.title('Top Products by Average Review Rating')
plt.xlabel(' ') 
plt.ylabel(' ')

plt.tight_layout()
plt.show()


# sortig the seasonal frequency data by the number of purchases in descending order
seasonal_frequency = seasonal_frequency.sort_values('Frequency_of_Purchases', ascending=False)
# Which season has the most purchase records?
import matplotlib.pyplot as plt
plt.figure(figsize=(10, 6))
plt.bar(
    seasonal_frequency['Season'],
    seasonal_frequency['Frequency_of_Purchases'],
    color='navy'
)

plt.title('Purchase Frequency by Season')
plt.xlabel('Season')
plt.ylabel(' ')

plt.tight_layout()
plt.show()



# plt the % of subscription status.
import matplotlib.pyplot as plt

subscription = (
    merged_df['Subscription_Status']
    .value_counts(normalize=True) * 100
)

plt.figure(figsize=(7, 7))

plt.pie(
    subscription,
    labels=subscription.index,
    autopct='%1.1f%%'
)

plt.title('Customers Subscription Status')
plt.show()