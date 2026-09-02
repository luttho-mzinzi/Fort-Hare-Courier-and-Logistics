using System;
using System.Web.UI;

namespace FCLSystem
{
    // The class must inherit from System.Web.UI.Page to clear the parser error
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Clear the tracking label on initial page load
            if (!IsPostBack)
            {
                lblTrackResult.Text = string.Empty;
            }
        }

        protected void btnTrack_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(txtTrackingNumber.Text))
            {
                // This connects to the SC5 tracking input requirement
                lblTrackResult.Text = "Retrieving tracking status for: " + txtTrackingNumber.Text;
            }
            else
            {
                lblTrackResult.Text = "Please enter a valid tracking number.";
            }
        }
    }
}