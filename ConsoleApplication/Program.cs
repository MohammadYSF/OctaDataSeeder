using Faker;
using Microsoft.AspNetCore.Identity;
using Npgsql;
using System.Diagnostics;
using System.Runtime.CompilerServices;
using System.Text;
using System.Xml.Linq;
class DummyUser
{

}
class AuthSeeder
{
    string connectionString = $"Server=localhost;Port=5432;Username=octauser;Password=octapass;Database=octa_auth";
    void ClearAuthDb()
    {
        using var connection = new NpgsqlConnection(connectionString);
        connection.Open();

        using var command = new NpgsqlCommand("clear_auth_db", connection);
        command.CommandType = System.Data.CommandType.StoredProcedure;
        // Execute the function
        command.ExecuteNonQuery();
    }

    void Seed()
    {

    }
}
class OctaWriteDbSeeder
{
    string connectionString = $"Server=localhost;Port=5432;Username=octauser;Password=octapass;Database=octa-api";
    void ClearWriteDb()
    {
        using var connection = new NpgsqlConnection(connectionString);
        connection.Open();

        using var command = new NpgsqlCommand("clear_write_db", connection);
        command.CommandType = System.Data.CommandType.StoredProcedure;
        // Execute the function
        command.ExecuteNonQuery();
    }

    void Seed()
    {

    }
}

class OctaReadDbSeeder
{
    string read_connectionString = $"Server=localhost;Port=5432;Username=octauser;Password=octapass;Database=octa-api_query";
    string write_connectionString = $"Server=localhost;Port=5432;Username=octauser;Password=octapass;Database=octa-api";
    string auth_connectionString = $"Server=localhost;Port=5432;Username=octauser;Password=octapass;Database=octa_auth";
    public void PrepareAuth()
    {
        string scriptFolderPath = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "scripts/auth_db");
        string[] scriptFiles = Directory.GetFiles(scriptFolderPath, "*.sql");
        //string[] scriptFiles = Directory.GetFiles("scripts/auth_db", "*.sql");
        foreach (var item in scriptFiles)
        {
            string script = File.ReadAllText(item, Encoding.UTF8);
            using var connection = new NpgsqlConnection(auth_connectionString);
            connection.Open();
            using var command = new NpgsqlCommand(script, connection);
            command.ExecuteNonQuery();

        }
    }
    public void PrepareRead()
    {
        string[] scriptFiles = Directory.GetFiles("scripts/read_db", "*.sql");
        foreach (var item in scriptFiles)
        {
            string script = File.ReadAllText(item, Encoding.UTF8);
            using var connection = new NpgsqlConnection(read_connectionString);
            connection.Open();
            using var command = new NpgsqlCommand(script, connection);
            command.ExecuteNonQuery();

        }
    }
    public void PrepareWrite()
    {
        string[] scriptFiles = Directory.GetFiles("scripts/write_db", "*.sql");
        foreach (var item in scriptFiles)
        {
            string script = File.ReadAllText(item, Encoding.UTF8);
            using var connection = new NpgsqlConnection(write_connectionString);
            connection.Open();
            using var command = new NpgsqlCommand(script, connection);
            command.ExecuteNonQuery();

        }
    }
    public void ClearAuthDb()
    {
        using var connection = new NpgsqlConnection(auth_connectionString);
        connection.Open();

        using var command = new NpgsqlCommand("select clear_auth_db()", connection);
        command.CommandType = System.Data.CommandType.Text;
        // Execute the function
        command.ExecuteNonQuery();
    }
    public void ClearReadDb()
    {
        using var connection = new NpgsqlConnection(read_connectionString);
        connection.Open();

        using var command = new NpgsqlCommand("select clear_read_db()", connection);
        command.CommandType = System.Data.CommandType.Text;
        // Execute the function
        command.ExecuteNonQuery();
    }

    public void Seed()
    {
        var passwordHasher = new PasswordHasher<DummyUser>();
        Guid roleIdBusinessOwner = Guid.NewGuid();
        Guid roleIdCustomer = Guid.NewGuid();
        Guid roleIdWorker = Guid.NewGuid();
        string roleNameBusinessOwner = "BusinessOwner";
        string roleNameCustomer = "Customer";
        string roleNameWokrer = "Worker";
        Auth_InsertIntoAspNetRole(roleIdBusinessOwner, roleNameBusinessOwner, roleNameBusinessOwner.Normalize(), Guid.NewGuid().ToString());
        Auth_InsertIntoAspNetRole(roleIdCustomer, roleNameCustomer, roleNameCustomer.Normalize(), Guid.NewGuid().ToString());
        Auth_InsertIntoAspNetRole(roleIdWorker, roleNameWokrer, roleNameWokrer.Normalize(), Guid.NewGuid().ToString());
        for (int i = 0; i < 100; i++)
        {
            Console.WriteLine("i= " + i);
            {
                int code = Faker.Number.RandomNumber();
                var buyDate = Faker.Date.Past().ToUniversalTime();
                Guid id = Guid.NewGuid();
                Guid buyInvoiceId = Guid.NewGuid();
                long totalPrice = Faker.Number.RandomNumber(100000, 100000000);
                InsertBuyInvoiceRM(id, buyInvoiceId, buyDate, code, totalPrice);
            }

            Guid inventoryItemRMId = Guid.NewGuid();
            Guid inventoryItemId = Guid.NewGuid();
            string inventoryItemCode = Faker.Number.RandomNumber().ToString();
            string inventoryItemName = Faker.Commerce.ProductName();
            float inventoryItemCount = (float)Faker.Number.Double();
            long inventoryItemBuyPrice = Faker.Number.RandomNumber(10000, 1000000000);
            long inventoryItemSellPrice = Faker.Number.RandomNumber(inventoryItemBuyPrice, 1000000000);
            DateTime inventoryItemFromDate = Faker.Date.Recent();
            DateTime? inventoryItemToDate = null;
            bool inventoryItemIsDeleted = false;
            InsertInventoryItemRM(inventoryItemRMId, inventoryItemId, inventoryItemCode, inventoryItemName, inventoryItemCount, inventoryItemBuyPrice, inventoryItemSellPrice, inventoryItemFromDate, inventoryItemToDate, inventoryItemIsDeleted);

            Guid serviceId = Guid.NewGuid();
            long serviceDeafaultPrice = Faker.Number.RandomNumber(10000, 1000000);
            string serviceCode = Faker.Number.RandomNumber().ToString();
            {
                Guid id = Guid.NewGuid();
                string name = Faker.Lorem.Word();
                DateTime fromDate = Faker.Date.Past();
                DateTime? toDate = null;
                bool IsDeleted = false;
                InsertIntoServiceRM(id, serviceId, name, serviceCode, serviceDeafaultPrice, fromDate, toDate, IsDeleted);

            }
            {
                Guid customerId = Guid.NewGuid();
                string customerFirstName = Faker.Name.FirstName();
                string customerLastName = Faker.Name.LastName();
                string customerCode = Faker.Number.RandomNumber().ToString();
                string vehicleName = Faker.Lorem.Word();
                string vehicleName2 = Faker.Lorem.Word();
                string vehicleCode = Faker.Number.RandomNumber().ToString();
                string vehicleCode2 = Faker.Number.RandomNumber().ToString();
                string vehiclePlate = Faker.Lorem.Word();
                string vehiclePlate2 = Faker.Lorem.Word();
                {
                    Guid id = Guid.NewGuid();
                    string phoneNumber = Faker.Phone.GetPhoneNumber();
                    InsertCustomerRM(id, customerId, customerFirstName, customerLastName, customerCode, phoneNumber);
                    Guid userId = Guid.NewGuid();
                    Auth_InsertIntoAspNetUser(userId, customerFirstName, customerLastName, customerCode, customerCode.Normalize(), null, null, true, passwordHasher.HashPassword(null, phoneNumber), Guid.NewGuid().ToString(), Guid.NewGuid().ToString(), phoneNumber, true, false, null, true, 0);
                    Auth_InsertIntoAspNetUserRole(userId, roleIdCustomer);
                }
                {
                    Guid id = Guid.NewGuid();
                    Guid id2 = Guid.NewGuid();
                    Guid vehicleId = Guid.NewGuid();
                    Guid vehicleId2 = Guid.NewGuid();

                    InsertCustomerVehicleRM(id, customerId, vehicleId, vehicleName, vehicleCode, vehiclePlate);
                    InsertCustomerVehicleRM(id2, customerId, vehicleId2, vehicleName2, vehicleCode2, vehiclePlate2);
                    InsertIntoVehicleRM(id, vehicleId, vehicleCode, vehicleName);
                    InsertIntoVehicleRM(id2, vehicleId2, vehicleCode2, vehicleName2);
                }

                {
                    Guid id = Guid.NewGuid();
                    Guid sellInvoiceId = Guid.NewGuid();
                    string code = Faker.Number.RandomNumber().ToString();
                    DateTime sellInvoiceDate = Faker.Date.Recent();
                    long totalPrice = Faker.Number.RandomNumber();
                    long totalPriceWhenUsingBuyPrice = Faker.Number.RandomNumber((int)totalPrice);
                    long tax = 0;
                    long discount = 0;
                    long toPay = totalPrice;
                    long toPayWhenUsingBuyPrice = totalPriceWhenUsingBuyPrice;
                    bool useBuyPrice = true;

                    InsertIntoSellInvoiceRM(id, sellInvoiceId, code, sellInvoiceDate, totalPrice, totalPriceWhenUsingBuyPrice, tax, discount, toPay, toPayWhenUsingBuyPrice, useBuyPrice, customerCode, customerFirstName, customerLastName, vehicleCode, vehiclePlate);

                    Guid sellInvoiceServiceRMId = Guid.NewGuid();
                    long price = Faker.Number.RandomNumber(serviceDeafaultPrice, 1000000);
                    InsertIntoSellInvoiceServiceRM(sellInvoiceServiceRMId, sellInvoiceId, serviceId, serviceCode, serviceDeafaultPrice, price);

                    Guid sellInvoiceInventoryItemRMId = Guid.NewGuid();
                    InsertIntoSellInvoiceInventoryItemRM(sellInvoiceInventoryItemRMId, sellInvoiceId, inventoryItemId, inventoryItemCode, inventoryItemCount, inventoryItemBuyPrice, inventoryItemSellPrice);
                }

            }



        }
    }
    void Auth_InsertIntoAspNetUserRole(Guid userId, Guid roleId)
    {
        using var connection = new NpgsqlConnection(auth_connectionString);
        connection.Open();
        using var command = new NpgsqlCommand($"select insert_AspNetUserRole('{userId}','{roleId}')", connection);
        command.CommandType = System.Data.CommandType.Text;
        command.ExecuteNonQuery();
    }
    void Auth_InsertIntoAspNetRole(Guid id, string name, string normalizedName, string concurrencyStamp)
    {
        using var connection = new NpgsqlConnection(auth_connectionString);
        connection.Open();
        using var command = new NpgsqlCommand($"select insert_aspnet_role('{id}','{name}','{normalizedName}','{concurrencyStamp}')", connection);
        command.CommandType = System.Data.CommandType.Text;
        command.ExecuteNonQuery();
    }
    void Auth_InsertIntoAspNetUser(Guid id, string firstName, string lastName, string username, string normalizedUsername, string? email, string? normalizedEmail, bool emailConfirmed, string passwordHash, string securityStamp, string concurrencyStamp, string phoneNumber, bool phoneNumberConfirmed, bool twoFactorEnabled, DateTime? lockOutEndDate, bool lockOutEnabled, int accessFailedCount)
    {
        string lockOutEndDateString = lockOutEndDate.HasValue ? $"\'{lockOutEndDate.Value}\'" : "null";
        string emailString = !string.IsNullOrEmpty(email) ? $"\'{email}\'" : "null";
        string normalizedEmailString = !string.IsNullOrEmpty(normalizedEmail) ? $"\'{normalizedEmail}\'" : "null";
        using var connection = new NpgsqlConnection(auth_connectionString);
        connection.Open();
        using var command = new NpgsqlCommand($"select insert_AspNetUser('{id}','{firstName}','{lastName}','{username}','{normalizedUsername}',{emailString},{normalizedEmailString},{emailConfirmed},'{passwordHash}','{securityStamp}','{concurrencyStamp}','{phoneNumber}',{phoneNumberConfirmed},{twoFactorEnabled},{lockOutEndDateString},{lockOutEnabled},{accessFailedCount})", connection);
        command.CommandType = System.Data.CommandType.Text;
        command.ExecuteNonQuery();
    }
    void InsertIntoSellInvoiceInventoryItemRM(Guid id, Guid sellInvoiceId, Guid inventoryItemId, string inventoryItemCode, float count, long buyPrice, long sellPrice)
    {
        using var connection = new NpgsqlConnection(read_connectionString);
        connection.Open();
        using var command = new NpgsqlCommand($"select insert_sellInvoiceInventoryItemRM_proc('{id}','{sellInvoiceId}','{inventoryItemId}','{inventoryItemCode}',{count},{buyPrice},{sellPrice})", connection);
        command.CommandType = System.Data.CommandType.Text;
        command.ExecuteNonQuery();
    }
    //todo
    void InsertIntoSellInvoiceServiceRM(Guid id, Guid sellInvoiceId, Guid serviceId, string serviceCode, long defaultPrice, long price)
    {
        using var connection = new NpgsqlConnection(read_connectionString);
        connection.Open();
        using var command = new NpgsqlCommand($"select insert_sellInvoiceServiceRM_proc('{id}','{sellInvoiceId}','{serviceId}','{serviceCode}',{defaultPrice},{price})", connection);
        command.CommandType = System.Data.CommandType.Text;
        command.ExecuteNonQuery();
    }
    //todo
    void InsertIntoSellInvoiceRM(Guid id, Guid sellInvoiceId, string code, DateTime sellInvoiceDate, long totalPrice, long totalPriceWhenUsingBuyPrice, long tax, long discount, long toPay, long toPayWhenUsingBuyPrice, bool useBuyPrice, string customerCode, string customerFirstName, string customerLastName, string vehicleCode, string vehicleName)
    {
        using var connection = new NpgsqlConnection(read_connectionString);
        connection.Open();
        using var command = new NpgsqlCommand($"select insert_sellInvoiceRM_proc('{id}','{sellInvoiceId}','{code}','{sellInvoiceDate}','{customerFirstName + " " + customerLastName}','{customerCode}','{vehicleName}','{vehicleCode}',{totalPrice},{totalPriceWhenUsingBuyPrice},{tax},{discount},{toPay},{toPayWhenUsingBuyPrice},{useBuyPrice})", connection);
        command.CommandType = System.Data.CommandType.Text;
        command.ExecuteNonQuery();
    }
    //done
    void InsertIntoServiceRM(Guid id, Guid serviceId, string name, string code, long defaultPrice, DateTime fromDate, DateTime? toDate, bool isDeleted)
    {
        string toDateString = toDate.HasValue ? $"\'{toDate.Value}\'" : "null";

        using var connection = new NpgsqlConnection(read_connectionString);
        connection.Open();
        using var command = new NpgsqlCommand($"select insert_serviceRM_proc('{id}','{serviceId}','{code}','{name}',{defaultPrice},'{fromDate}',{toDateString},'{isDeleted}')", connection);
        command.CommandType = System.Data.CommandType.Text;
        command.ExecuteNonQuery();
    }
    //done
    void InsertIntoVehicleRM(Guid id, Guid vehicleId, string code, string name)
    {
        using var connection = new NpgsqlConnection(read_connectionString);
        connection.Open();
        using var command = new NpgsqlCommand($"select insert_vehicleRM_proc('{id}','{vehicleId}','{code}','{name}')", connection);
        command.CommandType = System.Data.CommandType.Text;
        command.ExecuteNonQuery();
    }
    //done
    void InsertCustomerVehicleRM(Guid id, Guid customerId, Guid vehicleId, string vehicleName, string vehicleCode, string vehiclePlate)
    {
        using var connection = new NpgsqlConnection(read_connectionString);
        connection.Open();
        using var command = new NpgsqlCommand($"select insert_customerVehicleRM_proc('{id}','{customerId}','{vehicleId}','{vehicleName}','{vehicleCode}','{vehiclePlate}')", connection);
        command.CommandType = System.Data.CommandType.Text;
        command.ExecuteNonQuery();
    }
    //done
    void InsertCustomerRM(Guid id, Guid customerId, string firstName, string lastName, string code, string phoneNumber)
    {
        using var connection = new NpgsqlConnection(read_connectionString);
        connection.Open();
        using var command = new NpgsqlCommand($"select insert_customerRM_proc('{id}','{customerId}','{firstName}','{lastName}','{code}','{phoneNumber}')", connection);
        command.CommandType = System.Data.CommandType.Text;
        command.ExecuteNonQuery();
    }
    //done
    void InsertInventoryItemRM(Guid id, Guid inventoryItemId, string code, string name, float count, long buyPrice, long sellPrice, DateTime fromDate, DateTime? toDate, bool isDeleted)
    {
        string toDateString = toDate.HasValue ? $"\'{toDate.Value}\'" : "null";
        using var connection = new NpgsqlConnection(read_connectionString);
        connection.Open();
        using var command = new NpgsqlCommand($"select insert_inventoryItemRM_proc('{id}','{inventoryItemId}','{code}','{name}',{count},{buyPrice},{sellPrice},'{fromDate}',{toDateString},{isDeleted})", connection);
        command.CommandType = System.Data.CommandType.Text;
        command.ExecuteNonQuery();
    }
    string ToPostgresDate(DateTime dt)
    {
        var x = $"{dt.Year}-{dt.Month}-{dt.Day}";
        return x;
    }
    //done
    void InsertBuyInvoiceRM(Guid id, Guid buyInvoiceId, DateTime buyDate, int code, long totalPrice)
    {
        using var connection = new NpgsqlConnection(read_connectionString);
        connection.Open();
        using var command = new NpgsqlCommand($"select insert_buyInvoiceRM_proc('{id}','{buyInvoiceId}','{code}','{buyDate}',{totalPrice})", connection);
        command.CommandType = System.Data.CommandType.Text;
        command.ExecuteNonQuery();
    }
}

class Program
{

    static void ClearAuthDb()
    {

    }
    static void Main()
    {
        var readSeader = new OctaReadDbSeeder();
        Console.WriteLine("start");
        readSeader.PrepareAuth();
        readSeader.PrepareRead();
        readSeader.PrepareWrite();
        readSeader.ClearReadDb();
        readSeader.ClearAuthDb();
        readSeader.Seed();
        Console.WriteLine("end");
    }
}
