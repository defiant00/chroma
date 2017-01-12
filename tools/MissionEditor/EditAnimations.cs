using MissionEditor.data;
using System.Collections.Generic;
using System.Windows.Forms;

namespace MissionEditor
{
	public partial class EditAnimations : Form
	{
		private List<Animation> animations;

		public EditAnimations(List<Animation> animations)
		{
			this.animations = animations;

			InitializeComponent();
		}
	}
}
