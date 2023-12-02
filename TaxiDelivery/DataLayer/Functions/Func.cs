using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TaxiDelivery.Models;

namespace TaxiDelivery.DataLayer.Functions
{
    static class Func
    {
        private static TaxiHandlerContext сtx = new TaxiHandlerContext();

        public static decimal CalculateOrderCost()
        {
         

            return 500;
        }

        public static bool DeleteDriverFunction(int driverId, TaxiHandlerContext ctx)
        {
            var driverToDelete = ctx.Drivers.FirstOrDefault(d => d.IdDriver == driverId);

            if (driverToDelete != null)
            {
                ctx.Drivers.Remove(driverToDelete);
                ctx.SaveChanges();
                return true;
            }

            return false;
        }

        public static string GetClientFullName(int clientId, TaxiHandlerContext ctx)
        {
            var fullName = ctx.Clients
                .Where(c => c.IdClient == clientId)
                .Select(c => $"{c.NameFirst} {c.NameSecond}")
                .FirstOrDefault();

            return fullName ?? string.Empty;
        }

        public static string GetDriverEmail(int driverId, TaxiHandlerContext ctx)
        {
            var driverEmail = ctx.Drivers
                .Where(d => d.IdDriver == driverId)
                .Select(d => d.Email)
                .FirstOrDefault();

            return driverEmail ?? string.Empty;
        }

        public static int InsertDriverFunction(string firstName, string lastName, string phone, string email, string licenseNumber, int carId, TaxiHandlerContext ctx)
        {
            var newDriver = new Driver
            {
                NameFirst = firstName,
                NameSecond = lastName,
                Phone = phone,
                Email = email,
                NumberLicense = licenseNumber,
                IdCar = carId
            };

            ctx.Drivers.Add(newDriver);
            ctx.SaveChanges();

            return newDriver.IdDriver;
        }

        public static bool IsEmailValid(string driverEmail)
        {
            return driverEmail.Contains("@example.com");
        }
    }
}
