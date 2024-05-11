using Card_Collection_Organizer.Model;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CCO_Unit_Tests.Tests
{
    [TestClass]
    public class CardTests
    {
        [TestMethod]
        public void TestGetCardByName()
        {
            Card card = new Card().GetCardByName("Cloudfin Raptor");
            Assert.AreEqual("Cloudfin Raptor", card.CardName);
            Assert.AreEqual(1, card.ConvertedManaCost);
            Assert.AreEqual("Common", card.Rarity);
        }
    }
}
