using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MvcApplication6.Data;

namespace MvcApplication6.Controllers
{
    public class RatingController : Controller
    {
        //
        // GET: /Rating/

        public ActionResult Index()
        {
            using (var db = new tblRatingCategoriesContext())
            {
                var a = db.Categories.Select(x => new { Id = x.Id, Data = x.Data }).ToList();
                var b = new List<tblRatingCategories>();
                foreach (var item in a.ToList())
                {
                    b.Add(new tblRatingCategories() { Id = item.Id, Data = item.Data });
                }
                return View(b);
            }
        }

        [HttpGet]
        public ActionResult Create()
        {
            return View(new tblRatingCategories());
        }

        [HttpPost]
        public ActionResult Create(FormCollection obj)
        {
            using (var db = new tblRatingCategoriesContext())
            {
                var a = new tblRatingCategories();
                Dictionary<string, object> dic = new Dictionary<string, object>();
                foreach (var item in obj.AllKeys)
                {
                    dic.Add(item, obj[item]);
                }
                var d = Newtonsoft.Json.JsonConvert.SerializeObject(dic);
                a.Data = d;
                db.Categories.Add(a);
                db.SaveChanges();
            }
            return View(obj);
        }

        [HttpGet]
        public ActionResult UserRating(int id)
        {
            using (var db = new tblRatingCategoriesContext())
            {
                var a = db.Categories.Where(x => x.Id == id).Select(x => x).SingleOrDefault();
                return View(a);
            }
        }

        [HttpPost]
        public ActionResult UserRating(FormCollection obj)
        {
            using (var db = new tblUserRatingContext())
            {
                var a = new tblUserRating();
                Dictionary<string, object> dic = new Dictionary<string, object>();
                foreach (var item in obj.AllKeys)
                {
                    dic.Add(item, obj[item]);
                }
                var d = Newtonsoft.Json.JsonConvert.SerializeObject(dic);
                //a.Id = int.Parse(dic["user_id"].ToString());
                a.Data = d;
                db.UserRatings.Add(a);
                db.SaveChanges();
            }
            return RedirectToAction("Index");
        }

        [HttpGet]
        public ActionResult ViewRating()
        {
            using (var db = new tblUserRatingContext())
            {
                var a = db.UserRatings.Select(x => new { Id = x.Id, Data = x.Data }).ToList();
                var b = new List<tblUserRating>();
                foreach (var item in a.ToList())
                {
                    b.Add(new tblUserRating() { Id = item.Id, Data = item.Data });
                }
                return View(b);
            }
        }

    }
}
