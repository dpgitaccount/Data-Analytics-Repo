-- Use messy_indian_dataset-
select * from messy_indian_dataset;

                                                         ## HANDLING OTLIERS ## 
                                                         
-- finding outliers based on z-score
select *, 
      ABS(purchase_amount - avg(purchase_amount) over()) / STDDEV(purchase_amount) over() as 'Z-Score'
from messy_indian_dataset;

-- Remove outliers based on specific Z-Score
select * from
	(
		select *, 
			ABS(purchase_amount - avg(purchase_amount) over()) / STDDEV(purchase_amount) OVER() as 'z_score'
		from messy_indian_dataset
	) as sub_table where sub_table.z_score < 3;
     