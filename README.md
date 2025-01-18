**Objective:** Using SQL to aid an online marketplace in enhancing user experience and increasing its revenue.

**Source:** 'Art Market Dataset: Selling Paintings Prediction' uploaded by Mojgan Taheri on Kaggle. 
The link to the website is as detailed: https://www.kaggle.com/datasets/jijagallery/art-market-dataset-selling-paintings-prediction.

**Description of dataset:** This dataset includes 2,500 records of paintings sold on an online art marketplace. 
From the source website, the columns of the dataset and their descriptions are as follows:
1. Name of Painter
2. Subject of Painting: Themes such as Landscape, Abstract, Portrait, etc.
3. Style: Art styles like Impressionism, Realism, Cubism, etc.
4. Medium: Materials used (e.g., Watercolor, Oil, Acrylic).
5. Size: Dimensions of the artwork.
6. Frame: Indicates if the painting is framed or not.
7. Location: Where the artist is based, ensuring consistency across records.
8. Price: Suggested retail price of the painting.
9. Delivery Time: Estimated shipping duration in days.
10. Shipment Method: Delivery options (e.g., Standard, Express).
11. Color Palette: Dominant color tones.
12. Copy or Original: Specifies if the painting is an original or a reproduction.
13. Print or Real: Indicates whether it's a physical painting or a print.
14. Recommended Environment: Suitable placement for the artwork (e.g., Living Room, Office).
15. Mood/Atmosphere: Emotional tone conveyed by the painting.
16. Lighting Requirements: Ideal lighting for display.
17. Reproduction Type: Printing techniques such as Lithograph or Giclée.
18. Target Audience: Intended buyers like art collectors, interior designers, etc.
    
**Methodology:** With the dataset, I created a 3NF relational database with the tables as follows:
1. painter: Contains description of the painters, mainly their names
2. artwork_description: Includes description of every artwork, such as its style and medium
3. artwork_sale: Stores information regarding the sale of an artwork, including its price and shipment method
4. target_audience: Lists target audiences of every artwork
These tables can be found in the database file.

Afterwards, several queries were conducted based on the database and recommendations were given on how the online art
marketplace can enhance its user experience and boost revenue. The specifics can be found in the SQL script file.
