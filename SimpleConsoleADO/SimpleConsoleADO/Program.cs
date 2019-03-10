using System;
using System.Data;
using System.Data.SqlClient;

namespace SImpleConsoleADO
{
    class Program
    {
        static void Main(string[] args)
        {
            try
            {
                using (SqlConnection sqlConn = new SqlConnection("Data Source = localhost; Initial Catalog = GeoDemo; Integrated Security = True"))
                {
                    sqlConn.Open();

                    using (SqlCommand cmd = sqlConn.CreateCommand())
                    {
                        cmd.CommandText = "SELECT city FROM Airports";

                        SqlDataReader rdr = cmd.ExecuteReader();

                        while(rdr.Read())
                        {
                            Console.WriteLine(String.Format("City: {0}", rdr["City"]));
                        }
                    }
                }
            }

            catch (Exception err)
            {
                Console.WriteLine("ERROR: {0}", err.Message);
            }

            Console.ReadKey();
        }
    }
}
