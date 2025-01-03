using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using RedMango_API.Data;

namespace RedMango_API.Controllers
{
    [Route("api/MeunItem")] 
    [ApiController]
    public class MenuItem : ControllerBase
    {
        private readonly ApplicationDbContext _db;

        public MenuItem(ApplicationDbContext db)
        {
            _db = db;
        }

        [HttpGet]   

        public async Task<IActionResult> GetItemsMenu()
        {
            return Ok( _db.MenuItems);
        }
    }
}
