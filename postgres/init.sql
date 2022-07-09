CREATE TABLE ip_address_cidr (id uuid, ip cidr);
CREATE INDEX ip_index ON ip_address_cidr USING gist (ip inet_ops);

INSERT INTO
    ip_address_cidr (id, ip)
VALUES
    (gen_random_uuid(), '1.1.1.1/32'),
    (gen_random_uuid(), '10.1.1.0/28'),
    (gen_random_uuid(), '1.10.1.0/24'),
    (gen_random_uuid(), '1.1.0.0/16'),
    (gen_random_uuid(), '1.0.0.0/8'),
    (gen_random_uuid(), '100.1.1.1/32'),
    (gen_random_uuid(), '1.100.1.0/28'),
    (gen_random_uuid(), '1.1.100.0/24'),
    (gen_random_uuid(), '1.1.0.0/16'),
    (gen_random_uuid(), '2.2.2.2/32'),
    (gen_random_uuid(), '20.2.2.0/28'),
    (gen_random_uuid(), '2.20.2.0/24'),
    (gen_random_uuid(), '2.2.0.0/16'),
    (gen_random_uuid(), '2.0.0.0/8'),
    (gen_random_uuid(), '200.2.2.2/32'),
    (gen_random_uuid(), '2.200.2.0/28'),
    (gen_random_uuid(), '2.2.200.0/24'),
    (gen_random_uuid(), '2.2.0.0/16')
;

CREATE TABLE ip_address_inet (id uuid, from_ip inet, to_ip inet);
CREATE INDEX from_index ON ip_address_inet using gist (from_ip inet_ops);
CREATE INDEX to_index ON ip_address_inet using gist (to_ip inet_ops);

INSERT INTO
    ip_address_inet (id, from_ip, to_ip)
VALUES
    (gen_random_uuid(), '1.1.1.1', '1.1.1.1'),
    (gen_random_uuid(), '10.1.1.0', '10.1.1.16'),
    (gen_random_uuid(), '1.10.1.0', '1.10.1.255'),
    (gen_random_uuid(), '1.1.0.0', '1.1.255.255'),
    (gen_random_uuid(), '1.0.0.0', '1.255.255.255'),
    (gen_random_uuid(), '100.1.1.1', '100.1.1.1'),
    (gen_random_uuid(), '1.100.1.0', '1.100.1.16'),
    (gen_random_uuid(), '1.1.100.0', '1.1.100.255'),
    (gen_random_uuid(), '1.1.0.0', '1.1.255.255'),
    (gen_random_uuid(), '2.2.2.2', '2.2.2.2'),
    (gen_random_uuid(), '20.2.2.0', '20.2.2.16'),
    (gen_random_uuid(), '2.20.2.0', '2.20.2.255'),
    (gen_random_uuid(), '2.2.0.0', '2.2.255.255'),
    (gen_random_uuid(), '2.0.0.0', '2.255.255.255'),
    (gen_random_uuid(), '200.2.2.2', '200.2.2.2'),
    (gen_random_uuid(), '2.200.2.0', '2.200.2.16'),
    (gen_random_uuid(), '2.2.200.0', '2.2.200.255'),
    (gen_random_uuid(), '2.2.0.0', '2.2.255.255')
;
