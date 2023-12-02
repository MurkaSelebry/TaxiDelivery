using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using TaxiDelivery.Models;

namespace TaxiDelivery
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {

        private readonly TaxiHandlerContext _context;
        public MainWindow()
        {
            InitializeComponent();
            _context = new TaxiHandlerContext();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Fare myFare = new Fare()
            {
                Title = "Тест",
                Description="Wow"
            };
            _context.Add(myFare);
            _context.SaveChanges();

        }
    }
}