using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data;
using System.Diagnostics;
using System.Linq;
using System.Runtime.ConstrainedExecution;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using TaxiDelivery.Models;

namespace taxi
{
    public partial class Admin : Window
    {
        public static TaxiHandlerContext ctx = new TaxiHandlerContext();

        public Admin()
        {
            InitializeComponent();
            LoadTables();
            // Инициализация списка машин (загрузка из базы данных)
            //Cars = LoadCarsFromDatabase();
            //carDataGrid.ItemsSource = Cars;

            // Инициализация списка цен (загрузка из базы данных)
        //    Prices = LoadPricesFromDatabase();
        //    priceDataGrid.ItemsSource = Prices;
        }

        public partial class TableName
        {
            public string TABLE_NAME { get; set; }
        }

        private void LoadTables()
        {
            

            var schemaTable = ctx.VwTableNames.FromSqlRaw("SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE' AND TABLE_SCHEMA='taxi_handler'");
            List<string> tableNames = schemaTable.Select(row => row.TableName).ToList();

            tableComboBox.ItemsSource = tableNames;
            tableComboBox.SelectedIndex = 0;

        }
        private List<object> GetTableData(string tableName)
        {
            var query = $"SELECT * FROM {tableName}";
            List<object> tableData = new List<object>();
            switch (tableName)
            {
                case "cars":
                    tableData = ctx.Cars.FromSqlRaw(query).Cast<object>().ToList();
                    break;
                case "clients":
                    tableData = ctx.Clients.FromSqlRaw(query).Cast<object>().ToList();
                    break;
                case "drivers": 
                    tableData = ctx.Drivers.FromSqlRaw(query).Cast<object>().ToList();
                    break;
                case "fares":
                    tableData = ctx.Fares.FromSqlRaw(query).Cast<object>().ToList();
                    break;
                case "orders":
                    tableData = ctx.Orders.FromSqlRaw(query).Cast<object>().ToList();
                    break;
                case "order details":
                    query = $"SELECT * FROM `{tableName}`";
                    tableData = ctx.OrderDetails.FromSqlRaw(query).Cast<object>().ToList();
                    break;
                case "rates":
                    tableData = ctx.Rates.FromSqlRaw(query).Cast<object>().ToList();
                    break;
                
            }
            return tableData;
        }
        private void TableComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var selectedTable = tableComboBox.SelectedItem.ToString();
            if (!string.IsNullOrEmpty(selectedTable))
            {
                var tableData = GetTableData(selectedTable);

                dataGrid.Columns.Clear(); // Очистить предыдущие колонки
                dataGrid.ItemsSource = tableData;

                // Создайте колонки на основе структуры выбранной таблицы
                foreach (var property in tableData.First().GetType().GetProperties())
                {
                    var column = new DataGridTextColumn
                    {
                        Header = property.Name,
                        Binding = new Binding(property.Name)
                    };

                    dataGrid.Columns.Add(column);
                }
            }
        }

   
        private void AddCar_Click(object sender, RoutedEventArgs e)
        {
            var selectedTable = tableComboBox.SelectedItem.ToString();

            switch (selectedTable)
            {
                case "cars":
                    var newCar = new Car
                    {
                        Brand="nobrand",
                        Model="nomodel",
                        YearRelease=2000,
                        Color="yellow",
                        NumberPlate="123",
                        IdFare=1
                    };
                    ctx.Cars.Add(newCar);
                    break;

                default:
                    break;
            }

            // Сохраните изменения в базе данных
            ctx.SaveChanges();

            TableComboBox_SelectionChanged(null, null);
        }

        private void EditCar_Click(object sender, RoutedEventArgs e)
        {
            var selectedTable = tableComboBox.SelectedItem.ToString();

            switch (selectedTable)
            {
                case "cars":
                    // Получите выбранный объект Car из DataGrid
                    var selectedCar = dataGrid.SelectedItem as Car;
                    if (selectedCar != null)
                    {

                    }
                    break;

                default:
                    break;
            }

            TableComboBox_SelectionChanged(null, null);
        }

        private void DeleteCar_Click(object sender, RoutedEventArgs e)
        {
            var selectedTable = tableComboBox.SelectedItem.ToString();

            switch (selectedTable)
            {
                case "cars":
                    var selectedCar = dataGrid.SelectedItem as Car;
                    if (selectedCar != null)
                    {
                        ctx.Cars.Remove(selectedCar);

                    }
                    break;
                case "fares":
                    var selectedFare = dataGrid.SelectedItem as Fare;
                    if (selectedFare != null)
                    {
                        ctx.Fares.Remove(selectedFare);
                    }
                    break;
                default:
                    break;
            }
            ctx.SaveChanges();

            TableComboBox_SelectionChanged(null, null);
        }

        private void SaveChanges_Click(object sender, RoutedEventArgs e)
        {
            // Сохраните все изменения в базе данных
            ctx.SaveChanges();
        }

    }
}
