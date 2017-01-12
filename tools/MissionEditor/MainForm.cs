using MissionEditor.data;
using Newtonsoft.Json;
using System;
using System.IO;
using System.Windows.Forms;

namespace MissionEditor
{
	public partial class MainForm : Form
	{
		private StaticData data;

		private MissionData Selected
		{
			get { return listBoxMissions.SelectedItem as MissionData; }
		}

		public MainForm()
		{
			data = new StaticData();

			InitializeComponent();
		}

		private void PopulateList()
		{
			listBoxMissions.Items.Clear();
			foreach (var m in data.missions)
			{
				listBoxMissions.Items.Add(m);
			}
		}

		private void buttonLoad_Click(object sender, EventArgs e)
		{
			if (openFileDialog.ShowDialog() == DialogResult.OK)
			{
				data = JsonConvert.DeserializeObject<StaticData>(File.ReadAllText(openFileDialog.FileName));
				PopulateList();
			}
		}

		private void buttonSave_Click(object sender, EventArgs e)
		{
			saveFileDialog.FileName = openFileDialog.FileName;
			if (saveFileDialog.ShowDialog() == DialogResult.OK)
			{
				File.WriteAllText(saveFileDialog.FileName, JsonConvert.SerializeObject(data, Formatting.Indented));
			}
		}

		private void addToolStripMenuItem_Click(object sender, EventArgs e)
		{
			data.missions.Add(new MissionData { name = "new" });
			PopulateList();
		}

		private void editToolStripMenuItem_Click(object sender, EventArgs e)
		{
			if (Selected != null)
			{
				var m = new EditMission(Selected);
				m.ShowDialog();
				PopulateList();
			}
		}

		private void removeToolStripMenuItem_Click(object sender, EventArgs e)
		{
			if (Selected != null)
			{
				data.missions.Remove(Selected);
				PopulateList();
			}
		}

		private void upToolStripMenuItem_Click(object sender, EventArgs e)
		{
			if (Selected != null)
			{
				int ind = data.missions.IndexOf(Selected);
				swap(ind - 1);
			}
		}

		private void downToolStripMenuItem_Click(object sender, EventArgs e)
		{
			if (Selected != null)
			{
				int ind = data.missions.IndexOf(Selected);
				swap(ind);
			}
		}

		private void swap(int index)
		{
			var m = data.missions[index];
			data.missions.RemoveAt(index);
			data.missions.Insert(index + 1, m);
			PopulateList();
		}

		private void buttonAnimations_Click(object sender, EventArgs e)
		{
			var a = new EditAnimations(data.animations);
			a.ShowDialog();
		}
	}
}
