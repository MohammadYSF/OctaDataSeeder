CREATE OR REPLACE FUNCTION insert_customerVehicleRM_proc(
    p_id UUID,
    p_customer_id UUID,
    p_vehicle_id UUID,
    p_vehicle_name VARCHAR,
    p_vehicle_code VARCHAR,
    p_vehicle_plate VARCHAR
)
RETURNS VOID AS
$$
BEGIN
    INSERT INTO "CustomerVehicleRMs" ("Id", "CustomerId", "VehicleId", "VehicleName", "VehicleCode", "VehiclePlate")
    VALUES (p_id, p_customer_id, p_vehicle_id, p_vehicle_name, p_vehicle_code, p_vehicle_plate);
END
$$
LANGUAGE plpgsql;
