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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Trade.Pages
{
  /// <summary>
  /// Логика взаимодействия для AuthorizationPage.xaml
  /// </summary>
  public partial class AuthorizationPage : Page
  {

    private bool isVisibleCaptcha = false;
    public AuthorizationPage()
    {
      InitializeComponent();
    }

    public delegate void AuthEventHandler(object sender, AuthEventArgs e);
    public event AuthEventHandler AuthEvent;
    public class AuthEventArgs : EventArgs
    {
      public Base.User User { get; private set; }
      public bool IsCapthca { get; private set; }

      public AuthEventArgs(Base.User user, bool isCapthca)
      {
        User = user;
        IsCapthca = isCapthca;
      }
    }
    
    private void SubmitButton_Click(object sender, RoutedEventArgs e)
    {
      Base.User user = SourceBase.tradeBase.User.FirstOrDefault(U => U.UserLogin == loginText.Text && U.UserPassword == passwordText.Password);
      if (user != null)
      {
        AuthEvent?.Invoke(this, new AuthEventArgs(user, isVisibleCaptcha));
      } 
      else
      {
        MessageBox.Show($"Пользователь не найден", "Предупреждение", MessageBoxButton.OK, MessageBoxImage.Warning);
        isVisibleCaptcha = true;
      }
        
    }

    private void GuestButton_Click(object sender, RoutedEventArgs e)
    {
      AuthEvent?.Invoke(this, new AuthEventArgs(null, false));
    }
  }
}
