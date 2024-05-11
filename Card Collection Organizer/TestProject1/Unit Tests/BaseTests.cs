using System.Data.SqlClient;
using System.Transactions;

namespace Test.TestDAO
{
    [TestClass]
    public class BaseTests
    {
        private const string AdminConnectionString = @"Server=.\SQLEXPRESS;Database=mtg_dadtabase;Trusted_Connection=True;";
        protected const string connectionString = @"Server=.\SQLEXPRESS;Database=test_database;Trusted_Connection=True;";
        /// <summary>
        /// The transaction for each test.
        /// </summary>
        
        private TransactionScope transaction;
        [AssemblyInitialize]
        public static void BeforeAllTests(TestContext context)
        {
            //string sql = File.ReadAllText("C:\\Users\\10035\\Workspace\\Card-Collection-Organizer\\Card Collection Organizer\\TestProject1\\Test Database\\createTestData.sql");
            //using (SqlConnection conn = new SqlConnection(AdminConnectionString))
            //{
            //    conn.Open();
            //    SqlCommand cmd = new SqlCommand(sql, conn);
            //    cmd.ExecuteNonQuery();
            //}
            //string sql2 = File.ReadAllText("C:\\Users\\10035\\Workspace\\Card-Collection-Organizer\\Card Collection Organizer\\TestProject1\\Test Database\\testData.sql");
            //using (SqlConnection conn = new SqlConnection(connectionString))
            //{
            //    conn.Open();
            //    SqlCommand cmd = new SqlCommand(sql2, conn);
            //    SqlDataReader reader = cmd.ExecuteReader();
            //}
        }
        [AssemblyCleanup]
        public static void AfterAllTests()
        {
            // drop the temporary database
            string sql = File.ReadAllText("C:\\Users\\10035\\Workspace\\Card-Collection-Organizer\\Card Collection Organizer\\TestProject1\\Test Database\\dropTestData.sql");
            using (SqlConnection conn = new SqlConnection(AdminConnectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.ExecuteNonQuery();
            }
        }
        [TestInitialize]
        public virtual void Setup()
        {
            // Begin the transaction
            transaction = new TransactionScope();
        }
        [TestCleanup]
        public void Cleanup()
        {
            // Roll back the transaction
            transaction.Dispose();
        }
    }
}
