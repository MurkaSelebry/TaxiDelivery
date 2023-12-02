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
    /// <summary>
    /// Логика взаимодействия для LoginOrSignUp.xaml
    /// </summary>
    public partial class LoginOrSignUp : Window
    {
        char doc;
        public LoginOrSignUp(char driverOrClient)
        {
            doc = driverOrClient;
            InitializeComponent();
        }
        private void Login_Click(object sender, RoutedEventArgs e)
        {
            Login login = new Login(doc);
            login.Show();
            this.Close();
        }
        private void SignUp_Click(object sender, RoutedEventArgs e)
        {
            switch (doc)
            {
                case 'd':
                    DriverSighUp driverSignUp = new DriverSighUp();
                    driverSignUp.Show();
                    this.Close();
                    break;
                case 'c':
                    ClientSignUp clientSignUp = new ClientSignUp();
                    clientSignUp.Show();
                    this.Close();
                    break;
            }
        }
    }
}
