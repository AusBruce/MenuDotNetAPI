using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using RedMango_API.Data;
using RedMango_API.Models;
using System.Net;

namespace RedMango_API.Controllers
{
    [Route("api/MenuItem")]
    [ApiController]
    public class MenuItemController : ControllerBase
    {
        private readonly ApplicationDbContext _db;
        private readonly ApiResponse _response;
        public MenuItemController(ApplicationDbContext db)
        {
            _db = db;

            _response = new ApiResponse();
        }

        [HttpGet]
        public async Task<IActionResult> GetItemsMenu()
        {
            _response.Result = _db.MenuItems;
            _response.StatusCode = HttpStatusCode.OK;
            return Ok(_response);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetItemMenu(int id)
        {
            if (id == 0)
            {
                _response.StatusCode = HttpStatusCode.NotFound;
                return NotFound(_response);
            }

            RedMango_API.Models.MenuItem menuItem = _db.MenuItems.FirstOrDefault(u => u.Id == id);

            if (menuItem == null)
            {
                _response.StatusCode = HttpStatusCode.NotFound;
                return NotFound(_response);
            }

            _response.Result = menuItem;
            _response.StatusCode = HttpStatusCode.OK;
            return Ok(_response);
        }
    }
}
