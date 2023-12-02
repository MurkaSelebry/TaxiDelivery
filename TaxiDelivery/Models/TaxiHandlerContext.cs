using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

namespace TaxiDelivery.Models;

public partial class TaxiHandlerContext : DbContext
{
    public TaxiHandlerContext()
    {
    }

    public TaxiHandlerContext(DbContextOptions<TaxiHandlerContext> options)
        : base(options)
    {
    }

    public virtual DbSet<Car> Cars { get; set; }

    public virtual DbSet<Client> Clients { get; set; }

    public virtual DbSet<Driver> Drivers { get; set; }

    public virtual DbSet<Fare> Fares { get; set; }

    public virtual DbSet<Order> Orders { get; set; }

    public virtual DbSet<OrderDetail> OrderDetails { get; set; }

    public virtual DbSet<Rate> Rates { get; set; }

    public virtual DbSet<ViewClientsNoOrder> ViewClientsNoOrders { get; set; }

    public virtual DbSet<ViewDriversCar> ViewDriversCars { get; set; }

    public virtual DbSet<ViewOrdersClient> ViewOrdersClients { get; set; }

    public virtual DbSet<ViewOrdersDetailsClient> ViewOrdersDetailsClients { get; set; }

    public virtual DbSet<ViewRatesDetailsClient> ViewRatesDetailsClients { get; set; }

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. You can avoid scaffolding the connection string by using the Name= syntax to read it from configuration - see https://go.microsoft.com/fwlink/?linkid=2131148. For more guidance on storing connection strings, see http://go.microsoft.com/fwlink/?LinkId=723263.
        => optionsBuilder.UseMySql("server=localhost;database=taxi_handler;uid=selebry;pwd=12345", Microsoft.EntityFrameworkCore.ServerVersion.Parse("8.0.35-mysql"));

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder
            .UseCollation("utf8mb4_0900_ai_ci")
            .HasCharSet("utf8mb4");

        modelBuilder.Entity<Car>(entity =>
        {
            entity.HasKey(e => e.IdCar).HasName("PRIMARY");

            entity.ToTable("cars");

            entity.HasIndex(e => e.IdFare, "id_fare");

            entity.Property(e => e.IdCar).HasColumnName("id_car");
            entity.Property(e => e.Brand)
                .HasMaxLength(100)
                .HasColumnName("brand");
            entity.Property(e => e.Color)
                .HasMaxLength(15)
                .HasColumnName("color");
            entity.Property(e => e.IdFare).HasColumnName("id_fare");
            entity.Property(e => e.Model)
                .HasMaxLength(100)
                .HasColumnName("model");
            entity.Property(e => e.NumberPlate)
                .HasMaxLength(10)
                .HasColumnName("number_plate")
                .UseCollation("utf8mb3_general_ci")
                .HasCharSet("utf8mb3");
            entity.Property(e => e.YearRelease)
                .HasColumnType("year")
                .HasColumnName("year_release");

            entity.HasOne(d => d.IdFareNavigation).WithMany(p => p.Cars)
                .HasForeignKey(d => d.IdFare)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("cars_ibfk_2");
        });

        modelBuilder.Entity<Client>(entity =>
        {
            entity.HasKey(e => e.IdClient).HasName("PRIMARY");

            entity.ToTable("clients");

            entity.Property(e => e.IdClient).HasColumnName("id_client");
            entity.Property(e => e.Email)
                .HasMaxLength(255)
                .HasColumnName("email");
            entity.Property(e => e.NameFirst)
                .HasMaxLength(25)
                .HasColumnName("name_first");
            entity.Property(e => e.NameSecond)
                .HasMaxLength(25)
                .HasColumnName("name_second");
            entity.Property(e => e.Phone)
                .HasMaxLength(255)
                .HasColumnName("phone");
        });

        modelBuilder.Entity<Driver>(entity =>
        {
            entity.HasKey(e => e.IdDriver).HasName("PRIMARY");

            entity.ToTable("drivers");

            entity.HasIndex(e => e.IdCar, "fk_drivers_cars1_idx");

            entity.Property(e => e.IdDriver).HasColumnName("id_driver");
            entity.Property(e => e.Email)
                .HasMaxLength(50)
                .HasColumnName("email");
            entity.Property(e => e.IdCar).HasColumnName("id_car");
            entity.Property(e => e.NameFirst)
                .HasMaxLength(25)
                .HasColumnName("name_first");
            entity.Property(e => e.NameSecond)
                .HasMaxLength(25)
                .HasColumnName("name_second");
            entity.Property(e => e.NumberLicense)
                .HasMaxLength(15)
                .HasColumnName("number_license");
            entity.Property(e => e.Phone)
                .HasMaxLength(20)
                .HasColumnName("phone");

            entity.HasOne(d => d.IdCarNavigation).WithMany(p => p.Drivers)
                .HasForeignKey(d => d.IdCar)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("fk_drivers_cars1");
        });

        modelBuilder.Entity<Fare>(entity =>
        {
            entity.HasKey(e => e.IdFare).HasName("PRIMARY");

            entity.ToTable("fares");

            entity.Property(e => e.IdFare).HasColumnName("id_fare");
            entity.Property(e => e.Description)
                .HasMaxLength(45)
                .HasColumnName("description");
            entity.Property(e => e.Title)
                .HasMaxLength(45)
                .HasColumnName("title");
        });

        modelBuilder.Entity<Order>(entity =>
        {
            entity.HasKey(e => e.IdOrder).HasName("PRIMARY");

            entity.ToTable("orders");

            entity.HasIndex(e => e.IdClient, "id_client");

            entity.HasIndex(e => e.IdDriver, "id_driver");

            entity.HasIndex(e => e.IdFare, "id_fare");

            entity.Property(e => e.IdOrder).HasColumnName("id_order");
            entity.Property(e => e.AddressSource)
                .HasMaxLength(255)
                .HasColumnName("address_source");
            entity.Property(e => e.AddressTarget)
                .HasMaxLength(255)
                .HasColumnName("address_target");
            entity.Property(e => e.IdClient).HasColumnName("id_client");
            entity.Property(e => e.IdDriver).HasColumnName("id_driver");
            entity.Property(e => e.IdFare).HasColumnName("id_fare");

            entity.HasOne(d => d.IdClientNavigation).WithMany(p => p.Orders)
                .HasForeignKey(d => d.IdClient)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("orders_ibfk_1");

            entity.HasOne(d => d.IdDriverNavigation).WithMany(p => p.Orders)
                .HasForeignKey(d => d.IdDriver)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("orders_ibfk_2");

            entity.HasOne(d => d.IdFareNavigation).WithMany(p => p.Orders)
                .HasForeignKey(d => d.IdFare)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("orders_ibfk_3");
        });

        modelBuilder.Entity<OrderDetail>(entity =>
        {
            entity.HasKey(e => e.IdOrderDetail).HasName("PRIMARY");

            entity.ToTable("order details");

            entity.Property(e => e.IdOrderDetail)
                .ValueGeneratedOnAdd()
                .HasColumnName("id_order_detail");
            entity.Property(e => e.Cost)
                .HasPrecision(10, 2)
                .HasColumnName("cost");
            entity.Property(e => e.DateOrder)
                .HasColumnType("datetime")
                .HasColumnName("date_order");
            entity.Property(e => e.PaymentType)
                .HasColumnType("enum('cash','card')")
                .HasColumnName("payment_type");
            entity.Property(e => e.Status)
                .HasColumnType("enum('delivery','progress','done')")
                .HasColumnName("status");

            entity.HasOne(d => d.IdOrderDetailNavigation).WithOne(p => p.OrderDetail)
                .HasForeignKey<OrderDetail>(d => d.IdOrderDetail)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("order details_ibfk_1");
        });

        modelBuilder.Entity<Rate>(entity =>
        {
            entity.HasKey(e => e.IdRate).HasName("PRIMARY");

            entity.ToTable("rates");

            entity.HasIndex(e => e.IdOrder, "id_order");

            entity.Property(e => e.IdRate).HasColumnName("id_rate");
            entity.Property(e => e.IdOrder).HasColumnName("id_order");
            entity.Property(e => e.RateClient).HasColumnName("rate_client");
            entity.Property(e => e.RateDriver).HasColumnName("rate_driver");

            entity.HasOne(d => d.IdOrderNavigation).WithMany(p => p.Rates)
                .HasForeignKey(d => d.IdOrder)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("rates_ibfk_1");
        });

        modelBuilder.Entity<ViewClientsNoOrder>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("view_clients_no_orders");

            entity.Property(e => e.Email)
                .HasMaxLength(255)
                .HasColumnName("email");
            entity.Property(e => e.IdClient).HasColumnName("id_client");
            entity.Property(e => e.NameFirst)
                .HasMaxLength(25)
                .HasColumnName("name_first");
            entity.Property(e => e.NameSecond)
                .HasMaxLength(25)
                .HasColumnName("name_second");
            entity.Property(e => e.Phone)
                .HasMaxLength(255)
                .HasColumnName("phone");
        });

        modelBuilder.Entity<ViewDriversCar>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("view_drivers_cars");

            entity.Property(e => e.Brand)
                .HasMaxLength(100)
                .HasColumnName("brand");
            entity.Property(e => e.Color)
                .HasMaxLength(15)
                .HasColumnName("color");
            entity.Property(e => e.Email)
                .HasMaxLength(50)
                .HasColumnName("email");
            entity.Property(e => e.IdCar).HasColumnName("id_car");
            entity.Property(e => e.IdDriver).HasColumnName("id_driver");
            entity.Property(e => e.Model)
                .HasMaxLength(100)
                .HasColumnName("model");
            entity.Property(e => e.NameFirst)
                .HasMaxLength(25)
                .HasColumnName("name_first");
            entity.Property(e => e.NameSecond)
                .HasMaxLength(25)
                .HasColumnName("name_second");
            entity.Property(e => e.NumberLicense)
                .HasMaxLength(15)
                .HasColumnName("number_license");
            entity.Property(e => e.Phone)
                .HasMaxLength(20)
                .HasColumnName("phone");
            entity.Property(e => e.YearRelease)
                .HasColumnType("year")
                .HasColumnName("year_release");
        });

        modelBuilder.Entity<ViewOrdersClient>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("view_orders_clients");

            entity.Property(e => e.IdOrder).HasColumnName("id_order");
            entity.Property(e => e.NameFirst)
                .HasMaxLength(25)
                .HasColumnName("name_first");
            entity.Property(e => e.NameSecond)
                .HasMaxLength(25)
                .HasColumnName("name_second");
        });

        modelBuilder.Entity<ViewOrdersDetailsClient>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("view_orders_details_clients");

            entity.Property(e => e.Cost)
                .HasPrecision(10, 2)
                .HasColumnName("cost");
            entity.Property(e => e.DateOrder)
                .HasColumnType("datetime")
                .HasColumnName("date_order");
            entity.Property(e => e.IdClient).HasColumnName("id_client");
            entity.Property(e => e.IdOrderDetail).HasColumnName("id_order_detail");
            entity.Property(e => e.NameFirst)
                .HasMaxLength(25)
                .HasColumnName("name_first");
            entity.Property(e => e.NameSecond)
                .HasMaxLength(25)
                .HasColumnName("name_second");
            entity.Property(e => e.PaymentType)
                .HasColumnType("enum('cash','card')")
                .HasColumnName("payment_type");
            entity.Property(e => e.Status)
                .HasColumnType("enum('delivery','progress','done')")
                .HasColumnName("status");
        });

        modelBuilder.Entity<ViewRatesDetailsClient>(entity =>
        {
            entity
                .HasNoKey()
                .ToView("view_rates_details_clients");

            entity.Property(e => e.Cost)
                .HasPrecision(10, 2)
                .HasColumnName("cost");
            entity.Property(e => e.DateOrder)
                .HasColumnType("datetime")
                .HasColumnName("date_order");
            entity.Property(e => e.IdClient).HasColumnName("id_client");
            entity.Property(e => e.IdOrder).HasColumnName("id_order");
            entity.Property(e => e.IdOrderDetail).HasColumnName("id_order_detail");
            entity.Property(e => e.IdRate).HasColumnName("id_rate");
            entity.Property(e => e.NameFirst)
                .HasMaxLength(25)
                .HasColumnName("name_first");
            entity.Property(e => e.NameSecond)
                .HasMaxLength(25)
                .HasColumnName("name_second");
            entity.Property(e => e.PaymentType)
                .HasColumnType("enum('cash','card')")
                .HasColumnName("payment_type");
            entity.Property(e => e.RateClient).HasColumnName("rate_client");
            entity.Property(e => e.RateDriver).HasColumnName("rate_driver");
            entity.Property(e => e.Status)
                .HasColumnType("enum('delivery','progress','done')")
                .HasColumnName("status");
        });

        OnModelCreatingPartial(modelBuilder);
    }

    partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
}
