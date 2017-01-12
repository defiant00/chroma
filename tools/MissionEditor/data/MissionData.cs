using System.Collections.Generic;

namespace MissionEditor.data
{
	public class MissionData
	{
		public int id;
		public string name;
		public string description;
		public int locX;
		public int locY;
		public List<LevelData> levels = new List<LevelData>();

		public override string ToString()
		{
			return name;
		}
	}
}
