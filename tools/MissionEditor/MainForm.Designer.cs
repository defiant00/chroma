namespace MissionEditor
{
	partial class MainForm
	{
		/// <summary>
		/// Required designer variable.
		/// </summary>
		private System.ComponentModel.IContainer components = null;

		/// <summary>
		/// Clean up any resources being used.
		/// </summary>
		/// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
		protected override void Dispose(bool disposing)
		{
			if (disposing && (components != null))
			{
				components.Dispose();
			}
			base.Dispose(disposing);
		}

		#region Windows Form Designer generated code

		/// <summary>
		/// Required method for Designer support - do not modify
		/// the contents of this method with the code editor.
		/// </summary>
		private void InitializeComponent()
		{
			this.components = new System.ComponentModel.Container();
			this.buttonLoad = new System.Windows.Forms.Button();
			this.buttonSave = new System.Windows.Forms.Button();
			this.listBoxMissions = new System.Windows.Forms.ListBox();
			this.contextMenuStrip = new System.Windows.Forms.ContextMenuStrip(this.components);
			this.addToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.editToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.removeToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.toolStripMenuItem1 = new System.Windows.Forms.ToolStripSeparator();
			this.upToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.downToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
			this.openFileDialog = new System.Windows.Forms.OpenFileDialog();
			this.saveFileDialog = new System.Windows.Forms.SaveFileDialog();
			this.buttonAnimations = new System.Windows.Forms.Button();
			this.contextMenuStrip.SuspendLayout();
			this.SuspendLayout();
			// 
			// buttonLoad
			// 
			this.buttonLoad.Location = new System.Drawing.Point(8, 8);
			this.buttonLoad.Name = "buttonLoad";
			this.buttonLoad.Size = new System.Drawing.Size(48, 32);
			this.buttonLoad.TabIndex = 0;
			this.buttonLoad.Text = "Load";
			this.buttonLoad.UseVisualStyleBackColor = true;
			this.buttonLoad.Click += new System.EventHandler(this.buttonLoad_Click);
			// 
			// buttonSave
			// 
			this.buttonSave.Location = new System.Drawing.Point(64, 8);
			this.buttonSave.Name = "buttonSave";
			this.buttonSave.Size = new System.Drawing.Size(48, 32);
			this.buttonSave.TabIndex = 1;
			this.buttonSave.Text = "Save";
			this.buttonSave.UseVisualStyleBackColor = true;
			this.buttonSave.Click += new System.EventHandler(this.buttonSave_Click);
			// 
			// listBoxMissions
			// 
			this.listBoxMissions.ContextMenuStrip = this.contextMenuStrip;
			this.listBoxMissions.FormattingEnabled = true;
			this.listBoxMissions.Location = new System.Drawing.Point(8, 48);
			this.listBoxMissions.Name = "listBoxMissions";
			this.listBoxMissions.Size = new System.Drawing.Size(192, 342);
			this.listBoxMissions.TabIndex = 2;
			// 
			// contextMenuStrip
			// 
			this.contextMenuStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.addToolStripMenuItem,
            this.editToolStripMenuItem,
            this.removeToolStripMenuItem,
            this.toolStripMenuItem1,
            this.upToolStripMenuItem,
            this.downToolStripMenuItem});
			this.contextMenuStrip.Name = "contextMenuStrip";
			this.contextMenuStrip.Size = new System.Drawing.Size(118, 120);
			// 
			// addToolStripMenuItem
			// 
			this.addToolStripMenuItem.Name = "addToolStripMenuItem";
			this.addToolStripMenuItem.Size = new System.Drawing.Size(117, 22);
			this.addToolStripMenuItem.Text = "Add";
			this.addToolStripMenuItem.Click += new System.EventHandler(this.addToolStripMenuItem_Click);
			// 
			// editToolStripMenuItem
			// 
			this.editToolStripMenuItem.Name = "editToolStripMenuItem";
			this.editToolStripMenuItem.Size = new System.Drawing.Size(117, 22);
			this.editToolStripMenuItem.Text = "Edit";
			this.editToolStripMenuItem.Click += new System.EventHandler(this.editToolStripMenuItem_Click);
			// 
			// removeToolStripMenuItem
			// 
			this.removeToolStripMenuItem.Name = "removeToolStripMenuItem";
			this.removeToolStripMenuItem.Size = new System.Drawing.Size(117, 22);
			this.removeToolStripMenuItem.Text = "Remove";
			this.removeToolStripMenuItem.Click += new System.EventHandler(this.removeToolStripMenuItem_Click);
			// 
			// toolStripMenuItem1
			// 
			this.toolStripMenuItem1.Name = "toolStripMenuItem1";
			this.toolStripMenuItem1.Size = new System.Drawing.Size(114, 6);
			// 
			// upToolStripMenuItem
			// 
			this.upToolStripMenuItem.Name = "upToolStripMenuItem";
			this.upToolStripMenuItem.Size = new System.Drawing.Size(117, 22);
			this.upToolStripMenuItem.Text = "Up";
			this.upToolStripMenuItem.Click += new System.EventHandler(this.upToolStripMenuItem_Click);
			// 
			// downToolStripMenuItem
			// 
			this.downToolStripMenuItem.Name = "downToolStripMenuItem";
			this.downToolStripMenuItem.Size = new System.Drawing.Size(117, 22);
			this.downToolStripMenuItem.Text = "Down";
			this.downToolStripMenuItem.Click += new System.EventHandler(this.downToolStripMenuItem_Click);
			// 
			// openFileDialog
			// 
			this.openFileDialog.Filter = "JSON|*.json";
			// 
			// saveFileDialog
			// 
			this.saveFileDialog.Filter = "JSON|*.json";
			// 
			// buttonAnimations
			// 
			this.buttonAnimations.Location = new System.Drawing.Point(128, 8);
			this.buttonAnimations.Name = "buttonAnimations";
			this.buttonAnimations.Size = new System.Drawing.Size(72, 32);
			this.buttonAnimations.TabIndex = 3;
			this.buttonAnimations.Text = "Animations";
			this.buttonAnimations.UseVisualStyleBackColor = true;
			this.buttonAnimations.Click += new System.EventHandler(this.buttonAnimations_Click);
			// 
			// MainForm
			// 
			this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
			this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
			this.ClientSize = new System.Drawing.Size(208, 394);
			this.Controls.Add(this.buttonAnimations);
			this.Controls.Add(this.listBoxMissions);
			this.Controls.Add(this.buttonSave);
			this.Controls.Add(this.buttonLoad);
			this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
			this.MaximizeBox = false;
			this.Name = "MainForm";
			this.Text = "Missions";
			this.contextMenuStrip.ResumeLayout(false);
			this.ResumeLayout(false);

		}

		#endregion

		private System.Windows.Forms.Button buttonLoad;
		private System.Windows.Forms.Button buttonSave;
		private System.Windows.Forms.ListBox listBoxMissions;
		private System.Windows.Forms.OpenFileDialog openFileDialog;
		private System.Windows.Forms.SaveFileDialog saveFileDialog;
		private System.Windows.Forms.ContextMenuStrip contextMenuStrip;
		private System.Windows.Forms.ToolStripMenuItem addToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem editToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem removeToolStripMenuItem;
		private System.Windows.Forms.ToolStripSeparator toolStripMenuItem1;
		private System.Windows.Forms.ToolStripMenuItem upToolStripMenuItem;
		private System.Windows.Forms.ToolStripMenuItem downToolStripMenuItem;
		private System.Windows.Forms.Button buttonAnimations;
	}
}

