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
using static Trade.Pages.AuthorizationPage;

namespace Trade
{
  /// <summary>
  /// Логика взаимодействия для AuthorizationWindow.xaml
  /// </summary>
  public partial class AuthorizationWindow : Window
  {

    private Pages.AuthorizationPage authPage;
    private Pages.CaptchaPage captchaPage;
    private Base.User user;
    public AuthorizationWindow()
    {
      InitializeComponent();
      authPage = new Pages.AuthorizationPage();
      captchaPage = new Pages.CaptchaPage();
      RootFrame.Navigate(authPage);
      authPage.AuthEvent += AuthEventHandler;
      captchaPage.CaptchaEvent += CapthcaEventHandler;
    }

    private void OpenMainWindow()
    {
      MainWindow.user = user;
      MainWindow window = new MainWindow();
      Hide();
      window.Show();
      Close();
    }

    private void AuthEventHandler(object sender, AuthEventArgs e)
    {
      user = e.User;
      if (user == null)
      {
        OpenMainWindow();
        return;
      }
       
      if (e.IsCapthca)
      {
        RootFrame.Navigate(captchaPage);
      } else
      {
        OpenMainWindow();
      }
     
    }

    private void CapthcaEventHandler(object sender, EventArgs e)
    {
      OpenMainWindow();
    }

  }
}
