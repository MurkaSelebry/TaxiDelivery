using System;
using System.Collections.Generic;
using System.Linq;
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

namespace taxi
{
    public partial class Login : Window
    {
        char doc;
        public Login(char driverOrClient)
        {
            doc = driverOrClient;
            InitializeComponent();
        }
        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            string email = Email.Text;
            string phone = Phone.Text;
            //check

            switch (doc)
            {
                case 'd':
                    Driver driver = new Driver(email, phone);
                    driver.Show();
                    this.Close();
                    break;
                case 'c':
                    Client client = new Client(email, phone);
                    client.Show();
                    this.Close();
                    break;
            }
        }
    }
}
