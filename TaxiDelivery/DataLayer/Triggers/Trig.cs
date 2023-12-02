using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TaxiDelivery.Models;
using TaxiDelivery.DataLayer.Functions;
namespace TaxiDelivery.DataLayer.Triggers
{
    static class Trig
    {
        private static TaxiHandlerContext ctx = new TaxiHandlerContext();
        public class TaxiHandlerTriggers
        {
            public event EventHandler<RateEventArgs> UpdateOrderStatusOnRateTriggered;
            public event EventHandler<OrderDetailsEventArgs> CheckOrderPaymentTypeTriggered;
            public event EventHandler<DriverEventArgs> ValidateDriverEmailTriggered;

            public void OnRateInserted(Rate rate, TaxiHandlerContext ctx)
            {
                UpdateOrderStatusOnRateTriggered?.Invoke(this, new RateEventArgs(rate, ctx));
            }

            public void OnOrderDetailsInserting(OrderDetail orderDetail)
            {
                CheckOrderPaymentTypeTriggered?.Invoke(this, new OrderDetailsEventArgs(orderDetail));
            }

            public void OnDriverInserting(Driver driver)
            {
                ValidateDriverEmailTriggered?.Invoke(this, new DriverEventArgs(driver));
            }
        }

        public class RateEventArgs : EventArgs
        {
            public Rate Rate { get; }
            public TaxiHandlerContext Context { get; }

            public RateEventArgs(Rate rate, TaxiHandlerContext context)
            {
                Rate = rate;
                Context = context;
                UpdateOrderStatusOnRate();
            }
            private void UpdateOrderStatusOnRate()
            {
                var orderDetailToUpdate = Context.OrderDetails.FirstOrDefault(od => od.IdOrderDetail == Rate.IdOrder);

                if (orderDetailToUpdate != null)
                {
                    orderDetailToUpdate.Status = "done";
                    Context.SaveChanges();
                }
            }
        }

        public class OrderDetailsEventArgs : EventArgs
        {
            public OrderDetail OrderDetail { get; }

            public OrderDetailsEventArgs(OrderDetail orderDetail)
            {
                OrderDetail = orderDetail;
            }
        }

        public class DriverEventArgs : EventArgs
        {
            public Driver Driver { get; }

            public DriverEventArgs(Driver driver)
            {
                Driver = driver;
            }
            public bool ValidateDriverEmail(string email)
            {
                return Func.IsEmailValid(email);
            }
        }


    }
}
