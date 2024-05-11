using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Card_Collection_Organizer.Model
{
    public class Card
    {
        public int CardID { get; set; }
        public string CardName { get; set; }
        public string SetName { get; set; }
        public string CardType { get; set; }
        public string CreatureType { get; set; }
        public string ManaCost { get; set; }
        public int ConvertedManaCost { get; set; }
        public string Rarity { get; set; }
        public string Artist { get; set; }
        public string Effect { get; set; }
        public string FlavorText { get; set; }
        public string Power { get; set; }
        public string Toughness { get; set; }
        public int Loyalty { get; set; }
        public bool IsFoil { get; set; }
        public bool IsFlipCard { get; set; }
        public int OtherSideId { get; set; }
        //private string connectionString = "Server=.\\SQLEXPRESS;Database=mtg_database;Trusted_Connection=True;"; //ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        string connectionString;
        public Card()
        {
            connectionString = ConfigurationManager.AppSettings["MyConnectionString"];
            if (string.IsNullOrEmpty(connectionString))
            {
                throw new InvalidOperationException("Connection string 'MyConnectionString' not found or empty.");
            }
        }

        public Card GetCardByName(string cardname)
        {
            Card card = null;

            string sql = "SELECT CardID, CardName, SetName, CardType, CreatureType, ManaCost, ConvertedManaCost, Rarity, Artist, Effect, FlavorText, Power, Toughness, Loyalty, IsFoil, IsFlipCard, OtherSideId FROM Cards WHERE CardName = @cardName";

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sql, conn);
                    cmd.Parameters.AddWithValue("@cardname", cardname);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.Read())
                    {
                        card = MapRowToCard(reader);
                    }
                }
            }
            catch (SqlException ex)
            {
                throw new Exception();
            }

            return card;
        }
        public Card MapRowToCard(SqlDataReader reader)
        {
            Card card = new Card();
            card.CardID = Convert.ToInt32(reader["CardID"]);
            card.CardName = Convert.ToString(reader["CardName"]);
            card.SetName = Convert.ToString(reader["SetName"]);
            card.CardType = Convert.ToString(reader["CardType"]);
            card.CreatureType = Convert.ToString(reader["CreatureType"]);
            card.ManaCost = Convert.ToString(reader["ManaCost"]);
            card.ConvertedManaCost = Convert.ToInt32(reader["ConvertedManaCost"]);
            card.Rarity = Convert.ToString(reader["Rarity"]);
            card.Artist = Convert.ToString(reader["Artist"]);
            card.Effect = Convert.ToString(reader["Effect"]);
            card.FlavorText = Convert.ToString(reader["FlavorText"]);
            card.Power = Convert.ToString(reader["Power"]);
            card.Toughness = Convert.ToString(reader["Toughness"]);
            card.Loyalty = Convert.ToInt32(reader["Loyalty"]);
            card.IsFoil = Convert.ToBoolean(reader["IsFoil"]);
            card.IsFlipCard = Convert.ToBoolean(reader["IsFlipCard"]);
            card.OtherSideId = Convert.ToInt32(reader["OtherSideId"]);
            return card;
        }
    }


}
