SELECT * FROM car;


SELECT 	cr.id,
		t.name AS type, 
		mn.brand, 
		m.model_name AS model,
        y.model_year AS body, 
        y.year,
        cl.name AS color,
        r.country,
        c.city,
        cr.price AS 'price ($)'    
	FROM car cr 
		JOIN model m ON cr.model_id = m.id
        JOIN manufacturer mn ON m.manufacturer_id  = mn.id
        JOIN type t ON mn.type_id  = t.id
		JOIN year y ON m.year_id = y.id
        JOIN color cl ON cr.color_id = cl.id
        JOIN city c ON cr.city_id = c.id
        JOIN region r ON c.region_id = r.id
			ORDER BY cr.id;
        


SELECT 	t.name AS type, 
		mn.brand, 
		m.model_name AS model,
        cl.name AS color,
        r.country,
        c.city,
        cr.price AS 'price ($)'    
	FROM car cr 
		JOIN model m ON cr.model_id = m.id
        JOIN manufacturer mn ON m.manufacturer_id  = mn.id
        JOIN type t ON mn.type_id  = t.id
		JOIN color cl ON cr.color_id = cl.id
        JOIN city c ON cr.city_id = c.id
        JOIN region r ON c.region_id = r.id
			WHERE region_id = 1 
				ORDER BY mn.brand; 



SELECT 	mn.brand, 
		m.model_name AS model,
        y.model_year AS body, 
        cl.name AS color,
        r.country,
        c.city,
        cr.price AS 'price ($)'    
	FROM car cr 
		JOIN model m ON cr.model_id = m.id
        JOIN manufacturer mn ON m.manufacturer_id  = mn.id
  		JOIN year y ON m.year_id = y.id
        JOIN color cl ON cr.color_id = cl.id
        JOIN city c ON cr.city_id = c.id
        JOIN region r ON c.region_id = r.id
	WHERE region_id = 2 AND cr.price > 10000
 		ORDER BY cr.price; 
        
        
        
SELECT 	mn.brand, 
		m.model_name AS model,
        y.model_year AS body, 
        cl.name AS color,
        cr.price AS 'price ($)'    
	FROM car cr 
		JOIN model m ON cr.model_id = m.id
        JOIN manufacturer mn ON m.manufacturer_id  = mn.id
  		JOIN year y ON m.year_id = y.id
        JOIN color cl ON cr.color_id = cl.id
        	WHERE mn.brand  = 'BMW'
		ORDER BY cr.price; 

