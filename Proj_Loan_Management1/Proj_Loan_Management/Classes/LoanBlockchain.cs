using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

namespace Proj_Loan_Management.Classes
{
	public class LoanBlockchain
	{
        private List<Block> blocks;
        private string connectionString;

        public LoanBlockchain()
        {
            this.connectionString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString; ;
            blocks = new List<Block>();
            // Create the genesis block
         //   AddBlock("Genesis Block");
        }

        public Block AddLoanRequest(string Customer_ID, decimal loanAmount,string Loan_ID)
        {
            string data = "Loan Request: Customer_ID="+ Customer_ID + ", Amount: '"+ loanAmount + "',Loan_ID='"+ Loan_ID + "'";
            return AddBlockNew(data, Customer_ID, Loan_ID);

        }

        public Block AddLoanInProcess(decimal loanAmount, string Customer_ID, string Loan_ID)
        {
            string data = "Loan In Process: Customer_ID=" + Customer_ID + ", Amount: '" + loanAmount + "',Loan_ID='" + Loan_ID + "'";
            return AddBlock(data, Customer_ID, Loan_ID);
            //return AddBlock(data);
        }

        public Block AddLoanApproval(decimal loanAmount, string Customer_ID, string Loan_ID)
        {
            string data = "Loan Approved: Customer_ID=" + Customer_ID + ", Amount: '" + loanAmount + "',Loan_ID='" + Loan_ID + "'";
            return AddBlock(data, Customer_ID, Loan_ID);
        }
        public Block AddLoanRejected( decimal loanAmount, string Customer_ID, string Loan_ID)
        {
            string data = "Loan Rejected: Customer_ID=" + Customer_ID + ", Amount: '" + loanAmount + "',Loan_ID='" + Loan_ID + "'";
            return AddBlock(data, Customer_ID, Loan_ID);
        }

        public Block AddLoanPayment( decimal paymentAmount, string Customer_ID, string Loan_ID)
        {
            string data = "Loan Payment: Customer_ID=" + Customer_ID + ", Amount: '" + paymentAmount + "',Loan_ID='" + Loan_ID + "'";
            return AddBlock(data, Customer_ID, Loan_ID);
        }

        private Block AddBlockNew(string data, string Customer_ID,string Loan_Id)
        {
            int index = blocks.Count;
            DateTime timestamp = DateTime.Now;
            string previousHash = index > 0 ? blocks[index - 1].Hash : "0";
            Block block = new Block(index, timestamp, previousHash, data);
            blocks.Add(block);

            // Insert blockchain data into the database
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                InsertBlockData(connection, block, Customer_ID, Loan_Id);
                connection.Close();
            }

            return block;
        }

        private Block AddBlock(string data,string Customer_ID, string Loan_Id)
        {
            DataTable Dt = new DataTable();
            Dt = LoadPrevBlock(Customer_ID);
            int index = blocks.Count;
            DateTime timestamp = DateTime.Now;
            string previousHash = Dt.Rows[0]["Hash"].ToString();
            Block block = new Block(index, timestamp, previousHash, data);
            blocks.Add(block);

            // Insert blockchain data into the database
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                InsertBlockData(connection, block, Customer_ID, Loan_Id);
                connection.Close();
            }

            return block;
        }

        //public void InsertBlockData(SqlConnection connection, Block block)
        public void InsertBlockData(SqlConnection connection, Block block,string Customer_ID, string Loan_Id)
        {
            //string insertQuery = "INSERT INTO BlockchainData (Index, Timestamp, PreviousHash, Data, Hash) " +
            //                     "VALUES (@Index, @Timestamp, @PreviousHash, @Data, @Hash)";


            string insertQuery = "INSERT INTO tbl_block_chain_ledger (transaction_id, timestamp, PreviousBlock, Data, Hash,Customer_ID,Loan_ID) " +
                                 "VALUES (@Index, @Timestamp, @PreviousHash, @Data, @Hash,@Customer_ID,@Loan_ID)";

           
            using (SqlCommand command = new SqlCommand(insertQuery, connection))
            {
                command.Parameters.AddWithValue("@Index", block.Index);
                command.Parameters.AddWithValue("@Timestamp", block.Timestamp);
                command.Parameters.AddWithValue("@PreviousHash", block.PreviousHash);
                command.Parameters.AddWithValue("@Data", block.Data);
                command.Parameters.AddWithValue("@Hash", block.Hash);
                command.Parameters.AddWithValue("@Customer_ID", Customer_ID);
                command.Parameters.AddWithValue("@Loan_ID", Loan_Id);

                command.ExecuteNonQuery();
            }
        }

        private DataTable LoadPrevBlock(string Customer_ID)
        {
            //string connectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
            DataTable dataTable = new DataTable();
            // Create a SqlConnection
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Define the SQL query
                string sqlQuery = "select Top 1 Block_ID, Hash from[tbl_block_chain_ledger] where Customer_ID = '" + Customer_ID + "' order by 1 desc";

                // Create a SqlDataAdapter and DataTable
                SqlDataAdapter adapter = new SqlDataAdapter(sqlQuery, connection);
                

                try
                {
                    // Open the connection
                    connection.Open();

                    // Fill the DataTable with data from the database
                    adapter.Fill(dataTable);
                   
                    // Now, 'dataTable' contains the data from your SQL Server table
                    // You can use it to display or manipulate the data as needed
                }
                catch (Exception ex)
                {
                    // Handle any exceptions that may occur during the process
                    ;
                }
            }
            return dataTable;
        }
        public class Block
        {
            public int Index { get; set; }
            public DateTime Timestamp { get; set; }
            public string PreviousHash { get; set; }
            public string Data { get; set; }
            public string Hash { get; set; }

            public Block(int index, DateTime timestamp, string previousHash, string data)
            {
                Index = index;
                Timestamp = timestamp;
                PreviousHash = previousHash;
                Data = data;
                Hash = CalculateHash();
            }

            public string CalculateHash()
            {
                using (SHA256 sha256 = SHA256.Create())
                {
                    string rawData = $"{Index}{Timestamp}{PreviousHash}{Data}";
                    byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(rawData));
                    StringBuilder builder = new StringBuilder();
                    foreach (byte b in bytes)
                    {
                        builder.Append(b.ToString("x2"));
                    }
                    return builder.ToString();
                }
            }
        }
    }
}
