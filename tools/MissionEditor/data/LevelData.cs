using System.Collections.Generic;

namespace MissionEditor.data
{
	public class LevelData
	{
		public int minDays;
		public int xDim;
		public int yDim;
		public List<Tile> tiles = new List<Tile>();
		public List<Doodad> doodads = new List<Doodad>();
	}
}
