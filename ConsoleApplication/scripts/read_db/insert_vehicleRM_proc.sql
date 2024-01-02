CREATE OR REPLACE FUNCTION insert_vehicleRM_proc(
    p_id UUID,
    p_vehicle_id UUID,
    p_vehicle_code VARCHAR,
    p_vehicle_name VARCHAR
)
RETURNS VOID AS
$$
BEGIN
    INSERT INTO "VehicleRMs" (
        "Id",
        "VehicleId",
        "VehicleCode",
        "VehicleName"
    )
    VALUES (
        p_id,
        p_vehicle_id,
        p_vehicle_code,
        p_vehicle_name
    );
END;
$$
LANGUAGE plpgsql;
