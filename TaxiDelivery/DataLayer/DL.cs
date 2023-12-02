using Microsoft.EntityFrameworkCore;
using MySqlConnector;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TaxiDelivery.Models;

namespace TaxiDelivery.DataLayer
{
    public static class DL
    {
        public static TaxiHandlerContext ctx = new TaxiHandlerContext();
        public static List<OrderDetail> GetOrdersAndDetailsForDriver(int driverId)
        {
            var query = from orderDetail in ctx.OrderDetails
                        join order in ctx.Orders on orderDetail.IdOrderDetail equals order.IdOrder
                        where order.IdDriver == driverId
                        select orderDetail;

            var result = query.ToList();

            return result;


        }
        public static Driver FindDriverByEmailAndPhone(string email, string phone)
        {
            var query = from driver in ctx.Drivers
                        where driver.Email == email && driver.Phone == phone
                        select driver;

            var result = query.ToList().FirstOrDefault();

            return result;
        }
        public static List<Rate> GetRatesForDriver(int driverId)
        {
           
            var ratesForDriver = ctx.Rates
                .Where(r => ctx.Orders.Any(o => o.IdOrder == r.IdOrder && o.IdDriver == driverId))
                .ToList();

            return ratesForDriver;
        }
        public static Fare GetFareForDriver(int driverId)
        {
            string query = $@"
SELECT fares.*
FROM fares
INNER JOIN cars ON fares.id_fare = cars.id_fare
INNER JOIN drivers ON cars.id_car = drivers.id_car
WHERE drivers.id_driver = {driverId}";

            var fareForDriver = ctx.Fares.FromSqlRaw(query).FirstOrDefault();

            return fareForDriver;

        }
        public static Driver GetFirstSuitableDriver(string fare)
        {
            string query = $@"
        SELECT drivers.*
FROM drivers
INNER JOIN cars ON drivers.id_car = cars.id_car
INNER JOIN fares ON cars.id_fare = fares.id_fare
WHERE fares.title = '{fare}'
AND EXISTS (
    SELECT 1
    FROM orders
    INNER JOIN `order details` ON orders.id_order = `order details`.id_order_detail
    WHERE orders.id_driver = drivers.id_driver
    AND `order details`.`status` = 'done'
)
limit 1";

            var suitableDriver = ctx.Drivers.FromSqlRaw(query).FirstOrDefault();

            return suitableDriver;
        }
    }
}
