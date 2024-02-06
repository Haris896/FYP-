using System;
using System.Data.SqlClient;
using System.Threading.Tasks;
using Nethereum.Web3;
using Nethereum.Web3.Accounts;
using Nethereum.Contracts;
using Nethereum.Hex.HexTypes;
using System.Data.SqlClient;
using System.Configuration;

namespace Proj_Loan_Management.Classes
{


    public class smartCOntract
    {
        private readonly string ethereumNodeUrl;
        private readonly string contractAddress;
        private readonly string privateKey;
        // private readonly string connectionString;
        private string connectionString = ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString;

        public smartCOntract(string ethereumNodeUrl, string contractAddress, string privateKey, string connectionString)
        {
            //this.ethereumNodeUrl = ethereumNodeUrl;
            //this.contractAddress = contractAddress;
            //this.privateKey = privateKey;
            //this.connectionString = connectionString;

            ethereumNodeUrl = "https://ropsten.infura.io/v3/YOUR_INFURA_API_KEY";
            contractAddress = "0x1234567890123456789012345678901234567890";
            privateKey = "0x1234567890123456789012345678901234567890123456789012345678901234";
            //connectionString = "Server=YourServer;Database=YourDatabase;User Id=YourUsername;Password=YourPassword;";

        }

        public async Task<string> GetGreetingAsync()
        {
            var web3 = new Web3(new Account(privateKey), ethereumNodeUrl);

            var contract = web3.Eth.GetContract("YourContractABI", contractAddress);
            var getGreetingFunction = contract.GetFunction("getGreeting");

            var greeting = await getGreetingFunction.CallAsync<string>();
            return greeting;
        }


        public async Task SetGreetingAsync(string newGreeting, string borrowerAddress, uint loanAmount)
        {
            var web3 = new Web3(new Account(privateKey), ethereumNodeUrl);

            var contract = web3.Eth.GetContract("YourContractABI", contractAddress);
            var setGreetingFunction = contract.GetFunction("setGreeting");

            var gas = new HexBigInteger(21000); // Adjust the gas value as needed
            var gasPrice = new HexBigInteger(20000000000); // Adjust the gas price as needed

            var transactionInput = setGreetingFunction.CreateTransactionInput("YourEthereumAddress", contractAddress, gas, gasPrice, new HexBigInteger(0), newGreeting);

            var transactionHash = await web3.Eth.Transactions.SendTransaction.SendRequestAsync(transactionInput);

            // Optionally, you can wait for the transaction to be mined
            var receipt = await web3.Eth.Transactions.GetTransactionReceipt.SendRequestAsync(transactionHash);
            while (receipt == null)
            {
                await Task.Delay(1000);
                receipt = await web3.Eth.Transactions.GetTransactionReceipt.SendRequestAsync(transactionHash);
            }

            // Save the loan application to the database
            await SaveLoanApplicationToDatabase(borrowerAddress, loanAmount, transactionHash);
        }

        private async Task SaveLoanApplicationToDatabase(string borrowerAddress, uint loanAmount, string transactionHash)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                await connection.OpenAsync();

                string insertQuery = "INSERT INTO tbl_LoanApplications_SmartContract (BorrowerAddress, LoanAmount, TransactionHash) VALUES (@BorrowerAddress, @LoanAmount, @TransactionHash)";
                using (SqlCommand command = new SqlCommand(insertQuery, connection))
                {
                    command.Parameters.AddWithValue("@BorrowerAddress", borrowerAddress);
                    command.Parameters.AddWithValue("@LoanAmount", loanAmount);
                    command.Parameters.AddWithValue("@TransactionHash", transactionHash);

                    await command.ExecuteNonQueryAsync();
                }
            }

        }


        //public Task<string> GetGreetingAsync()
        //{
        //    var web3 = new Web3(new Account(privateKey), ethereumNodeUrl);

        //    var contract = web3.Eth.GetContract("YourContractABI", contractAddress);
        //    var getGreetingFunction = contract.GetFunction("getGreeting");

        //    //   var greeting = await getGreetingFunction.CallAsync<string>();
        //    //   var callResult = getGreetingFunction.ExecuteCall<string>();
        //    var callResult = getGreetingFunction.CallAsync<string>().Result;

        //    return Task.FromResult(callResult);
        //    //return greeting;
        //}
    }
}