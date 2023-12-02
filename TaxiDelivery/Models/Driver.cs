using System;
using System.Collections.Generic;

namespace TaxiDelivery.Models;

public partial class Driver
{
    public int IdDriver { get; set; }

    public string NameFirst { get; set; } = null!;

    public string NameSecond { get; set; } = null!;

    public string Phone { get; set; } = null!;

    public string Email { get; set; } = null!;

    public string NumberLicense { get; set; } = null!;

    public int IdCar { get; set; }

    public virtual Car IdCarNavigation { get; set; } = null!;

    public virtual ICollection<Order> Orders { get; } = new List<Order>();
}
