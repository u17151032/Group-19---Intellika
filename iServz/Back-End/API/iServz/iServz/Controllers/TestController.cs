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
using System.Globalization;
using System.Dynamic;

namespace iServz.Controllers

{
    public class ReportsController : ApiController
    {
        private InternetServicesEntities db = new InternetServicesEntities();

        //Daily consumer demographic REPORT
        public dynamic GetReportData(int SelectedOptionID)
        {
            InternetServicesEntities db = new InternetServicesEntities();
            db.Configuration.ProxyCreationEnabled = false;
            List<Consumer> consumer = new List<Consumer>();

            switch (SelectedOptionID)
            {
                case 1:
                    consumer = db.Consumers.Include(z => z.Address).Include(z => z.Address.Surburb).Where(z => z.Age.Value >= 18 && z.Age.Value <= 19).ToList();
                    break;
                case 2:
                    consumer = db.Consumers.Include(z => z.Address).Include(z => z.Address.Surburb).Where(z => z.Age.Value >= 20 && z.Age.Value <= 29).ToList();
                    break;
                case 3:
                    consumer = db.Consumers.Include(z => z.Address).Include(z => z.Address.Surburb).Where(z => z.Age.Value >= 30 && z.Age.Value <= 39).ToList();
                    break;
                case 4:
                    consumer = db.Consumers.Include(z => z.Address).Include(z => z.Address.Surburb).Where(z => z.Age.Value >= 40 && z.Age.Value <= 49).ToList();
                    break;
                case 5:
                    consumer = db.Consumers.Include(z => z.Address).Include(z => z.Address.Surburb).Where(z => z.Age.Value >= 50 && z.Age.Value <= 59).ToList();
                    break;
                case 6:
                    consumer = db.Consumers.Include(z => z.Address).Include(z => z.Address.Surburb).Where(z => z.Age.Value >= 60).ToList();
                    break;
                case 7:
                    consumer = db.Consumers.Include(z => z.Address).Include(z => z.Address.Surburb).ToList();
                    break;
                default:
                    break;



            }
            return getReportObject(consumer);

        }

        public dynamic getReportObject(List<Consumer> consumer)
        {
            dynamic toReturn = new ExpandoObject();
            toReturn.ChartData = null;
            toReturn.Table.Data = null;

            //chart

            var genList = consumer.GroupBy(z => z.Gender);
            List<dynamic> dynamics = new List<dynamic>();

            foreach (var item in genList)
            {
                dynamic dynamic = new ExpandoObject();
                dynamic.Gender = item.Key;

                var avg = Convert.ToDouble(item.Average(z => z.Age), CultureInfo.InvariantCulture);
                dynamic.Avarage = Math.Round(avg, 2);

                dynamics.Add(dynamic);
            }

            // table
            var consumers = consumer.GroupBy(z => z.Address.Surburb.Name);
            List<dynamic> consGroups = new List<dynamic>();
            foreach (var item in consumers)
            {
                dynamic dynamic = new ExpandoObject();

                dynamic.Address.Surburb.Name = item.Key;

                var avg = Convert.ToDouble(item.Average(z => z.Age), CultureInfo.InvariantCulture);

                dynamic.Average = Math.Round(avg, 2);

                List<dynamic> cons = new List<dynamic>();
                foreach (var consumerItem in item)
                {
                    dynamic consObject = new ExpandoObject();

                    // error
                    consObject.Consumer = consumerItem.Name + "  " + consumerItem.Age;

                    cons.Add(consObject);
                }

                dynamic.cons = cons;
                consGroups.Add(dynamic);

            }

            toReturn.ChartData = dynamics;
            toReturn.TableData = consGroups;
            return toReturn;
        }



        //Daily Service Provider demographic REPORT
        public dynamic GetSPData(int SelectedOptionID)
        {
            InternetServicesEntities db = new InternetServicesEntities();
            db.Configuration.ProxyCreationEnabled = false;
            List<ServiceProvider> serviceProviders = new List<ServiceProvider>();

            switch (SelectedOptionID)
            {
                case 1:
                    serviceProviders = db.ServiceProviders.Include(z => z.Address).Include(z => z.Address.Surburb).Where(z => z.Age.Value >= 18 && z.Age.Value <= 19).ToList();
                    break;
                case 2:
                    serviceProviders = db.ServiceProviders.Include(z => z.Address).Include(z => z.Address.Surburb).Where(z => z.Age.Value >= 20 && z.Age.Value <= 29).ToList();
                    break;
                case 3:
                    serviceProviders = db.ServiceProviders.Include(z => z.Address).Include(z => z.Address.Surburb).Where(z => z.Age.Value >= 30 && z.Age.Value <= 39).ToList();
                    break;
                case 4:
                    serviceProviders = db.ServiceProviders.Include(z => z.Address).Include(z => z.Address.Surburb).Where(z => z.Age.Value >= 40 && z.Age.Value <= 49).ToList();
                    break;
                case 5:
                    serviceProviders = db.ServiceProviders.Include(z => z.Address).Include(z => z.Address.Surburb).Where(z => z.Age.Value >= 50 && z.Age.Value <= 59).ToList();
                    break;
                case 6:
                    serviceProviders = db.ServiceProviders.Include(z => z.Address).Include(z => z.Address.Surburb).Where(z => z.Age.Value >= 60).ToList();
                    break;
                case 7:
                    serviceProviders = db.ServiceProviders.Include(z => z.Address).Include(z => z.Address.Surburb).ToList();
                    break;
                default:
                    break;



            }
            return getReportObject(consumer);

        }

        public dynamic getReportObject(List<Consumer> consumer)
        {
            dynamic toReturn = new ExpandoObject();
            toReturn.ChartData = null;
            toReturn.Table.Data = null;

            //chart

            var genList = consumer.GroupBy(z => z.Gender);
            List<dynamic> dynamics = new List<dynamic>();

            foreach (var item in genList)
            {
                dynamic dynamic = new ExpandoObject();
                dynamic.Gender = item.Key;

                var avg = Convert.ToDouble(item.Average(z => z.Age), CultureInfo.InvariantCulture);
                dynamic.Avarage = Math.Round(avg, 2);

                dynamics.Add(dynamic);
            }

            // table
            var consumers = consumer.GroupBy(z => z.Address.Surburb.Name);
            List<dynamic> consGroups = new List<dynamic>();
            foreach (var item in consumers)
            {
                dynamic dynamic = new ExpandoObject();

                dynamic.Address.Surburb.Name = item.Key;

                var avg = Convert.ToDouble(item.Average(z => z.Age), CultureInfo.InvariantCulture);

                dynamic.Average = Math.Round(avg, 2);

                List<dynamic> cons = new List<dynamic>();
                foreach (var consumerItem in item)
                {
                    dynamic consObject = new ExpandoObject();

                    // error
                    consObject.Consumer = consumerItem.Name + "  " + consumerItem.Age;

                    cons.Add(consObject);
                }

                dynamic.cons = cons;
                consGroups.Add(dynamic);

            }

            toReturn.ChartData = dynamics;
            toReturn.TableData = consGroups;
            return toReturn;
        }
        //Sales Report

        // Admin list

        // services list

    }
}
