using System.Collections.Generic;

namespace MissionEditor.data
{
	public class Animation
	{
		public string name;
		public List<int> indices = new List<int>();
		public int frameRate;
		public bool looped;
		public bool flipX;
		public bool flipY;
	}
}
