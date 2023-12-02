using System;
using System.Collections.Generic;

namespace TaxiDelivery.Models;

public partial class OrderDetail
{
    public int IdOrderDetail { get; set; }

    public DateTime DateOrder { get; set; }

    public string PaymentType { get; set; } = null!;

    public decimal Cost { get; set; }

    public string Status { get; set; } = null!;

    public virtual Order IdOrderDetailNavigation { get; set; } = null!;
}
