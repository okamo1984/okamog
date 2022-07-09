EXPLAIN SELECT * FROM ip_address_cidr
WHERE 
    '1.11.1.1' << ip
    AND '2.2.2.22' << ip
    AND '2.2.2.22' << ip
    AND '22.2.2.22' << ip
    AND '2.2.22.22' << ip
    AND '2.22.2.22' << ip
    AND '222.2.2.22' << ip
    AND '2.2.2.22' << ip
    AND '2.23.2.22' << ip
    AND '42.2.2.22' << ip
    AND '52.2.2.22' << ip
    AND '62.2.2.22' << ip
    AND '72.2.2.22' << ip
    AND '82.2.2.22' << ip
    AND '92.2.2.22' << ip
    AND '112.2.2.22' << ip
    AND '232.2.2.22' << ip
    AND '2.221.2.22' << ip
    AND '2.2.231.22' << ip
    AND '2.2.2.232' << ip
;

EXPLAIN SELECT * FROM ip_address_inet
WHERE 
    '1.11.1.1' BETWEEN from_ip AND to_ip
    AND '2.2.2.22' BETWEEN from_ip AND to_ip
    AND '2.2.2.22' BETWEEN from_ip AND to_ip
    AND '22.2.2.22' BETWEEN from_ip AND to_ip
    AND '2.2.22.22' BETWEEN from_ip AND to_ip
    AND '2.22.2.22' BETWEEN from_ip AND to_ip
    AND '222.2.2.22' BETWEEN from_ip AND to_ip
    AND '2.2.2.22' BETWEEN from_ip AND to_ip
    AND '2.23.2.22' BETWEEN from_ip AND to_ip
    AND '42.2.2.22' BETWEEN from_ip AND to_ip
    AND '52.2.2.22' BETWEEN from_ip AND to_ip
    AND '62.2.2.22' BETWEEN from_ip AND to_ip
    AND '72.2.2.22' BETWEEN from_ip AND to_ip
    AND '82.2.2.22' BETWEEN from_ip AND to_ip
    AND '92.2.2.22' BETWEEN from_ip AND to_ip
    AND '112.2.2.22' BETWEEN from_ip AND to_ip
    AND '232.2.2.22' BETWEEN from_ip AND to_ip
    AND '2.221.2.22' BETWEEN from_ip AND to_ip
    AND '2.2.231.22' BETWEEN from_ip AND to_ip
    AND '2.2.2.232' BETWEEN from_ip AND to_ip
;
