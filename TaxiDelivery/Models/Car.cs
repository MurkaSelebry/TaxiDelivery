using System;
using System.Collections.Generic;

namespace TaxiDelivery.Models;

public partial class Car
{
    public int IdCar { get; set; }

    public string Brand { get; set; } = null!;

    public string Model { get; set; } = null!;

    public short YearRelease { get; set; }

    public string Color { get; set; } = null!;

    public string NumberPlate { get; set; } = null!;

    public int IdFare { get; set; }

    public virtual ICollection<Driver> Drivers { get; } = new List<Driver>();

    public virtual Fare IdFareNavigation { get; set; } = null!;
}
