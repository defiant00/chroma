using MissionEditor.data;
using System;
using System.Windows.Forms;

namespace MissionEditor
{
	public partial class EditMission : Form
	{
		private MissionData mission;

		public EditMission(MissionData mission)
		{
			this.mission = mission;

			InitializeComponent();

			textBoxName.Text = mission.name;
		}

		private void textBoxName_TextChanged(object sender, EventArgs e)
		{
			mission.name = textBoxName.Text;
		}
	}
}
