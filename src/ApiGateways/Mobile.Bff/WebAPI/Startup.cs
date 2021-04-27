using EStore.Core.Service.WebAPI;
using Microsoft.Extensions.Configuration;

namespace WebAPI
{
    public class Startup: ServiceStartup
    {
        public Startup(IConfiguration configuration) : base(configuration)
        {
        }
    }
}