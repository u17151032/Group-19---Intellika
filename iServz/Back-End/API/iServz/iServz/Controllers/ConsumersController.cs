using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using iServz.Models;

namespace iServz.Controllers
{
    public class ConsumersController : ApiController
    {
        private InternetServicesEntities db = new InternetServicesEntities();

        // GET: api/Consumers
        public IQueryable<Consumer> GetConsumers()
        {
            return db.Consumers;
        }

        // GET: api/Consumers/5
        [ResponseType(typeof(Consumer))]
        public async Task<IHttpActionResult> GetConsumer(int id)
        {
            Consumer consumer = await db.Consumers.FindAsync(id);
            if (consumer == null)
            {
                return NotFound();
            }

            return Ok(consumer);
        }

        // PUT: api/Consumers/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutConsumer(int id, Consumer consumer)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != consumer.ID)
            {
                return BadRequest();
            }

            db.Entry(consumer).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ConsumerExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Consumers
        [ResponseType(typeof(Consumer))]
        public async Task<IHttpActionResult> PostConsumer(Consumer consumer)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Consumers.Add(consumer);
            await db.SaveChangesAsync();

            return CreatedAtRoute("DefaultApi", new { id = consumer.ID }, consumer);
        }

        // DELETE: api/Consumers/5
        [ResponseType(typeof(Consumer))]
        public async Task<IHttpActionResult> DeleteConsumer(int id)
        {
            Consumer consumer = await db.Consumers.FindAsync(id);
            if (consumer == null)
            {
                return NotFound();
            }

            db.Consumers.Remove(consumer);
            await db.SaveChangesAsync();

            return Ok(consumer);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ConsumerExists(int id)
        {
            return db.Consumers.Count(e => e.ID == id) > 0;
        }
    }
}