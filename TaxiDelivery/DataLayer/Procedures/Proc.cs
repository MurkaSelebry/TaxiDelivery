using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TaxiDelivery.Models;

namespace TaxiDelivery.DataLayer.Procedures
{
    static class Proc
    {
        private static TaxiHandlerContext ctx = new TaxiHandlerContext();
        public static List<Car> GetCarsForBusinessFare()
        {
            var carsForBusinessFare = ctx.Cars // Замените Car на имя соответствующей сущности
                .Join(ctx.Fares, c => c.IdFare, f => f.IdFare, (car, fare) => new { Car = car, Fare = fare })
                .Where(joinResult => joinResult.Fare.Title == "Бизнес")
                .Select(joinResult => joinResult.Car)
                .ToList();
           
            return carsForBusinessFare;
        }
        public static void DeleteClient(int clientId, TaxiHandlerContext ctx)
        {
            var clientToDelete = ctx.Clients.FirstOrDefault(c => c.IdClient == clientId);

            if (clientToDelete != null)
            {
                ctx.Clients.Remove(clientToDelete);
                ctx.SaveChanges();
            }
        }

        public static List<Order> GetClientOrders(int clientId, TaxiHandlerContext ctx)
        {
            var clientOrders = ctx.Orders
                .Where(o => o.IdClient == clientId)
                .ToList();

            return clientOrders;
        }

        public static void InsertClient(string firstName, string lastName, string phone, string email, TaxiHandlerContext ctx)
        {
            var newClient = new Client
            {
                NameFirst = firstName,
                NameSecond = lastName,
                Phone = phone,
                Email = email
            };

            ctx.Clients.Add(newClient);
            ctx.SaveChanges();
        }

        public static void UpdateDriverPhone(int driverId, string newPhone, TaxiHandlerContext ctx)
        {
            var driverToUpdate = ctx.Drivers.FirstOrDefault(d => d.IdDriver == driverId);

            if (driverToUpdate != null)
            {
                driverToUpdate.Phone = newPhone;
                ctx.SaveChanges();
            }
        }
    }
}
