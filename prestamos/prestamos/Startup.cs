using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(prestamos.Startup))]
namespace prestamos
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
