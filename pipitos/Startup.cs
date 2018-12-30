using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(pipitos.Startup))]
namespace pipitos
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
